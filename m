Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:43132 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750774AbeBTTw0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 14:52:26 -0500
Date: Tue, 20 Feb 2018 20:52:15 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v4 0/3] Kconfig: Print reverse dependencies in groups
Message-ID: <20180220195119.GA14262@vmlxhi-102.adit-jv.com>
References: <cover.1518985888.git.erosca@de.adit-jv.com>
 <CAK7LNAQ4z9KHsCvzQRHozcXrxY5wsLnMCqWP7weSLFC4mxh6fg@mail.gmail.com>
 <CAK7LNARtH1fepGc_+E4uzhoc=ykuF1HXpy0g7wx=5xZyL7G1YQ@mail.gmail.com>
 <20180220150018.mjyjmdmao7xqyukr@huvuddator>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180220150018.mjyjmdmao7xqyukr@huvuddator>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>

On Tue, Feb 20, 2018 at 04:00:18PM +0100, Ulf Magnusson wrote:
> On Tue, Feb 20, 2018 at 05:24:01PM +0900, Masahiro Yamada wrote:
> > 2018-02-20 17:13 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> > >
> > > I do not like this implementation.
> > > The code is super ugly, the diff-stat is too much than needed.
> > >
> > > Please rewrite the code within 20 lines.
> > >
> > 
> > For a hint, I cleaned up the code base.
> > https://patchwork.kernel.org/patch/10229545/
> > 
> > which should be equivalent to yours:
> > https://patchwork.kernel.org/patch/10226951/
> > 
> > 
> > No 'enum print_type', please.
> 
> The reason I prefer them on separate lines consistently is to avoid stuff like the following:
> 
>   Selected by [y]: MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>   Selected by [n]:
>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
> 
> That looks confusing and unbalanced to me.

I think nobody is disputing this. Masahiro's
https://patchwork.kernel.org/patch/10229545/ is also showing every
reverse dependency top level OR expression on a new row.

> 
> There are some simple ways to trim down the size of this patchset
> though.
> 
> Eugeniu:
> What do you think about the following refactoring of your 3/3 patch?
> Maybe there's a way to have expr_print_revdep() take just a tristate
> too, though it's not worth it if it just grows the code elsewhere.
> 

Well, Masahiro requests not using 'enum print_type' and I still see it
in your example.

> (By the way, I noticed that expr_print_revdep() previously generated a
> warning suggesting parentheses, which was my fault. If you saw that,
> don't copy my mistakes. The build should be warning-free. :)

I didn't notice any warnings using gcc 5.4.0.

> 
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 95dc058a236f..db9a89b9bede 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1186,10 +1186,9 @@ expr_print_revdep(struct expr *e,
>  		  int prevtoken,
>  		  enum print_type type)
>  {
> -	if (type == PRINT_REVDEP_ALL				  ||
> -	    type == PRINT_REVDEP_YES && expr_calc_value(e) == yes ||
> -	    type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod ||
> -	    type == PRINT_REVDEP_NO  && expr_calc_value(e) == no) {
> +	if ((type == PRINT_REVDEP_YES && expr_calc_value(e) == yes) ||
> +	    (type == PRINT_REVDEP_MOD && expr_calc_value(e) == mod) ||
> +	    (type == PRINT_REVDEP_NO  && expr_calc_value(e) == no)) {
>  		fn(data, NULL, "\n  - ");
>  		expr_print(e, fn, data, prevtoken);
>  	}
> @@ -1212,17 +1211,10 @@ __expr_print(struct expr *e,
>  	switch (e->type) {
>  	case E_SYMBOL:
>  		if (e->left.sym->name)
> -			switch (type) {
> -			case PRINT_NORMAL:
> +			if (type == PRINT_NORMAL)
>  				fn(data, e->left.sym, e->left.sym->name);
> -				break;
> -			case PRINT_REVDEP_ALL:
> -			case PRINT_REVDEP_YES:
> -			case PRINT_REVDEP_MOD:
> -			case PRINT_REVDEP_NO:
> +			else
>  				expr_print_revdep(e, fn, data, E_OR, type);
> -				break;
> -			}
>  		else
>  			fn(data, NULL, "<choice>");
>  		break;
> @@ -1271,18 +1263,12 @@ __expr_print(struct expr *e,
>  		__expr_print(e->right.expr, fn, data, E_OR, type);
>  		break;
>  	case E_AND:
> -		switch (type) {
> -		case PRINT_NORMAL:
> +		if (type == PRINT_NORMAL) {
>  			expr_print(e->left.expr, fn, data, E_AND);
>  			fn(data, NULL, " && ");
>  			expr_print(e->right.expr, fn, data, E_AND);
> -			break;
> -		case PRINT_REVDEP_ALL:
> -		case PRINT_REVDEP_YES:
> -		case PRINT_REVDEP_MOD:
> -		case PRINT_REVDEP_NO:
> +		} else {
>  			expr_print_revdep(e, fn, data, E_OR, type);
> -			break;
>  		}
>  		break;
>  	case E_LIST:
> @@ -1370,27 +1356,14 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
>   */
>  bool expr_revdep_contains(struct expr *e, tristate val)
>  {
> -	bool ret = false;
> -
>  	if (!e)
> -		return ret;
> +		return false;
>  
> -	switch (e->type) {
> -	case E_SYMBOL:
> -	case E_AND:
> -		if (expr_calc_value(e) == val)
> -			ret = true;
> -		break;
> -	case E_OR:
> -		if (expr_revdep_contains(e->left.expr, val))
> -			ret = true;
> -		else if (expr_revdep_contains(e->right.expr, val))
> -			ret = true;
> -		break;
> -	default:
> -		break;
> -	}
> -	return ret;
> +	if (e->type == E_OR)
> +		return expr_revdep_contains(e->left.expr, val) ||
> +		       expr_revdep_contains(e->right.expr, val);
> +
> +	return expr_calc_value(e) == val;
>  }

I really like how you've minimized the size of expr_revdep_contains().
Thanks for that. I will try to come up with something in the next days.

>  
>  /*
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index d5b096725ca8..e5687b430c17 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -36,7 +36,6 @@ enum expr_type {
>  
>  enum print_type {
>  	PRINT_NORMAL,
> -	PRINT_REVDEP_ALL,
>  	PRINT_REVDEP_YES,
>  	PRINT_REVDEP_MOD,
>  	PRINT_REVDEP_NO,

Best regards,
Eugeniu.
