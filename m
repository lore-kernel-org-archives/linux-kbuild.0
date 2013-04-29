Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:18340 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757404Ab3D2ODC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 10:03:02 -0400
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
From: Steven Rostedt <srostedt@redhat.com>
In-Reply-To: <20130428202854.GC4571@free.fr>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>
	 <20130427153833.GC3355@free.fr>
	 <alpine.DEB.2.02.1304271325240.12586@oneiric>
	 <20130427174226.GA25088@free.fr>
	 <alpine.DEB.2.02.1304271412250.27554@oneiric>
	 <20130428202854.GC4571@free.fr>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Apr 2013 10:02:54 -0400
Message-ID: <1367244174.28120.3.camel@fedora>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sun, 2013-04-28 at 22:28 +0200, Yann E. MORIN wrote:
> Robert, All,
> 
> On Sat, Apr 27, 2013 at 02:19:05PM -0400, Robert P. J. Day wrote:
> >   i'm going to take a wild, uneducated stab at this, but it matches
> > what i was starting to suspect, anyway. this has nothing to do with
> > config processing, it has to do specifically with how the Kconfig
> > entries related to atheros cards were changed.
> > 
> >   here's the important part:
> > 
> > $ git show 23c1d7f
> > ... snip ...
> >     So, this patch introduce new Kconfig variable ATH_CARDS for belonging
> >     to the "Atheros Wireless Cards" family; while ATH_COMMON becomes hidden
> >     variable to express dependency on common Atheros code in ath.ko. Modules
> >     that depend on this common code now express it by setting ATH_COMMON.
> > ... snip ...
> > -menuconfig ATH_COMMON
> > +config ATH_COMMON
> > +       tristate
> > +
> > +menuconfig ATH_CARDS
> > 
> >   in short, a new variable, ATH_CARDS, was introduced that doesn't
> > appear in the earlier .config so, unsurprisingly, when you run "make
> > oldconfig", in the midst of all of the other manual answers, you have
> > to specify what you want done, and look at the default:
> > 
> > $ make oldconfig
> > ... many manual choices ...
> > Atheros Wireless Cards (ATH_CARDS) [N/m/?] (NEW)   <-- there's the culprit
> > ... snip ...
> > 
> >   so running the standard "yes '' | make oldconfig" is going to
> > deselect what looks like almost all ath9k-related stuff, simply
> > because a new, low-level dependency variable was introduced.
> > 
> >   am i making sense here?
> 
> Not sure how streamline_config,pl should behave. Cc-ing Steven as the
> original author, maybe he has a better understanding on this situation.

Running an older config on a newer kernel can have strange effects,
although I do that all the time. I just expect the strange effects and
fix them when they occur.

Looks like the above is one of the strange effects that need a manual
fix. localmodconfig will not enable anything that wasn't enabled in the
original config. If a new dependency is added by a newer kernel then you
need to run an make oldconfig and make sure you have everything before
doing a localmodconfig. Otherwise, you may lose a module.

Hmm, I may be able to have localmodconfig warn if it can not satisfy a
module.

-- Steve



