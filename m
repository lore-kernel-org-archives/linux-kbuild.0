Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:20748 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbeLHG4L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Dec 2018 01:56:11 -0500
MIME-Version: 1.0
References: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1543569352-4899-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 8 Dec 2018 15:55:27 +0900
Message-ID: <CAK7LNAT3P8JQ9Ej-cDMOEAYYGkSfomRAdEfGVDMuB5foeDdJSA@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: remove unneeded setsym label in conf_read_simple()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Nov 30, 2018 at 6:17 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The two 'goto setsym' statements are reachable only when sym == NULL.
>
> The code below the 'setsym:' label does nothing when sym == NULL
> since there is just one if-block guarded by 'if (sym && ...)'.
>
> Hence, 'goto setsym' can be replaced with 'continue'.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild/kconfig.



>  scripts/kconfig/confdata.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 91d0a5c..1e35529 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -363,7 +363,7 @@ int conf_read_simple(const char *name, int def)
>                                 sym = sym_find(line + 2 + strlen(CONFIG_));
>                                 if (!sym) {
>                                         sym_add_change_count(1);
> -                                       goto setsym;
> +                                       continue;
>                                 }
>                         } else {
>                                 sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
> @@ -397,7 +397,7 @@ int conf_read_simple(const char *name, int def)
>                                 sym = sym_find(line + strlen(CONFIG_));
>                                 if (!sym) {
>                                         sym_add_change_count(1);
> -                                       goto setsym;
> +                                       continue;
>                                 }
>                         } else {
>                                 sym = sym_lookup(line + strlen(CONFIG_), 0);
> @@ -416,7 +416,7 @@ int conf_read_simple(const char *name, int def)
>
>                         continue;
>                 }
> -setsym:
> +
>                 if (sym && sym_is_choice_value(sym)) {
>                         struct symbol *cs = prop_get_symbol(sym_get_choice_prop(sym));
>                         switch (sym->def[def].tri) {
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
