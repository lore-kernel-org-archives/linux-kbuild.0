Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:52483 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751902Ab3D0RrQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 13:47:16 -0400
Date: Sat, 27 Apr 2013 13:47:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <20130427153833.GC3355@free.fr>
Message-ID: <alpine.DEB.2.02.1304271341360.21853@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric> <20130427153833.GC3355@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, 27 Apr 2013, Yann E. MORIN wrote:

> Robert, All,
>
> On Fri, Apr 26, 2013 at 03:05:02PM -0400, Robert P. J. Day wrote:
> >   probably a simple explanation for this, but my first time playing
> > with "make localmodconfig" and it appears to be tossing all my
> > ath9k-related module settings.
> >
> >   currently running ubuntu on a 64-bit asus laptop with the following
> > ath9k-related modules:
> >
> > $ lsmod | grep ath9k
> > ath9k                 149545  0
> > mac80211              558577  1 ath9k
> > ath9k_common           14054  1 ath9k
> > ath9k_hw              408874  2 ath9k,ath9k_common
> > ath                    23828  3 ath9k,ath9k_common,ath9k_hw
> > cfg80211              211955  3 ath9k,mac80211,ath
> > $
> >
> >   starting with current kernel "git pull", i do:
> >
> > $ make allmodconfig
> >
> > at which point i get:
> >
> > $ grep ATH9K .config
> > CONFIG_ATH9K_HW=m
> > CONFIG_ATH9K_COMMON=m
> > CONFIG_ATH9K_DFS_DEBUGFS=y
> > CONFIG_ATH9K_BTCOEX_SUPPORT=y
> > CONFIG_ATH9K=m
> > CONFIG_ATH9K_PCI=y
> > CONFIG_ATH9K_AHB=y
> > CONFIG_ATH9K_DEBUGFS=y
> > CONFIG_ATH9K_DFS_CERTIFIED=y
> > CONFIG_ATH9K_MAC_DEBUG=y
> > CONFIG_ATH9K_RATE_CONTROL=y
> > CONFIG_ATH9K_HTC=m
> > CONFIG_ATH9K_HTC_DEBUGFS=y
> > $
> >
> > which looks reasonable(?).  then run:
> >
> > $ make localmodconfig
> >
> > have to answer maybe 4 questions manually, at which point i have:
> >
> > $ grep ATH9K .config
>
> Can you send the output of your lsmod, please?

  hang on, something just seems weird here. let me start again with:

$ make distclean

now i'm going to copy the .config file that was the basis of the
currently running kernel:

$ cp /boot/config-3.7.0-rc4+ .config

and i can certainly see that this .config has a number of
ATH9K-related config settings:

$ grep ATH9K .config
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
$

but if i run:

$ yes '' | make oldconfig

i get:

$ grep ATH9K .config
$

that is, all the ATH9K-related modules are deselected. i don't
understand that -- so it's not a "localmodconfig" thing, it's
"oldconfig" that's wiping out my ATH9K config settings. thoughts? am i
doing something invalid?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
