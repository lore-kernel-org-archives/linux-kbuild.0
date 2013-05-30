Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx10.gouders.net ([89.244.147.155]:34734 "EHLO mx10.gouders.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754625Ab3E3D7p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 May 2013 23:59:45 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH] kconfig/menu.c: fix multiple references to expressions in menu_add_prop()
In-Reply-To: <20130529215805.GB6408@free.fr> (Yann E. MORIN's message of "Wed,
	29 May 2013 23:58:05 +0200")
References: <1369126451-11930-1-git-send-email-dirk@gouders.net>
	<20130523082823.GF3373@free.fr> <gir4gykn79.fsf@karga.hank.lab>
	<20130529215805.GB6408@free.fr>
Date: Thu, 30 May 2013 05:59:32 +0200
Message-ID: <ghli6xf78b.fsf@mx10.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Jan Beulich <jbeulich@suse.com>

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

> Dirk, All,
>
> On 2013-05-23 12:25 +0200, Dirk Gouders spake thusly:
>> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
>> > On 2013-05-21 10:54 +0200, Dirk Gouders spake thusly:
>> >> menu_add_prop() applies upper menus' visibilities to actual prompts
>> >> by AND-ing the prompts visibilities with the upper menus ones.
>> > [--SNIP--]
>> >> This patch fixes this problem by creating copies of the menu's
>> >> visibility expressions before AND-ing them with the prompt's one.
> [--SNIP--]
>> >> --- a/scripts/kconfig/menu.c
>> >> +++ b/scripts/kconfig/menu.c
>> >> @@ -143,14 +143,25 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
>> >>  
>> >>  		/* Apply all upper menus' visibilities to actual prompts. */
>> >>  		if(type == P_PROMPT) {
>> >> +			struct expr *dup_expr;
>> >
>> > I'd rather this variable defined below:
>> >
>> >>  			struct menu *menu = current_entry;
>> >>  
>> >>  			while ((menu = menu->parent) != NULL) {
>> >
>> > ... here, in the block where it is used, since it is not relevant
>> > outside this block.
>> 
>> Indeed, I will fix this.
>> I also noticed that I should fix some spelling (e.g. side effect instead
>> of side-effect).  I hope it is OK, to wait for your tests before sending
>> a v2.
>
> If you're speaking about typoes in your patch, I'll just fix them here
> (along with the variable move above), don't worry.

Thanks for fixing all that.

[SNIP]
>> Actually, I did not find any piece of code that systematically free()s
>> the allocated data structures
>
> Indeed.
> My question was a bit rhetorical.
>
>> and I also think that it would be good to
>> have such code, because that would have caused double-free()s and
>> therfore noticed us immediately when we create multiple references to
>> expressions.
>> 
>> My plan was, to first to fix this single problem and then take care for
>> a larger review of dynamically allocated memory.
>
> Yes, that would be awesome! :-)
>
>> I tested mconf for example with valgrind and the next thing I planned to
>> suggest is to make the kconfig code mostly "valgrind-clean".  But I
>> expect this to become a rather extensive change and would like to hear
>> if others also think it should be done.
>
> Although a little bit of memory leak in kconfig is no big issue for the
> kernel tree (since the frontends are rather short-lived programs), other
> users of kconfig may use long-lived processes that would suffer from
> memory leaks.
>
> Fixing those would be a net gain, I believe.

OK, I already started to care for a clean heap when mconf exits and
make good progress but there are still some bytes left ;-) -- and more
references to free'd expressions, I'm afraid.

I am planning to put these changes in multiple simple commits (so that
later possible bisecting will point to mainly one or few line changes)
and send them to you for review if that is OK to you.

Dirk
