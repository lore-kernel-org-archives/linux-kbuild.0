Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38945 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756245AbeARNzz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jan 2018 08:55:55 -0500
MIME-Version: 1.0
In-Reply-To: <20180114113820.19017-2-ulfalizer@gmail.com>
References: <20180114113345.18623-1-ulfalizer@gmail.com> <20180114113820.19017-1-ulfalizer@gmail.com>
 <20180114113820.19017-2-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 22:54:58 +0900
Message-ID: <CAK7LNATr0RyqfHz6tRLnbiLGcGMXzvTZBFvqmUX6J12KcV4KGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Improve auto. menu documentation accuracy
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-14 20:38 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> An 'if', 'menu', or 'choice' that depends on a preceding symbol will
> also generate a submenu.
>
> No functional changes. Only comments updated.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/menu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 1f7bcceacde3..86031dc36f7d 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -414,9 +414,10 @@ void menu_finalize(struct menu *parent)
>                         menu_finalize(menu);
>         } else if (sym) {
>                 /*
> -                * Automatic submenu creation. If sym, A, B, C, ..., are
> -                * consecutive symbols and A, B, C, ... all depend on sym, the
> -                * following menu structure will be created:
> +                * Automatic submenu creation. If sym is a symbol and A, B, C,
> +                * ... are consecutive items (symbols, menus, ifs, etc.) that
> +                * all depend on sym, then the following menu structure is
> +                * created:
>                  *
>                  *      sym
>                  *       +-A
> @@ -425,7 +426,7 @@ void menu_finalize(struct menu *parent)
>                  *       ...
>                  *
>                  * This also works recursively, giving the following structure
> -                * if B depends on A:
> +                * if A is a symbol and B depends on A:
>                  *
>                  *      sym
>                  *       +-A
> --
> 2.14.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


I squashed this into the previous patch:
https://patchwork.kernel.org/patch/9991939/

Thanks!


-- 
Best Regards
Masahiro Yamada
