Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:41263 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755815AbcKDOYo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Nov 2016 10:24:44 -0400
Date: Fri, 4 Nov 2016 15:24:24 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 2/2] kbuild: add -fno-PIE
Message-ID: <20161104142424.jy6ble3pge3beowh@linutronix.de>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
 <20161102172058.13641-2-bigeasy@linutronix.de>
 <1478213455.29107.13.camel@decadent.org.uk>
 <20161104010811.GD19539@ZenIV.linux.org.uk>
 <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <adb64e4e-0745-c23c-2b8f-a67372b1d28f@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Austin S. Hemmelgarn" <ahferroin7@gmail.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, doko@debian.org

On 2016-11-04 07:37:02 [-0400], Austin S. Hemmelgarn wrote:
> > clued enough to have known better.  Reassigning bug reports in question
> > from gcc-6 to linux is beyond stupid; Balint is either being deliberately
> > obtuse, or geniunely unable to imagine that somebody might be using the
> > compiler _not_ for debian package builds.
> > 
> If it helps, you could point out that Gentoo's hardened profile's GCC builds
> use PIE by default and have absolutely zero issues building the Linux kernel
> without any special kernel patches to turn it off (and has been doing so for
> years).

Interesting. So I took a look at Gentoo. They ship gcc 4.9.3 by default.
They have their own PIE patch since it is not yet supported by gcc. And
let me quote why that works for them:

| This file will add -fstack-protector-all, -fstack-check, -fPIE, -pie and -z now 
| as default if the defines and the spec allow it.
| Added a hack for gcc-specs-* in toolchain-funcs.eclass and _filter-hardened in flag-o-matic.eclass
| to support older hardened GCC patches and we don't need to change the code on gcc-specs-* and _filter-hardened.
| This will add some unsupported upstream commands options as -nopie and -nonow.
| -D__KERNEL__ is added so we don't have -fPIE, -pie and -fstack-protector-all and -fstack-check when building kernels.
| ESP_CC1_SPEC is added to CC1_SPEC.
| ESP_CC1_STRICT_OVERFLOW_SPEC is added so we don't disable the strict-overflow check.
| ESP_LINK_PIE_CHECK_SPEC check for -pie, -p, -pg, -profile and -static.
| ENABLE_CRTBEGINP add support for crtbeginP.o, build -static with -fPIE or -fpie.

I was thinking about asking doko for something similar but no. Looking at
portage they have a few patches where they add -fno-PIE to some packages.
Also disabling PIE based on __KERNEL__ does not look right. So no, Gentoo
did not better.
And according to Google, there are also people in the ARCH Linux camp
with the same problem. Gentoo's 6 gcc is completely masked and it does
not reference the patch I quote above so Gentoo will run into this
problem once they enable gcc 6 and don't add the -D__KERNEL__ hack.
Eventually Fedora and SUSE will migrate to PIE by default and by then we
should cover all major distros so even Al should be affected unless he
decides not to update or is using something else.

Sebastian
