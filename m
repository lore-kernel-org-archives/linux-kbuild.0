Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26071 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbeHNFef (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Aug 2018 01:34:35 -0400
MIME-Version: 1.0
In-Reply-To: <1533797226-6547-1-git-send-email-yamada.masahiro@socionext.com>
References: <1533797226-6547-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Aug 2018 11:48:31 +0900
Message-ID: <CAK7LNASRUBmk4Eux-x2qr1v53CYaEBvV7uDmaur84BoxotSXKA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix the rule of mainmenu_stmt symbol
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-08-09 15:47 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The rule of mainmenu_stmt does not have debug print of zconf_lineno(),
> but if it had, it would print a wrong line number for the same reason
> as commit b2d00d7c61c8 ("kconfig: fix line numbers for if-entries in
> menu tree").
>
> The mainmenu_stmt does not need to eat following empty lines because
> they are reduced to common_stmt.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild/kconfig.

>  scripts/kconfig/zconf.y | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
> index 4b68272..95a4fd3 100644
> --- a/scripts/kconfig/zconf.y
> +++ b/scripts/kconfig/zconf.y
> @@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
>  static struct menu *current_menu, *current_entry;
>
>  %}
> -%expect 31
> +%expect 30
>
>  %union
>  {
> @@ -117,7 +117,7 @@ start: mainmenu_stmt stmt_list | stmt_list;
>
>  /* mainmenu entry */
>
> -mainmenu_stmt: T_MAINMENU prompt nl
> +mainmenu_stmt: T_MAINMENU prompt T_EOL
>  {
>         menu_add_prompt(P_MENU, $2, NULL);
>  };
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
