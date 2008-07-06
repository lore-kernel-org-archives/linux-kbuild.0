Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56543 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757776AbYGFV1X (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Jul 2008 17:27:23 -0400
Date: Sun, 6 Jul 2008 23:28:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kconfig - hex are considered decimal
Message-ID: <20080706212810.GA8025@uranus.ravnborg.org>
References: <20080629115120.GA4654@uranus.ravnborg.org> <Pine.LNX.4.64.0806301404270.6791@localhost.localdomain> <20080630204032.GA29429@uranus.ravnborg.org> <Pine.LNX.4.64.0806302356340.6791@localhost.localdomain> <20080701061241.GA4922@uranus.ravnborg.org> <Pine.LNX.4.64.0807021420400.6791@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0807021420400.6791@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Jul 02, 2008 at 02:39:08PM +0200, Roman Zippel wrote:
> Hi,
> 
> On Tue, 1 Jul 2008, Sam Ravnborg wrote:
> 
> > - When changing I see the 0x prefix - which I consider OK for hex values
> > - When saving I see the 0x prefix in autoconf.h + .config
> 
> I disagree with the proposed patch. It only makes cosmetical changes, but 
> it doesn't fix the current inconsistenties. Either we do it properly as in 
> the patch below or I'd rather keep it as is.
> The patch checks the default values more strictly, I'm open to opinions 
> whether that warning is useful or maybe just check that hex values have 
> the 0x prefix.
Thanks - I divided your patch up in two.
First one that adds the new checks
And the second that fixes the warnings
> 
> > See patches where kconfig start to use the new
> > method for 'all*config' targets - they are cc:ed to you
> > and available on linux-kbuild.
> > I simply started to use conf_set_all_new_symbols() and
> > as a result I could simplify conf.c.
> > 
> > And things got so simple that I dropped the patches
> > introducing aconf.c.
> 
> I'd actually prefer to move everything noninteractive out of conf.c, as 
> this would be the right place for this:
> 
> > -> Give Redhat's nonint_oldconfig a closer look and see
> >    how to integrate this functionality
> 
> This should be pretty much do it:
> 
> 	for_all_symbols(i, sym) {
> 		sym_calc_value(sym);
> 		if (sym->flags & SYMBOL_WRITE && !sym_has_value(sym))
> 			printf(...);
> 	}
> 
> The point is that this has nothing to do with what's already in conf.c, 
> this should be a separate utility for all noninteractive kconfig jobs.

I do not disagree with you here. But for now it was just more
natural to add it where I deleted the other stuff.
I will move it to a separate .c file later.

	Sam
