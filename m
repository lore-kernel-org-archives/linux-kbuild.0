Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:41030 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382Ab3D2Ky3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 06:54:29 -0400
Date: Mon, 29 Apr 2013 06:54:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <20130428202854.GC4571@free.fr>
Message-ID: <alpine.DEB.2.02.1304290645150.16211@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric> <20130427153833.GC3355@free.fr> <alpine.DEB.2.02.1304271325240.12586@oneiric> <20130427174226.GA25088@free.fr> <alpine.DEB.2.02.1304271412250.27554@oneiric> <20130428202854.GC4571@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Steven Rostedt <srostedt@redhat.com>

On Sun, 28 Apr 2013, Yann E. MORIN wrote:

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

  i *think* i see what's going on here. here's the list of
atheros-related modules currently loaded on my system that would be
used as the basis for "make localmodconfig":

$ lsmod | grep ^ath
ath9k                 110134  0
ath9k_common           14053  1 ath9k
ath9k_hw              405771  2 ath9k,ath9k_common
ath                    23827  3 ath9k,ath9k_common,ath9k_hw
$

  note there is no module named "ath_cards", but my starting .config
indeed contains an entry for that as a module:

$ grep CONFIG_ATH ../3.9.config
CONFIG_ATH_COMMON=m
CONFIG_ATH_CARDS=m                 <-- there
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
# CONFIG_ATH9K_AHB is not set
# CONFIG_ATH9K_DEBUGFS is not set
CONFIG_ATH9K_RATE_CONTROL=y
# CONFIG_ATH9K_HTC is not set
# CONFIG_ATH6KL is not set
$

  and that symbol is defined in drivers/net/wireless/ath/Kconfig as a
"menuconfig":

config ATH_COMMON
        tristate

menuconfig ATH_CARDS                            <-- there
        tristate "Atheros Wireless Cards"
        ... snip ...

  so i'm just going to *guess* that the config procedure, when faced
with the line "CONFIG_ATH_CARDS=m", goes looking for a loaded module
called "ath_cards" or "ath9k_cards", doesn't find it, and turns off
that selection, consequently turning off *all* of my atheros
functionality.

  the Kconfig file claims that:

"menuconfig ATH_CARDS
        tristate "Atheros Wireless Cards"
        depends on CFG80211 && (!UML || BROKEN)
        ---help---
          This will enable the support for the Atheros wireless drivers.
          ath5k, ath9k, ath9k_htc and ar9170 drivers share some common code, this option
          enables the common ath.ko module which shares common helpers.
                             ^^^^^^

  but the corresponding Makefile has:

obj-$(CONFIG_ATH_COMMON)        += ath.o

where ath.o depends on ATH_COMMON, *not* ATH_CARDS.

  that just seems like a badly-written set of Kconfig structures and
dependencies.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
