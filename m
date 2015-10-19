Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb2-smtp-cloud2.xs4all.net ([194.109.24.25]:46788 "EHLO
	lb2-smtp-cloud2.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753580AbbJSI64 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 19 Oct 2015 04:58:56 -0400
Message-ID: <1445245133.2581.22.camel@tiscali.nl>
Subject: Re: [PATCH v2 1/1] kconfig: menuconfig make "selected by:" readable
From: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 19 Oct 2015 10:58:53 +0200
In-Reply-To: <1444249244-4592-1-git-send-email-petr.vorel@gmail.com>
References: <1444249244-4592-1-git-send-email-petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org

On wo, 2015-10-07 at 22:20 +0200, Petr Vorel wrote:
> rev_dep expressions can get rather unwieldy, especially if a symbol is
> selected by more than a handful of other symbols. Ie, it's possible to
> have near endless expressions like:
>    A && B && !C || D || F && (G || H) || [...]
> 
> Chop these expressions into actually readable chunks:
>    - A && B && !C
>    - D
>    - F && (G || H)
>    - [...]
> 
> Ie, transform the top level "||" tokens into newlines and prepend each
> line with a minus. This makes the "Selected by:" blurb much easier to
> read.
> 
> Cc: Paul Bolle <pebolle@tiscali.nl>
> Cc: Randy Dunlap <rdunlap@infradead.org>

You actually want your Signed-off-by: line here.

> ---
> Today I found myself wondering why a certain Kconfig was selected.
> Currently menuconfig's help is of no use in complicated cases. Please
> look at the help of USB or CRYPTO to see what I mean.
> 
> This is a _hack_ to show what might be a better way to do this. It
> parses a stringified version of the reverse dependency, and not the
> actual reverse dependecy expression. But that was easier to cobble
> together.
> 
> One cool improvement would be to change to minus in front of the
> subexpressions to Y or M for those that actually set the symbol.
> Anyhow,
> other suggestions and feedback is welcome.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---

You want to have that line there because the above text will be dropped
by the git tools (because it comes are after a --- marker, which signals
"end of commit explanation"). Note that the text, which I think was
written by me, was basically a comment. Ie, because it came after that
marker I used it to say things that I thought were not appropriate for a
commit explanation.

> Changes v1->v2:
> Rewrote Paul Bolle's original implementation: removed use of
> expr_gstr_print()'s output from rev_dep_gstr_print(). I admit that
> adding revdep variable and wrapper function isn't a nice solution, but
> it works directly with struct expr :-).

> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1070,7 +1070,7 @@ struct expr *expr_simplify_unmet_dep(struct expr

> -void expr_print(struct expr *e, void (*fn)(void *, struct symbol *,
> const char *), void *data, int prevtoken)
> +static void expr_print_impl(struct expr *e, void (*fn)(void *, struct

What does _impl stand for?

> @@ -1125,9 +1125,12 @@ void expr_print(struct expr *e, void (*fn)(void

>  	case E_OR:
> -		expr_print(e->left.expr, fn, data, E_OR);
> -		fn(data, NULL, " || ");
> -		expr_print(e->right.expr, fn, data, E_OR);
> +		expr_print_impl(e->left.expr, fn, data, E_OR,
revdep);
> +		if (revdep)
> +			fn(data, NULL, "\n  - ");
> +		else
> +			fn(data, NULL, " || ");
> +		expr_print_impl(e->right.expr, fn, data, E_OR,
revdep);

>  		break;
>  	case E_AND:
>  		expr_print(e->left.expr, fn, data, E_AND);

Lazy question: will the "-" only be printed for the _top level_ E_OR
expressions in "Selected by:" lines?

Thanks,


Paul Bolle
