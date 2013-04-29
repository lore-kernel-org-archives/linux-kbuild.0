Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:42955 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751784Ab3D2O2g (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 10:28:36 -0400
Date: Mon, 29 Apr 2013 10:28:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <1367244700.28120.6.camel@fedora>
Message-ID: <alpine.DEB.2.02.1304291022320.9234@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric>  <20130427153833.GC3355@free.fr>  <alpine.DEB.2.02.1304271325240.12586@oneiric>  <20130427174226.GA25088@free.fr>  <alpine.DEB.2.02.1304271412250.27554@oneiric>  <20130428202854.GC4571@free.fr>
 <alpine.DEB.2.02.1304290645150.16211@oneiric> <1367244700.28120.6.camel@fedora>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: rostedt@goodmis.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 29 Apr 2013, Steven Rostedt wrote:

> On Mon, 2013-04-29 at 06:54 -0400, Robert P. J. Day wrote:
> > On Sun, 28 Apr 2013, Yann E. MORIN wrote:
>
> >   note there is no module named "ath_cards", but my starting .config
> > indeed contains an entry for that as a module:
> >
> > $ grep CONFIG_ATH ../3.9.config
> > CONFIG_ATH_COMMON=m
> > CONFIG_ATH_CARDS=m                 <-- there
>
> Ah, it was enabled when you ran localmodconfig?
>
> > # CONFIG_ATH_DEBUG is not set
> > # CONFIG_ATH5K is not set
> > # CONFIG_ATH5K_PCI is not set
> > CONFIG_ATH9K_HW=m
> > CONFIG_ATH9K_COMMON=m
> > CONFIG_ATH9K_BTCOEX_SUPPORT=y
> > CONFIG_ATH9K=m
> > CONFIG_ATH9K_PCI=y
> > # CONFIG_ATH9K_AHB is not set
> > # CONFIG_ATH9K_DEBUGFS is not set
> > CONFIG_ATH9K_RATE_CONTROL=y
> > # CONFIG_ATH9K_HTC is not set
> > # CONFIG_ATH6KL is not set
> > $
> >
> >   and that symbol is defined in drivers/net/wireless/ath/Kconfig as a
> > "menuconfig":
> >
> > config ATH_COMMON
> >         tristate
> >
> > menuconfig ATH_CARDS                            <-- there
> >         tristate "Atheros Wireless Cards"
> >         ... snip ...
> >
> >   so i'm just going to *guess* that the config procedure, when faced
> > with the line "CONFIG_ATH_CARDS=m", goes looking for a loaded module
> > called "ath_cards" or "ath9k_cards", doesn't find it, and turns off
> > that selection, consequently turning off *all* of my atheros
> > functionality.
> >
> >   the Kconfig file claims that:
> >
> > "menuconfig ATH_CARDS
> >         tristate "Atheros Wireless Cards"
> >         depends on CFG80211 && (!UML || BROKEN)
> >         ---help---
> >           This will enable the support for the Atheros wireless drivers.
> >           ath5k, ath9k, ath9k_htc and ar9170 drivers share some common code, this option
> >           enables the common ath.ko module which shares common helpers.
> >                              ^^^^^^
> >
> >   but the corresponding Makefile has:
> >
> > obj-$(CONFIG_ATH_COMMON)        += ath.o
> >
> > where ath.o depends on ATH_COMMON, *not* ATH_CARDS.
> >
> >   that just seems like a badly-written set of Kconfig structures and
> > dependencies.
>
> localmodconfig is set up to recognize options dependent on config menus.
> I'll have to take a look. Can you send me your .config file you started
> with, and what lsmod gives you. "lsmod > file". I'll see what broke.
>
> Oh, and one last thing. It's best to email me at rostedt@goodmis.org, as
> I don't always check my work email ;-)

  for what it's worth, it's "make oldconfig" that happily tosses away
the ATH9K-related stuff. with a fresh 3.9 kernel, i pulled over my
.config file that works fine for 3.7, and here's the important stuff
(atheros-related):

$ grep CONFIG_ATH .config
CONFIG_ATH_COMMON=m
# CONFIG_ATH_DEBUG is not set
CONFIG_ATH5K=m
# CONFIG_ATH5K_DEBUG is not set
# CONFIG_ATH5K_TRACER is not set
CONFIG_ATH5K_PCI=y
CONFIG_ATH9K_HW=m
CONFIG_ATH9K_COMMON=m
CONFIG_ATH9K_BTCOEX_SUPPORT=y
CONFIG_ATH9K=m
CONFIG_ATH9K_PCI=y
CONFIG_ATH9K_AHB=y
CONFIG_ATH9K_DEBUGFS=y
CONFIG_ATH9K_MAC_DEBUG=y
CONFIG_ATH9K_RATE_CONTROL=y
CONFIG_ATH9K_HTC=m
CONFIG_ATH9K_HTC_DEBUGFS=y
# CONFIG_ATH6KL is not set
$

  if i then run:

$ yes '' | make oldconfig

here's the result of that command a second time:

$ grep CONFIG_ATH .config
# CONFIG_ATH_CARDS is not set
$

  all gone. and if i try a localmodconfig, it does in fact warn me
about what's about to happen:

$ make localmodconfig
using config: '.config'
vboxnetadp config not found!!
vboxnetflt config not found!!
vboxdrv config not found!!
vboxpci config not found!!
WARNING: ATH9K_HW is required, but nothing in the
  current config selects it.
WARNING: ATH_COMMON is required, but nothing in the
  current config selects it.
WARNING: ATH9K_COMMON is required, but nothing in the
  current config selects it.
module ath9k did not have configs CONFIG_ATH9K
module ath did not have configs CONFIG_ATH_COMMON
module ath9k_hw did not have configs CONFIG_ATH9K_HW
module ath9k_common did not have configs CONFIG_ATH9K_COMMON
... snip ...

  so it sees the currently loaded modules:

ath9k                 110134  0
ath9k_common           14053  1 ath9k
ath9k_hw              405771  2 ath9k,ath9k_common
ath                    23827  3 ath9k,ath9k_common,ath9k_hw

it just has no idea how to hang onto them, yes?

  at this point, i think this is one of those anomalous corner cases
that has to be recognized and resolved manually. but i can reproduce
all of this from scratch if you'd like to see it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
