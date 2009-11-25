Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:55676 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758506AbZKYKWJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2009 05:22:09 -0500
Message-ID: <4B0D0556.3080907@suse.cz>
Date: Wed, 25 Nov 2009 11:22:14 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [Patch] menuconfig: Display current values with symbols.
References: <20090909182518.GB9913@sgi.com>
In-Reply-To: <20090909182518.GB9913@sgi.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robin Holt <holt@sgi.com>
Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, lkml <linux-kernel@vger.kernel.org>

Added kconfig maintainer to CC.

On 9.9.2009 20:25, Robin Holt wrote:
> 
> While investigating why a CONFIG_ symbol was not displayed, I was
> frustrated with finding each of the dependent symbol's values.  This patch
> adds a display of the symbol's value along side the symbol's name.
> 
> Signed-off-by: Robin Holt <holt@sgi.com>
> 
> ---
> 
> One additional suggestion would be an easy way to navigate from the
> search screen to the spot in the menus where that CONFIG_ value is set.
> I could not figure out a clear and convenient method for that.  Some of
> the menus are fairly long and since they are not sorted, can result in
> some frustration while searching for the individual setting.
> 
> 
> Index: xpmem_numatools_kernel/scripts/kconfig/expr.c
> ===================================================================
> --- xpmem_numatools_kernel.orig/scripts/kconfig/expr.c	2009-09-08 13:30:57.000000000 -0500
> +++ xpmem_numatools_kernel/scripts/kconfig/expr.c	2009-09-09 11:53:07.000000000 -0500
> @@ -1013,6 +1013,19 @@ int expr_compare_type(enum expr_type t1,
>  #endif
>  }
>  
> +void expr_print_symbol(void (*fn)(void *, struct symbol *, const char *), void *data, struct symbol *sym)
> +{
> +	char sym_value_str[5];
> +
> +	if (sym->name) {
> +		fn(data, sym, sym->name);
> +		if (snprintf(sym_value_str, 5, "[=%s]", sym_get_string_value(sym)) < 5)
> +			fn(data, sym, sym_value_str);
> +	} else {
> +		fn(data, NULL, "<choice>");
> +	}
> +}
> +

The subject says menuconfig, but expr_print() is also used by xconfig.
Did you check that xconfig still works after this change?

Thanks.
Michal

>  void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
>  {
>  	if (!e) {
> @@ -1024,28 +1037,19 @@ void expr_print(struct expr *e, void (*f
>  		fn(data, NULL, "(");
>  	switch (e->type) {
>  	case E_SYMBOL:
> -		if (e->left.sym->name)
> -			fn(data, e->left.sym, e->left.sym->name);
> -		else
> -			fn(data, NULL, "<choice>");
> +		expr_print_symbol(fn, data, e->left.sym);
>  		break;
>  	case E_NOT:
>  		fn(data, NULL, "!");
>  		expr_print(e->left.expr, fn, data, E_NOT);
>  		break;
>  	case E_EQUAL:
> -		if (e->left.sym->name)
> -			fn(data, e->left.sym, e->left.sym->name);
> -		else
> -			fn(data, NULL, "<choice>");
> +		expr_print_symbol(fn, data, e->left.sym);
>  		fn(data, NULL, "=");
>  		fn(data, e->right.sym, e->right.sym->name);
>  		break;
>  	case E_UNEQUAL:
> -		if (e->left.sym->name)
> -			fn(data, e->left.sym, e->left.sym->name);
> -		else
> -			fn(data, NULL, "<choice>");
> +		expr_print_symbol(fn, data, e->left.sym);
>  		fn(data, NULL, "!=");
>  		fn(data, e->right.sym, e->right.sym->name);
>  		break;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

