Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37299 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752548Ab3J3OZo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Oct 2013 10:25:44 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: choice =y selection becomes lost after having multiple entries =m with depends on
In-Reply-To: <gia9hr5b9m.fsf@karga.hank.lab> (Dirk Gouders's message of "Wed,
	30 Oct 2013 11:00:21 +0100")
References: <5267AA3E.1040003@linutronix.de> <20131023112331.GA3869@free.fr>
	<5267B2D3.3000109@linutronix.de> <givc0mbs9b.fsf@karga.hank.lab>
	<52694894.8090201@linutronix.de> <gia9hr5b9m.fsf@karga.hank.lab>
Date: Wed, 30 Oct 2013 15:26:30 +0100
Message-ID: <giob664yy1.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

--=-=-=
Content-Type: text/plain

Dirk Gouders <dirk@gouders.net> writes:

> Sebastian Andrzej Siewior <bigeasy@linutronix.de> writes:
>
>> On 10/24/2013 05:30 PM, Dirk Gouders wrote:
>>> Hi Sebastian,
>>
>> Hi Dirk,
>>
>>> I was looking at what you described and initially had a hard time to
>>> reproduce the problem, probably because I tried it after `make
>>> mrproper'.  I am only able to reproduce the problem with an existing
>>> .config of my running kernel, for example.
>>> 
>>> Just to make sure that I am correctly trying to reproduce the problem:
>>> did you already try to do what you described after a `make mrproper' and
>>> do you then also notice the described problems?  If not, could you
>>> please try that?
>>
>> What is the purpose behind mrproper?
>> The key to reproduce it is to have a .config with atleast two items
>> within a choice statement which also have a "depends on" statement and
>> those set to =m. If you don't have this after mrproper (with your fresh
>> .config) then you don't see it.
>
> Hi Sebastian, Yann, all
>
> apologies for my previous misunderstanding.
>
> I hope I now understood the problem and I tried to fix it with the
> attached patch.  Could you please test the patch if it fixes the problem
> you noticed?
>
> Another problem that I noticed is that if a choice is set to 'y', then
> I think the choice list should not include symbols that depend on
> symbols set to 'm', because they cannot be chosen, anyway.  Well, this
> is rather confusing but does not produce real errors; I will see if I
> can fix that, too.

Hi Sebastian, Yann, all,

below is a patch that prevents choice_values to appear in the list if
they depend on 'm' symbols and the choice symbol is set to 'y'.  I would
be glad if you could have a look at it.

Yann, in this patch I wrote " if (choice_sym != NULL..." -- I guess that
is one point that you will probably remark in the previous patch.

Another point is that all the conditionals in both patches could be
limited to only those choice_values that are of type tristate but I
think that makes the code even harder to read...

Dirk


--=-=-=
Content-Type: text/plain
Content-Disposition: inline;
 filename=0002-kconfig-symbol.c-handle-visibility-of-choice_values-.patch
Content-Description: Visibility Patch

From 677f5830588749cbb0bdb0568cbdaba271937c8d Mon Sep 17 00:00:00 2001
From: Dirk Gouders <dirk@gouders.net>
Date: Wed, 30 Oct 2013 15:06:05 +0100
Subject: [PATCH 2/2] kconfig/symbol.c: handle visibility of choice_values that
 depend on 'm' symbols

If choice_values depend on symbols that are set to 'm' then these
choice_values should not be visible in choice lists if the choice
symbol is set to 'y'.  See USB Gadget Drivers, for example.

Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-of-by: Dirk Gouders <dirk@gouders.net>
---
 scripts/kconfig/symbol.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 043c041..fbabb80 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -189,12 +189,23 @@ static void sym_validate_range(struct symbol *sym)
 static void sym_calc_visibility(struct symbol *sym)
 {
 	struct property *prop;
+	struct symbol *choice_sym = NULL;
 	tristate tri;
 
 	/* any prompt visible? */
 	tri = no;
+
+	if (sym_is_choice_value(sym))
+		choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
+
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
+		/*
+		 * choice_values with visibility 'mod' are not visible if the
+		 * corresponding choice's value is 'yes'.
+		 */
+		if (prop->visible.tri == mod && (choice_sym != NULL && choice_sym->curr.tri == yes))
+			prop->visible.tri = no;
 		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
-- 
1.8.3.2


--=-=-=
Content-Type: text/plain



> Yann, if you could have a look at and comment on my patch, I would be
> glad.
>
> Dirk
>
> From 3e555d59dd651366e14d6d6a47668acec3039fff Mon Sep 17 00:00:00 2001
> From: Dirk Gouders <dirk@gouders.net>
> Date: Wed, 30 Oct 2013 10:44:54 +0100
> Subject: [PATCH] kconfig/symbol.c: handle choice_values that depend on 'm'
>  symbols
>
> If choices consist of choice_values that depend on symbols set to 'm',
> those choice_values are not set to 'n' if the choice is changed from
> 'm' to 'y' (in which case only one active choice_value is allowed).
> Those values are also written to the config file causing modules when
> they should not.
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
> This patch handles choice_values that depend on symbols set to 'm' if
> the corresponding choice is set to 'y'.
>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
>  scripts/kconfig/symbol.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index c9a6775..043c041 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -338,10 +338,27 @@ void sym_calc_value(struct symbol *sym)
>  
>  	switch (sym_get_type(sym)) {
>  	case S_BOOLEAN:
> -	case S_TRISTATE:
> -		if (sym_is_choice_value(sym) && sym->visible == yes) {
> -			prop = sym_get_choice_prop(sym);
> -			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
> +	case S_TRISTATE: {
> +		struct symbol *choice_sym = NULL;
> +
> +		if (sym_is_choice_value(sym))
> +			choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
> +
> +		/*
> +		 * If this is a visible choice_value we want to check
> +		 * if it is the currently selected, in two cases:
> +		 *
> +		 * 1) If it's visibility is 'yes'.
> +		 * 2) If it's visibility is 'mod' and the correspondig
> +		 *    choice symbols' value is 'yes'.
> +		 *
> +		 *    If a choice symbol is 'yes', only the selected
> +		 *    choice_value may be 'yes' and all others (also
> +		 *    those currently set to 'mod') must be set to 'no'.
> +		 */
> +		if (choice_sym &&
> +		    (sym->visible == yes || (sym->visible == mod && choice_sym->curr.tri == yes))) {
> +			    newval.tri = choice_sym->curr.val == sym ? yes : no;
>  		} else {
>  			if (sym->visible != no) {
>  				/* if the symbol is visible use the user value
> @@ -382,6 +399,7 @@ void sym_calc_value(struct symbol *sym)
>  		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
>  			newval.tri = yes;
>  		break;
> +	}
>  	case S_STRING:
>  	case S_HEX:
>  	case S_INT:

--=-=-=--
