Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:33867 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438Ab3EWI22 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 May 2013 04:28:28 -0400
Received: by mail-we0-f175.google.com with SMTP id p60so1960291wes.20
        for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2013 01:28:27 -0700 (PDT)
Date: Thu, 23 May 2013 10:28:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig/menu.c: fix multiple references to expressions
 in menu_add_prop()
Message-ID: <20130523082823.GF3373@free.fr>
References: <1369126451-11930-1-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1369126451-11930-1-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org, Jan Beulich <jbeulich@suse.com>

Dirk, All,

On 2013-05-21 10:54 +0200, Dirk Gouders spake thusly:
> menu_add_prop() applies upper menus' visibilities to actual prompts
> by AND-ing the prompts visibilities with the upper menus ones.
[--SNIP--]
> This patch fixes this problem by creating copies of the menu's
> visibility expressions before AND-ing them with the prompt's one.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  scripts/kconfig/menu.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index b5c7d90..567939c 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -143,14 +143,25 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
>  
>  		/* Apply all upper menus' visibilities to actual prompts. */
>  		if(type == P_PROMPT) {
> +			struct expr *dup_expr;

I'd rather this variable defined below:

>  			struct menu *menu = current_entry;
>  
>  			while ((menu = menu->parent) != NULL) {

... here, in the block where it is used, since it is not relevant
outside this block.

>  				if (!menu->visibility)
>  					continue;
> +				/*
> +				 * Do not add a reference to the
> +				 * menu's visibility expression but
> +				 * use a copy of it.  Otherwise the
> +				 * expression reduction functions
> +				 * will modify expressions that have
> +				 * multiple references which can
> +				 * cause unwanted side-effects.
> +				 */
> +				dup_expr = expr_copy(menu->visibility);

I wonder if/where this should be de-allocated.

> +
>  				prop->visible.expr
> -					= expr_alloc_and(prop->visible.expr,
> -							 menu->visibility);
> +					= expr_alloc_and(prop->visible.expr, dup_expr);
>  			}
>  		}
>  

I'm testing it right now. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
