Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:58858 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935228Ab3E2V6K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 May 2013 17:58:10 -0400
Received: by mail-wg0-f53.google.com with SMTP id m15so6704007wgh.8
        for <linux-kbuild@vger.kernel.org>; Wed, 29 May 2013 14:58:09 -0700 (PDT)
Date: Wed, 29 May 2013 23:58:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] kconfig/menu.c: fix multiple references to expressions
 in menu_add_prop()
Message-ID: <20130529215805.GB6408@free.fr>
References: <1369126451-11930-1-git-send-email-dirk@gouders.net>
 <20130523082823.GF3373@free.fr>
 <gir4gykn79.fsf@karga.hank.lab>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <gir4gykn79.fsf@karga.hank.lab>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: linux-kbuild@vger.kernel.org, Jan Beulich <jbeulich@suse.com>

Dirk, All,

On 2013-05-23 12:25 +0200, Dirk Gouders spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> > On 2013-05-21 10:54 +0200, Dirk Gouders spake thusly:
> >> menu_add_prop() applies upper menus' visibilities to actual prompts
> >> by AND-ing the prompts visibilities with the upper menus ones.
> > [--SNIP--]
> >> This patch fixes this problem by creating copies of the menu's
> >> visibility expressions before AND-ing them with the prompt's one.
[--SNIP--]
> >> --- a/scripts/kconfig/menu.c
> >> +++ b/scripts/kconfig/menu.c
> >> @@ -143,14 +143,25 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
> >>  
> >>  		/* Apply all upper menus' visibilities to actual prompts. */
> >>  		if(type == P_PROMPT) {
> >> +			struct expr *dup_expr;
> >
> > I'd rather this variable defined below:
> >
> >>  			struct menu *menu = current_entry;
> >>  
> >>  			while ((menu = menu->parent) != NULL) {
> >
> > ... here, in the block where it is used, since it is not relevant
> > outside this block.
> 
> Indeed, I will fix this.
> I also noticed that I should fix some spelling (e.g. side effect instead
> of side-effect).  I hope it is OK, to wait for your tests before sending
> a v2.

If you're speaking about typoes in your patch, I'll just fix them here
(along with the variable move above), don't worry.

If you're speaking about typoes in the rest of the code, then please
submit a separate patch.

> >>  				if (!menu->visibility)
> >>  					continue;
> >> +				/*
> >> +				 * Do not add a reference to the
> >> +				 * menu's visibility expression but
> >> +				 * use a copy of it.  Otherwise the
> >> +				 * expression reduction functions
> >> +				 * will modify expressions that have
> >> +				 * multiple references which can
> >> +				 * cause unwanted side-effects.
> >> +				 */
> >> +				dup_expr = expr_copy(menu->visibility);
> >
> > I wonder if/where this should be de-allocated.
> 
> Actually, I did not find any piece of code that systematically free()s
> the allocated data structures

Indeed.
My question was a bit rhetorical.

> and I also think that it would be good to
> have such code, because that would have caused double-free()s and
> therfore noticed us immediately when we create multiple references to
> expressions.
> 
> My plan was, to first to fix this single problem and then take care for
> a larger review of dynamically allocated memory.

Yes, that would be awesome! :-)

> I tested mconf for example with valgrind and the next thing I planned to
> suggest is to make the kconfig code mostly "valgrind-clean".  But I
> expect this to become a rather extensive change and would like to hear
> if others also think it should be done.

Although a little bit of memory leak in kconfig is no big issue for the
kernel tree (since the frontends are rather short-lived programs), other
users of kconfig may use long-lived processes that would suffer from
memory leaks.

Fixing those would be a net gain, I believe.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
