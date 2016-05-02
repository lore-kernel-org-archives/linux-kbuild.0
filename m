Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:53056 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752317AbcEBIoI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 May 2016 04:44:08 -0400
Subject: Re: [PATCH v5] kconfig/symbol.c: handle choice_values that depend on
 'm' symbols
References: <201604201924.7peNMcCF%fengguang.wu@intel.com>
 <ghinz04yaz.fsf@lena.gouders.net>
From: Roger Quadros <rogerq@ti.com>
Message-ID: <57271332.1090308@ti.com>
Date: Mon, 2 May 2016 11:43:30 +0300
MIME-Version: 1.0
In-Reply-To: <ghinz04yaz.fsf@lena.gouders.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Michal Marek <mmarek@suse.cz>
Cc: kbuild-all@01.org, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Bin Liu <binmlist@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>

On 29/04/16 11:24, Dirk Gouders wrote:
> If choices consist of choice_values of type tristate that depend on
> symbols set to 'm', those choice_values are not set to 'n' if the
> choice is changed from 'm' to 'y' (in which case only one active
> choice_value is allowed). Those values are also written to the config
> file causing modules to be built when they should not.
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
> This patch sets tristate choice_values' visibility that depend on
> symbols set to 'm' to 'n' if the corresponding choice is set to 'y'.
> 
> This makes them disappear from the choice list and will also cause the
> choice_values' value set to 'n' in sym_calc_value() and as a result
> they are written as "not set" to the resulting .config file.
> 
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Tested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v5: This patch should handle tristate choice-values, only.
> 
>     I assumed that only tristate choice-values can have visibility 'm',
>     which was wrong: tristate dependencies can result in 'm'
>     visibility.
> 
>     So, add an explicit test if a symbol is of type tristate.
> 
>     I am a bit unsure how to handle Tested-By credits when patches change
>     substantially and left the credits untouched but new test reports
>     are welcome.

If you made a non cosmetic change old Tested-By tags aren't valid.

> 
> ---

The USB gadget case works fine for me. Thanks :)

Tested-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger

>  scripts/kconfig/symbol.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 25cf0c2..2432298 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -209,12 +209,26 @@ static void sym_set_all_changed(void)
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
> +		 * Tristate choice_values with visibility 'mod' are
> +		 * not visible if the corresponding choice's value is
> +		 * 'yes'.
> +		 */
> +		if (choice_sym && sym->type == S_TRISTATE &&
> +		    prop->visible.tri == mod && choice_sym->curr.tri == yes)
> +			prop->visible.tri = no;
> +
>  		tri = EXPR_OR(tri, prop->visible.tri);
>  	}
>  	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
> 
