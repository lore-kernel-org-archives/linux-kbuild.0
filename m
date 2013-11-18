Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:42890 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751301Ab3KRSIW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Nov 2013 13:08:22 -0500
Date: Mon, 18 Nov 2013 19:08:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v4] kconfig/symbol.c: handle choice_values that depend on
 'm' symbols
Message-ID: <20131118180813.GB3458@free.fr>
References: <ghr4asl38m.fsf@lena.gouders.net>
 <ghk3gkl32u.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghk3gkl32u.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Dirk, All,

On 2013-11-07 15:05 +0100, Dirk Gouders spake thusly:
> If choices consist of choice_values that depend on symbols set to 'm',
> those choice_values are not set to 'n' if the choice is changed from
> 'm' to 'y' (in which case only one active choice_value is allowed).
> Those values are also written to the config file causing modules to be
> built when they should not.
> 
> The following config can be used to reproduce and examine the problem;
> with the frontend of your choice set "Choice 0" and "Choice 1" to 'm',
> then set "Tristate Choice" to 'y' and save the configuration:
> 
> config modules
> 	boolean modules
> 	default y
> 	option modules
> 
> config dependency
> 	tristate "Dependency"
> 	default m
> 
> choice
> 	prompt "Tristate Choice"
> 	default choice0
> 
> config choice0
> 	tristate "Choice 0"
> 
> config choice1
> 	tristate "Choice 1"
> 	depends on dependency
> 
> endchoice
> 
> This patch sets choice_values' visibility that depend on symbols set
> to 'm' to 'n' if the corresponding choice is set to 'y'.  This makes
> them disappear from the choice list and will also cause the
> choice_values' value set to 'n' in sym_calc_value() and as a result
> they are written as "not set" to the resulting .config file.
> 
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

It will be in my tree soon. Thanks!

Regards,
Yann E. MORIN.

> ---
>  scripts/kconfig/symbol.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index c9a6775..06d96c9 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -189,12 +189,23 @@ static void sym_validate_range(struct symbol *sym)
>  static void sym_calc_visibility(struct symbol *sym)
>  {
>  	struct property *prop;
> +	struct symbol *choice_sym = NULL;
>  	tristate tri;
>  
>  	/* any prompt visible? */
>  	tri = no;
> +
> +	if (sym_is_choice_value(sym))
> +		choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
> +
>  	for_all_prompts(sym, prop) {
>  		prop->visible.tri = expr_calc_value(prop->visible.expr);
> +		/*
> +		 * choice_values with visibility 'mod' are not visible if the
> +		 * corresponding choice's value is 'yes'.
> +		 */
> +		if (prop->visible.tri == mod && (choice_sym && choice_sym->curr.tri == yes))
> +			prop->visible.tri = no;
>  		tri = EXPR_OR(tri, prop->visible.tri);
>  	}
>  	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
> -- 
> 1.8.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
