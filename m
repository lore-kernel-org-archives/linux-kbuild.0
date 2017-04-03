Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36849 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750830AbdDCJfs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Apr 2017 05:35:48 -0400
Date: Mon, 3 Apr 2017 11:35:45 +0200
From: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH v3 1/1] kconfig: menuconfig make "selected by:" readable
Message-ID: <20170403093545.ebn5lawttpfwbpbl@x230>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20170223131008.13705-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170223131008.13705-1-pvorel@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: pebolle@tiscali.nl, mmarek@suse.cz

Hi,

> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. Ie, it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]

> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]

> Ie, transform the top level "||" tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read.

> This also prevents trimming too long lines.

> Based on patch from Paul Bolle.

> Reported-by: Paul Bolle <pebolle@tiscali.nl>
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  scripts/kconfig/expr.c | 16 +++++++++++++---
>  scripts/kconfig/menu.c |  2 +-
>  2 files changed, 14 insertions(+), 4 deletions(-)

> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index cbf4996dd9c1..4b4309b59349 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1070,6 +1070,8 @@ struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
>  	return expr_get_leftmost_symbol(ret);
>  }

> +static int print_level = 0;
> +
>  void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
>  {
>  	if (!e) {
> @@ -1077,8 +1079,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>  		return;
>  	}

> -	if (expr_compare_type(prevtoken, e->type) > 0)
> +	if (expr_compare_type(prevtoken, e->type) > 0) {
> +		print_level++;
>  		fn(data, NULL, "(");
> +	}
> +
>  	switch (e->type) {
>  	case E_SYMBOL:
>  		if (e->left.sym->name)
> @@ -1126,7 +1131,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>  		break;
>  	case E_OR:
>  		expr_print(e->left.expr, fn, data, E_OR);
> -		fn(data, NULL, " || ");
> +		if (print_level == 0)
> +			fn(data, NULL, "\n  - ");
> +		else
> +			fn(data, NULL, " || ");
>  		expr_print(e->right.expr, fn, data, E_OR);
>  		break;
>  	case E_AND:
> @@ -1156,8 +1164,10 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
>  		break;
>  	  }
>  	}
> -	if (expr_compare_type(prevtoken, e->type) > 0)
> +	if (expr_compare_type(prevtoken, e->type) > 0) {
> +		print_level--;
>  		fn(data, NULL, ")");
> +	}
>  }

>  static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e9357931b47d..3daf7b81637f 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -675,7 +675,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym,

>  	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
>  	if (sym->rev_dep.expr) {
> -		str_append(r, _("  Selected by: "));
> +		str_append(r, _("  Selected by: \n  - "));
>  		expr_gstr_print(sym->rev_dep.expr, r);
>  		str_append(r, "\n");
>  	}

Any comment on this patch, please?


Kind regards,
Petr
