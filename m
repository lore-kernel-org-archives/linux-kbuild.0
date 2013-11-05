Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:45256 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755640Ab3KEXET (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Nov 2013 18:04:19 -0500
Date: Wed, 6 Nov 2013 00:04:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH v3] kconfig/symbol.c: handle choice_values that depend on
 'm' symbols
Message-ID: <20131105230414.GB3337@free.fr>
References: <gh4n7wzf0y.fsf@lena.gouders.net>
 <ghvc0cy00x.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghvc0cy00x.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Dirk, All,

On 2013-11-01 00:39 +0100, Dirk Gouders spake thusly:
> If choices consist of choice_values that depend on symbols set to 'm',
> those choice_values are not set to 'n' if the choice is changed from
> 'm' to 'y' (in which case only one active choice_value is allowed).
> Those values are also written to the config file causing modules to be
> built when they should not.
> 
> The following config can be used to reproduce and examine the problem:
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

It seems I'm missing something here.

I just copy-pasted your example (test.in. below) and used it with
current master (cset #be408cd) without your patch, and then ran:
    $ git clean -dX         # clean the tree
    $ make menuconfig       # Generate the frontend
      --> exit without saving
    $ ./scripts/kconfig/mconf test.in
      --> change the choice to 'y'
      --> do not change anything else
      --> exit and save

    $ cat .config
    CONFIG_modules=y
    CONFIG_dependency=m
    CONFIG_c0=y
    # CONFIG_c1 is not set

(.config header elided on purpose)
This looks like the expected output to me.

So I did further tests (still without your patch):
    $ git clean -dX         # clean the tree
    $ make menuconfig       # Generate the frontend
      --> exit without saving
    $ ./scripts/kconfig/mconf test.in
      --> change nothing
      --> exit and save

    $ cat .config
    CONFIG_modules=y
    CONFIG_dependency=m
    # CONFIG_c0 is not set
    # CONFIG_c1 is not set

    $ ./scripts/kconfig/mconf test.in
      --> change the choice to 'y'
      --> do not change anything else
      --> exit and save

    $ cat .config
    CONFIG_modules=y
    CONFIG_dependency=m
    CONFIG_c0=y
    # CONFIG_c1 is not set

Still the expected output, as far as I can see.

I can observe the exact same result with your patch applied. Ditto with
kbuild/for-next from Michal's tree, with or without your patch.

So while I understand and can reproduce the original issue, and this
patch indeed solves this original issue, the test-case above does not
seem to completely illustrate the issue.

Are you sure this test-case exhibits the problem for you?

Anyway, I'm taking that in my tree locally, but that won't be part of
for-next, since I'd like that we:
  - either find a real reduced test-case,
  - or just repeat the description from the original bug report

Needless to say that I'd prefer the former over the latter. Then I'll
queue it as a post-rc1 fix.

Regards,
Yann E. MORIN.

> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  scripts/kconfig/symbol.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 22a3c40..32bbaa3 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -188,12 +188,23 @@ static void sym_validate_range(struct symbol *sym)
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
