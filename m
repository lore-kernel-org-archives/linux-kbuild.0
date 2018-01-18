Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56880 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755690AbeARNvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Jan 2018 08:51:04 -0500
MIME-Version: 1.0
In-Reply-To: <20180114095620.12088-1-ulfalizer@gmail.com>
References: <20180114095620.12088-1-ulfalizer@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 22:50:11 +0900
Message-ID: <CAK7LNATyu22dUa1Y2Yif4e7wyngTZ8D0HGtHH6wzx59f2OL5NA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Document SYMBOL_OPTIONAL logic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-01-14 18:56 GMT+09:00 Ulf Magnusson <ulfalizer@gmail.com>:
> Not obvious, especially if you don't already know how choices are
> implemented.
>
> No functional changes. Only comments added.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  scripts/kconfig/menu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 92d3f06cd8a2..372eb5d9fef3 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -548,6 +548,15 @@ void menu_finalize(struct menu *parent)
>                 sym->flags |= SYMBOL_WARNED;
>         }
>
> +       /*
> +        * For non-optional choices, add a reverse dependency (corresponding to
> +        * a select) of '<visibility> && m'. This prevents the user from
> +        * setting the choice mode to 'n' when the choice is visible.
> +        *
> +        * This would also work for non-choice symbols, but only non-optional
> +        * choices clear SYMBOL_OPTIONAL as of writing. Choices are implemented
> +        * as a type of symbol.
> +        */
>         if (sym && !sym_is_optional(sym) && parent->prompt) {
>                 sym->rev_dep.expr = expr_alloc_or(sym->rev_dep.expr,
>                                 expr_alloc_and(parent->prompt->visible.expr,
> --


Applied to linux-kbuild/kconfig.  Thanks!



-- 
Best Regards
Masahiro Yamada
