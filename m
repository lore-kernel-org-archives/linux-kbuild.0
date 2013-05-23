Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:48849 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757918Ab3EWKZe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 May 2013 06:25:34 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
In-Reply-To: <20130523082823.GF3373@free.fr> (Yann E. MORIN's message of "Thu,
	23 May 2013 10:28:23 +0200")
References: <1369126451-11930-1-git-send-email-dirk@gouders.net>
	<20130523082823.GF3373@free.fr>
Date: Thu, 23 May 2013 12:25:14 +0200
Message-ID: <gir4gykn79.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Jan Beulich <jbeulich@suse.com>

Thanks for reviewing and testing a patch of mine, again, Yann.


"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-05-21 10:54 +0200, Dirk Gouders spake thusly:
>> menu_add_prop() applies upper menus' visibilities to actual prompts
>> by AND-ing the prompts visibilities with the upper menus ones.
> [--SNIP--]
>> This patch fixes this problem by creating copies of the menu's
>> visibility expressions before AND-ing them with the prompt's one.
>> 
>> Signed-off-by: Dirk Gouders <dirk@gouders.net>
>> ---
>>  scripts/kconfig/menu.c | 15 +++++++++++++--
>>  1 file changed, 13 insertions(+), 2 deletions(-)
>> 
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index b5c7d90..567939c 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -143,14 +143,25 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
>>  
>>  		/* Apply all upper menus' visibilities to actual prompts. */
>>  		if(type == P_PROMPT) {
>> +			struct expr *dup_expr;
>
> I'd rather this variable defined below:
>
>>  			struct menu *menu = current_entry;
>>  
>>  			while ((menu = menu->parent) != NULL) {
>
> ... here, in the block where it is used, since it is not relevant
> outside this block.

Indeed, I will fix this.
I also noticed that I should fix some spelling (e.g. side effect instead
of side-effect).  I hope it is OK, to wait for your tests before sending
a v2.

>>  				if (!menu->visibility)
>>  					continue;
>> +				/*
>> +				 * Do not add a reference to the
>> +				 * menu's visibility expression but
>> +				 * use a copy of it.  Otherwise the
>> +				 * expression reduction functions
>> +				 * will modify expressions that have
>> +				 * multiple references which can
>> +				 * cause unwanted side-effects.
>> +				 */
>> +				dup_expr = expr_copy(menu->visibility);
>
> I wonder if/where this should be de-allocated.

Actually, I did not find any piece of code that systematically free()s
the allocated data structures and I also think that it would be good to
have such code, because that would have caused double-free()s and
therfore noticed us immediately when we create multiple references to
expressions.

My plan was, to first to fix this single problem and then take care for
a larger review of dynamically allocated memory.

I tested mconf for example with valgrind and the next thing I planned to
suggest is to make the kconfig code mostly "valgrind-clean".  But I
expect this to become a rather extensive change and would like to hear
if others also think it should be done.

>
>> +
>>  				prop->visible.expr
>> -					= expr_alloc_and(prop->visible.expr,
>> -							 menu->visibility);
>> +					= expr_alloc_and(prop->visible.expr, dup_expr);
>>  			}
>>  		}
>>  
>
> I'm testing it right now. Thanks!

Again, thanks for spending the time.

Dirk

> Regards,
> Yann E. MORIN.
