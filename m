Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:52736 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753369Ab3D0STU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 14:19:20 -0400
Date: Sat, 27 Apr 2013 14:19:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: strange behaviour from "make localmodconfig" throws out ath9k
 stuff
In-Reply-To: <20130427174226.GA25088@free.fr>
Message-ID: <alpine.DEB.2.02.1304271412250.27554@oneiric>
References: <alpine.DEB.2.02.1304261459030.17575@oneiric> <20130427153833.GC3355@free.fr> <alpine.DEB.2.02.1304271325240.12586@oneiric> <20130427174226.GA25088@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, 27 Apr 2013, Yann E. MORIN wrote:

> Robert, All,
>
> On Sat, Apr 27, 2013 at 01:30:34PM -0400, Robert P. J. Day wrote:
> >   to recap, current status of kernel source:
> >
> > $ git show
> > commit d7d7271f421f1e45289f2a737c7f636c02c673ce
> > Merge: 96edcf3 c95789e
> > Author: Linus Torvalds <torvalds@linux-foundation.org>
> > Date:   Fri Apr 26 08:17:07 2013 -0700
> > ...
> >
> >   next:
> >
> > $ make distclean
> >
> >   next:
> >
> > $ make allmodconfig
> >
> >   next:
> >
> > $ make localmodconfig
> >
> >   at which time i get asked four questions that i respond to manually:
> >
> > User namespace (USER_NS) [N/y/?] (NEW)
> > Require conversions between uid/gids and their internal representation (UIDGID_STRICT_TYPE_CHECKS) [N/y/?] (NEW)
> > BT8XX GPIO abuser (GPIO_BT8XX) [N/m/y/?] (NEW)
> > EVM support (EVM) [N/y/?] (NEW)
> >
> > for which i simply hit ENTER each time, and no errors. *however*, if i
> > run "make localmodconfig" a second time (which theoretically should be
> > acceptable, correct?), that's when i get:
> >
> > $ make localmodconfig
> > using config: '.config'
> > WARNING: ATH9K_HW is required, but nothing in the
> >   current config selects it.
> > WARNING: ATH_COMMON is required, but nothing in the
> >   current config selects it.
> > WARNING: ATH9K_COMMON is required, but nothing in the
> >   current config selects it.
> > module ath9k did not have configs CONFIG_ATH9K
> > module ath did not have configs CONFIG_ATH_COMMON
> > module ath9k_hw did not have configs CONFIG_ATH9K_HW
> > module ath9k_common did not have configs CONFIG_ATH9K_COMMON
> > #
> > # configuration written to .config
> > #
> > $
> >
> >   i assume it should be easy for someone else to reproduce this, but
> > if you want me to do any more testing later this afternoon, let me
> > know.
>
> I've bisected v3.7 (good) to v3.8 (already bad) with your lsmod, and
> using this script:
>     #!/bin/bash
>     set -e
>     git clean -dX
>     git clean -d
>     make allmodconfig
>     make LSMOD=/home/ymorin/r.pj.day.lsmod localmodconfig
>     grep ATH9K .config
>
> (and manually answering the few new questions), and it turned up the
> following cset as the culprit:
>     23c1d7f: wireless: allow Atheros card to not depend on ath.ko
>
> Not sure where to go from there... :-/

  i'm going to take a wild, uneducated stab at this, but it matches
what i was starting to suspect, anyway. this has nothing to do with
config processing, it has to do specifically with how the Kconfig
entries related to atheros cards were changed.

  here's the important part:

$ git show 23c1d7f
... snip ...
    So, this patch introduce new Kconfig variable ATH_CARDS for belonging
    to the "Atheros Wireless Cards" family; while ATH_COMMON becomes hidden
    variable to express dependency on common Atheros code in ath.ko. Modules
    that depend on this common code now express it by setting ATH_COMMON.
... snip ...
-menuconfig ATH_COMMON
+config ATH_COMMON
+       tristate
+
+menuconfig ATH_CARDS

  in short, a new variable, ATH_CARDS, was introduced that doesn't
appear in the earlier .config so, unsurprisingly, when you run "make
oldconfig", in the midst of all of the other manual answers, you have
to specify what you want done, and look at the default:

$ make oldconfig
... many manual choices ...
Atheros Wireless Cards (ATH_CARDS) [N/m/?] (NEW)   <-- there's the culprit
... snip ...

  so running the standard "yes '' | make oldconfig" is going to
deselect what looks like almost all ath9k-related stuff, simply
because a new, low-level dependency variable was introduced.

  am i making sense here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
