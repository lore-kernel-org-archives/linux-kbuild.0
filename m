Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:46184 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751354AbeBMGLc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 01:11:32 -0500
Received: by mail-vk0-f68.google.com with SMTP id e125so10220559vkh.13
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 22:11:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 13 Feb 2018 07:11:31 +0100
Message-ID: <CAFkk2KSw2XXx69VDVSR-_7nMW71L6-a9SxG2-vUtyT7W3m2gbA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print reverse dependencies on new line consistently
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Petr Vorel <petr.vorel@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>

On Tue, Feb 13, 2018 at 1:56 AM, Eugeniu Rosca <roscaeugeniu@gmail.com> wro=
te:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> Commit 1ccb27143360 ("kconfig: make "Selected by:" and "Implied by:"
> readable") made an incredible improvement in how reverse dependencies
> are perceived by the user, by breaking down the single (often
> interminable) expression string into small readable chunks, each of
> them displayed on a separate line:
>
> Selected by:
> - A & B
> - C & (D || E)
>
> Unfortunately, what happens with the non-OR (either E_SYMBOL or E_AND)
> expressions is that they don't get a dedicated line:
>
> Selected by: F & G
>
> That's arguably a bug/misbehavior, but it makes the implementation of
> something like below more complicated:
>
> Selected by:
> - [m] F & G /* where (F & G) evaluates to '=3Dm' */
>
> Adding '[m]', '[y]' or '[ ]' to the left side of each reverse dependency
> is subject of a different commit. The purpose of current commit is to
> print the 'Selected by:' and 'Implied by:' expressions on a separate
> line _consistently_.
>
> An example of change contributed by this commit is seen below.
>
> =E2=94=82 Symbol: NEED_SG_DMA_LENGTH [=3Dy]
> =E2=94=82 ...
> =E2=94=82   Selected by: IOMMU_DMA [=3Dy] && IOMMU_SUPPORT [=3Dy]
>
> becomes:
>
> =E2=94=82 Symbol: NEED_SG_DMA_LENGTH [=3Dy]
> =E2=94=82 ...
> =E2=94=82   Selected by:
> =E2=94=82   - IOMMU_DMA [=3Dy] && IOMMU_SUPPORT [=3Dy]
>
> This patch has been tested using a custom variant of zconfdump which
> prints the reverse dependencies for each config symbol.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Suggested-by: Ulf Magnusson <ulfalizer@gmail.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
>  scripts/kconfig/expr.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index d45381986ac7..0704bcdf4c78 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1179,6 +1179,16 @@ struct expr *expr_simplify_unmet_dep(struct expr *=
e1, struct expr *e2)
>         return expr_get_leftmost_symbol(ret);
>  }
>
> +static void
> +expr_print_newline(struct expr *e,
> +                  void (*fn)(void *, struct symbol *, const char *),
> +                  void *data,
> +                  int prevtoken)
> +{
> +       fn(data, NULL, "\n  - ");
> +       expr_print(e, fn, data, prevtoken);
> +}
> +
>  static void __expr_print(struct expr *e, void (*fn)(void *, struct symbo=
l *, const char *), void *data, int prevtoken, bool revdep)
>  {
>         if (!e) {
> @@ -1191,7 +1201,10 @@ static void __expr_print(struct expr *e, void (*fn=
)(void *, struct symbol *, con
>         switch (e->type) {
>         case E_SYMBOL:
>                 if (e->left.sym->name)
> -                       fn(data, e->left.sym, e->left.sym->name);
> +                       if (revdep)
> +                               expr_print_newline(e, fn, data, E_OR);
> +                       else
> +                               fn(data, e->left.sym, e->left.sym->name);
>                 else
>                         fn(data, NULL, "<choice>");
>                 break;
> @@ -1234,19 +1247,19 @@ static void __expr_print(struct expr *e, void (*f=
n)(void *, struct symbol *, con
>                 fn(data, e->right.sym, e->right.sym->name);
>                 break;
>         case E_OR:
> -               if (revdep && e->left.expr->type !=3D E_OR)
> -                       fn(data, NULL, "\n  - ");
>                 __expr_print(e->left.expr, fn, data, E_OR, revdep);
> -               if (revdep)
> -                       fn(data, NULL, "\n  - ");
> -               else
> +               if (!revdep)
>                         fn(data, NULL, " || ");
>                 __expr_print(e->right.expr, fn, data, E_OR, revdep);
>                 break;
>         case E_AND:
> -               expr_print(e->left.expr, fn, data, E_AND);
> -               fn(data, NULL, " && ");
> -               expr_print(e->right.expr, fn, data, E_AND);
> +               if (revdep) {
> +                       expr_print_newline(e, fn, data, E_OR);
> +               } else {
> +                       expr_print(e->left.expr, fn, data, E_AND);
> +                       fn(data, NULL, " && ");
> +                       expr_print(e->right.expr, fn, data, E_AND);
> +               }
>                 break;
>         case E_LIST:
>                 fn(data, e->right.sym, e->right.sym->name);
> --
> 2.16.1
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
