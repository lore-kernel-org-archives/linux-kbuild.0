Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:52334 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab3D0Raq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 13:30:46 -0400
Date: Sat, 27 Apr 2013 13:30:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <20130427153833.GC3355@free.fr>
Message-ID: <alpine.DEB.2.02.1304271325240.12586@oneiric>
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

  to recap, current status of kernel source:

$ git show
commit d7d7271f421f1e45289f2a737c7f636c02c673ce
Merge: 96edcf3 c95789e
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri Apr 26 08:17:07 2013 -0700
...

  next:

$ make distclean

  next:

$ make allmodconfig

  next:

$ make localmodconfig

  at which time i get asked four questions that i respond to manually:

User namespace (USER_NS) [N/y/?] (NEW)
Require conversions between uid/gids and their internal representation (UIDGID_STRICT_TYPE_CHECKS) [N/y/?] (NEW)
BT8XX GPIO abuser (GPIO_BT8XX) [N/m/y/?] (NEW)
EVM support (EVM) [N/y/?] (NEW)

for which i simply hit ENTER each time, and no errors. *however*, if i
run "make localmodconfig" a second time (which theoretically should be
acceptable, correct?), that's when i get:

$ make localmodconfig
using config: '.config'
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
#
# configuration written to .config
#
$

  i assume it should be easy for someone else to reproduce this, but
if you want me to do any more testing later this afternoon, let me
know.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
