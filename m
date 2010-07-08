Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:47014 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755637Ab0GHMjK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Jul 2010 08:39:10 -0400
Message-ID: <4C35C6EB.50008@suse.cz>
Date: Thu, 08 Jul 2010 14:39:07 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] don't write invisible choice values
References: <4C2B50750200007800008CFC@vpn.id2.novell.com>
In-Reply-To: <4C2B50750200007800008CFC@vpn.id2.novell.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@novell.com>
Cc: zippel@linux-m68k.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 30.6.2010 14:11, Jan Beulich wrote:
> This makes it so "make oldconfig" really prompts for any choice where
> options that previously weren't visible just became so. Previously one
> would have to remember to go over all choice values and check whether
> some that previously couldn't be selected now can be.
> 
> Signed-off-by: Jan Beulich <jbeulich@novell.com>

Applied, thanks.

Michal

> ---
>  scripts/kconfig/symbol.c |   24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> --- linux-2.6.35-rc3/scripts/kconfig/symbol.c
> +++ 2.6.35-rc3-kconfig-invisible-choice-values/scripts/kconfig/symbol.c
> @@ -222,13 +222,15 @@ static struct symbol *sym_calc_choice(st
>  	struct property *prop;
>  	struct expr *e;
>  
> +	/* first calculate all choice values' visibilities */
> +	prop = sym_get_choice_prop(sym);
> +	expr_list_for_each_sym(prop->expr, e, def_sym)
> +		sym_calc_visibility(def_sym);
> +
>  	/* is the user choice visible? */
>  	def_sym = sym->def[S_DEF_USER].val;
> -	if (def_sym) {
> -		sym_calc_visibility(def_sym);
> -		if (def_sym->visible != no)
> -			return def_sym;
> -	}
> +	if (def_sym && def_sym->visible != no)
> +		return def_sym;
>  
>  	/* any of the defaults visible? */
>  	for_all_defaults(sym, prop) {
> @@ -236,18 +238,15 @@ static struct symbol *sym_calc_choice(st
>  		if (prop->visible.tri == no)
>  			continue;
>  		def_sym = prop_get_symbol(prop);
> -		sym_calc_visibility(def_sym);
>  		if (def_sym->visible != no)
>  			return def_sym;
>  	}
>  
>  	/* just get the first visible value */
>  	prop = sym_get_choice_prop(sym);
> -	expr_list_for_each_sym(prop->expr, e, def_sym) {
> -		sym_calc_visibility(def_sym);
> +	expr_list_for_each_sym(prop->expr, e, def_sym)
>  		if (def_sym->visible != no)
>  			return def_sym;
> -	}
>  
>  	/* no choice? reset tristate value */
>  	sym->curr.tri = no;
> @@ -365,12 +364,13 @@ void sym_calc_value(struct symbol *sym)
>  
>  	if (sym_is_choice(sym)) {
>  		struct symbol *choice_sym;
> -		int flags = sym->flags & (SYMBOL_CHANGED | SYMBOL_WRITE);
>  
>  		prop = sym_get_choice_prop(sym);
>  		expr_list_for_each_sym(prop->expr, e, choice_sym) {
> -			choice_sym->flags |= flags;
> -			if (flags & SYMBOL_CHANGED)
> +			if ((sym->flags & SYMBOL_WRITE) &&
> +			    choice_sym->visible != no)
> +				choice_sym->flags |= SYMBOL_WRITE;
> +			if (sym->flags & SYMBOL_CHANGED)
>  				sym_set_changed(choice_sym);
>  		}
>  	}
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

