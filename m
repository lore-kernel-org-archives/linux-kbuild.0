Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cpsmtpb-ews10.kpnxchange.com ([213.75.39.15]:65312 "EHLO
	cpsmtpb-ews10.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752470AbaKDNO3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 08:14:29 -0500
Message-ID: <1415106861.20372.149.camel@x220>
Subject: Re: [PATCH 2/2] kconfig: allow use of relations other than
 (in)equality
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 04 Nov 2014 14:14:21 +0100
In-Reply-To: <5458A52C0200007800044AC4@mail.emea.novell.com>
References: <5458A52C0200007800044AC4@mail.emea.novell.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

Just a quick reply (three odd lines I noted while unsuccessfully trying
to apply this on top of my local changes).

On Tue, 2014-11-04 at 09:06 +0000, Jan Beulich wrote:
> Over the years I found it desirable to be able to use all sorts of
> relations, not just (in)equality. And apparently I'm not the only one,
> as there's at least one example in the tree where the programmer
> assumed this would work (see DEBUG_UART_8250_WORD in
> arch/arm/Kconfig.debug). Another possibly use would e.g. be to fold the
> two SMP/NR_CPUS prompt into one: SMP could be promptless, simply
> depending on NR_CPUS > 1.
> 
> A (desirable) side effect of this change - resulting from numeric
> values now necessarily being compared as numbers rather than as
> strings - is that comparing hex values now works as expected: Other
> than int ones (which aren't allowed to have leading zeroes), zeroes
> following the 0x prefix made them compare unequal even if their values
> were equal.
> 
> Question: Should "<>" and/or "==" then perhaps also be permitted?

You mean as aliases for "!=" and "="?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>  scripts/kconfig/expr.c              |  170 ++++++++++-
>  scripts/kconfig/expr.h              |    4 
>  scripts/kconfig/symbol.c            |    4 
>  scripts/kconfig/zconf.l             |    4 
>  scripts/kconfig/zconf.lex.c_shipped |  291 +++++++++++--------
>  scripts/kconfig/zconf.tab.c_shipped |  524 +++++++++++++++++++-----------------
>  scripts/kconfig/zconf.y             |    9 
>  7 files changed, 627 insertions(+), 379 deletions(-)
> 
> --- 3.18-rc3-kconfig.orig/scripts/kconfig/expr.c
> +++ 3.18-rc3-kconfig/scripts/kconfig/expr.c
> [...]
> @@ -959,21 +1046,60 @@ tristate expr_calc_value(struct expr *e)
>  		val1 = expr_calc_value(e->left.expr);
>  		return EXPR_NOT(val1);
>  	case E_EQUAL:
> -		sym_calc_value(e->left.sym);
> -		sym_calc_value(e->right.sym);
> -		str1 = sym_get_string_value(e->left.sym);
> -		str2 = sym_get_string_value(e->right.sym);
> -		return !strcmp(str1, str2) ? yes : no;
> +	case E_GEQ:
> +	case E_GTH:
> +	case E_LEQ:
> +	case E_LTH:
>  	case E_UNEQUAL:
> -		sym_calc_value(e->left.sym);
> -		sym_calc_value(e->right.sym);
> -		str1 = sym_get_string_value(e->left.sym);
> -		str2 = sym_get_string_value(e->right.sym);
> -		return !strcmp(str1, str2) ? no : yes;
> +		break;
>  	default:
>  		printf("expr_calc_value: %d?\n", e->type);
>  		return no;
>  	}
> +
> +	sym_calc_value(e->left.sym);
> +	sym_calc_value(e->right.sym);
> +	str1 = sym_get_string_value(e->left.sym);
> +	str2 = sym_get_string_value(e->right.sym);
> +
> +	if (e->left.sym->type != S_STRING || e->right.sym->type != S_STRING) {
> +		k1 = expr_parse_string(str1, e->left.sym->type, &lval);
> +		k2 = expr_parse_string(str2, e->right.sym->type, &rval);
> +	}
> +
> +	if (k1 == k_string || k2 == k_string)
> +		res = strcmp(str1, str2);
> +	else if (k1 == k_invalid || k2 == k_invalid) {
> +		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
> +			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
> +printf("(%s -> %d, %s -> %d)\n", sym_type_name(e->left.sym->type), k1, sym_type_name(e->right.sym->type), k2);//temp

Leftover from development?

> +			return no;
> +		}
> +		res = strcmp(str1, str2);
> +	} else if (k1 == k_unsigned || k2 == k_unsigned)
> +		res = (lval.u > rval.u) - (lval.u < rval.u);
> +	else /* if (k1 == k_signed && k2 == k_signed) */
> +		res = (lval.s > rval.s) - (lval.s < rval.s);
> +
> +	switch(e->type) {
> +	case E_EQUAL:
> +if(!strcmp(str1, str2) != !res) printf("EQU(\"%s\",\"%s\") -> %d/%d\n", str1, str2, strcmp(str1, str2), res);//temp

Ditto.

> +		return res ? no : yes;
> +	case E_GEQ:
> +		return res >= 0 ? yes : no;
> +	case E_GTH:
> +		return res > 0 ? yes : no;
> +	case E_LEQ:
> +		return res <= 0 ? yes : no;
> +	case E_LTH:
> +		return res < 0 ? yes : no;
> +	case E_UNEQUAL:
> +if(!strcmp(str1, str2) != !res) printf("UEQ(\"%s\",\"%s\") -> %d/%d\n", str1, str2, strcmp(str1, str2), res);//temp

Ditto.

> +		return res ? yes : no;
> +	default:
> +		printf("expr_calc_value: relation %d?\n", e->type);
> +		return no;
> +	}
>  }
>  
>  int expr_compare_type(enum expr_type t1, enum expr_type t2)


Paul Bolle

