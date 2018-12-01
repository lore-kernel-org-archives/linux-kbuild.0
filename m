Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33103 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726577AbeLBCHe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Dec 2018 21:07:34 -0500
MIME-Version: 1.0
References: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 1 Dec 2018 23:54:11 +0900
Message-ID: <CAK7LNARvHtW9S6R7FdM10purUjWFNCFkfxDnYwnr4hB-xcMf7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] modpost: refactor seen flag clearing in add_depends()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: =?UTF-8?Q?Leonardo_Br=C3=A1s?= <leobras.c@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Nov 24, 2018 at 5:08 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> You do not need to iterate over all modules for resetting ->seen flag
> because add_depends() is only interested in modules that export symbols
> referenced from the given 'mod'.
>
> This also avoids shadowing the 'modules' parameter of add_depends().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.



>  scripts/mod/modpost.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c64066d..39432c2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2229,15 +2229,15 @@ static int add_versions(struct buffer *b, struct module *mod)
>         return err;
>  }
>
> -static void add_depends(struct buffer *b, struct module *mod,
> -                       struct module *modules)
> +static void add_depends(struct buffer *b, struct module *mod)
>  {
>         struct symbol *s;
> -       struct module *m;
>         int first = 1;
>
> -       for (m = modules; m; m = m->next)
> -               m->seen = is_vmlinux(m->name);
> +       /* Clear ->seen flag of modules that own symbols needed by this. */
> +       for (s = mod->unres; s; s = s->next)
> +               if (s->module)
> +                       s->module->seen = is_vmlinux(s->module->name);
>
>         buf_printf(b, "\n");
>         buf_printf(b, "static const char __module_depends[]\n");
> @@ -2506,7 +2506,7 @@ int main(int argc, char **argv)
>                 add_retpoline(&buf);
>                 add_staging_flag(&buf, mod->name);
>                 err |= add_versions(&buf, mod);
> -               add_depends(&buf, mod, modules);
> +               add_depends(&buf, mod);
>                 add_moddevtable(&buf, mod);
>                 add_srcversion(&buf, mod);
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
