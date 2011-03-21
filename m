Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:60104 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752156Ab1CUHsI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Mar 2011 03:48:08 -0400
Date: Mon, 21 Mar 2011 08:47:48 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [GIT] kbuild core updates for 2.6.39-rc1
Message-ID: <20110321074748.GF27124@pengutronix.de>
References: <20110319085802.GA18336@sepie.suse.cz>
 <AANLkTin5vYaU83K0YOdD1OgCS24LA8XBSvNfmGFnjhGF@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTin5vYaU83K0YOdD1OgCS24LA8XBSvNfmGFnjhGF@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, bp@alien8.de, dot@dotat.at, mikew@google.com, randy.dunlap@oracle.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>, Randy Dunlap <rdunlap@xenotime.net>

On Sun, Mar 20, 2011 at 05:53:24PM -0700, Linus Torvalds wrote:
> On Sat, Mar 19, 2011 at 1:58 AM, Michal Marek <mmarek@suse.cz> wrote:
> >
> > * Section mismatch analysis enabled by default
> >  - there are only a few warnings for defconfig builds,
> >    all{yes,mod}config still has a lot of them. Depending on the general
> >    perception of this change, we might disable it later in the rc phase
> >    again.
> 
> No.
> 
> We don't enable stuff like this by default. Not when it actually
> changes some really fundamental compiler flags, and thus the whole "we
> can disable it late in -rc again" is a totally broken option, since if
> we have any compiler issues, we'd want to know it early.
Note that the default y doesn't result from the patch in this pull
request but from 
	1d53661 (blackfin: enable DEBUG_SECTION_MISMATCH)
. I admit I didn't think deeply about it, but keeping it seemed OK for
me.

> And we _know_ we are going to disable it, since it enables the "don't
> inline" flag to gcc for called-once functions. So there's no question
> at all what the default should be in any release kernel.
I wasn't aware of that, Mike so even "default y if BLACKFIN" seems to be
a bad idea.

Michal, do you want just remove the default y and squash it into the
commit?
And something that just occured my now is that the warning about
CONFIG_DEBUG_SECTION_MISMATCH in scripts/mod/modpost.c could get an
update, too.  Something like:

 		warn("modpost: Found %d section mismatch(es).\n"
-		     "To see full details build your kernel with:\n"
-		     "'make CONFIG_DEBUG_SECTION_MISMATCH=y'\n",
+		     "To see full details enable CONFIG_DEBUG_SECTION_MISMATCH in your .config.\n"
		     sec_mismatch_count);

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
