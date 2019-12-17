Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18008 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQFz6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 00:55:58 -0500
MIME-Version: 1.0
References: <20191217041424.29285-1-masahiroy@kernel.org> <20191217041424.29285-3-masahiroy@kernel.org>
In-Reply-To: <20191217041424.29285-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 14:55:11 +0900
Message-ID: <CAK7LNAREowHti15Ob4sgGbChTN6zYHYueyhdtVhC2KHK08rCmg@mail.gmail.com>
Subject: Re: [PATCH 2/8] kconfig: use parent->dep as the parentdep of 'menu'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 17, 2019 at 1:14 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> In menu_finalize(), the dependency of a menu entry is propagated
> downwards.
>
> For the 'menu', ->dep and ->prompt->visible.expr are the same.

Just for clarification, this means
parent->dep and parent->prompt->visible.expr
have the same expression.

expr_eq(parent->dep, parent->prompt->visible.expr)
should return 1.



> Both accumulate the 'depends on' of itself and upper menu entries.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kconfig/menu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b1b1ee8cf987..bbabf0a59ac4 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -326,12 +326,10 @@ void menu_finalize(struct menu *parent)
>                          * choice value symbols.
>                          */
>                         parentdep = expr_alloc_symbol(sym);
> -               } else if (parent->prompt)
> -                       /* Menu node for 'menu' */
> -                       parentdep = parent->prompt->visible.expr;
> -               else
> -                       /* Menu node for 'if' */
> +               } else {
> +                       /* Menu node for 'menu', 'if' */
>                         parentdep = parent->dep;
> +               }
>
>                 /* For each child menu node... */
>                 for (menu = parent->list; menu; menu = menu->next) {
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
