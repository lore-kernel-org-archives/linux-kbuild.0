Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:56758 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752838AbYEJL7K (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 May 2008 07:59:10 -0400
Date: Sat, 10 May 2008 13:59:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: New kbuild git trees [Was: linux-next: kbuild build failure]
Message-ID: <20080510115945.GA29171@uranus.ravnborg.org>
References: <20080506221756.95f572af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080506221756.95f572af.sfr@canb.auug.org.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <michael@ellerman.id.au>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, May 06, 2008 at 10:17:56PM +1000, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build of a particular config we use in the kisskb
> build system (see
> http://kisskb.ellerman.id.au/kisskb/buildresult/26810/).  However the
> failure is rather clear: we are a victim of commit
> 7fe94b58075431f4f8be500b297b0daa372daf62 ("kconfig: make oldconfig less
> chatty and clean up conf.c") which includes the comment "We now check for
> valid stadin in both cases and this may break a script here and there".
> So "here and there" may be more problematic than you imagined.

Hi Stepehen.


I have replaced kbuild.git with two next git repositories:

kbuild-fixes.git => stuff designated for -linus after -rc1.
kbuild-next.git => stuff for next merge window.
Everything in the master branch.

They are both empty at the moment but I have a few patches that
will hit -fixes soon (including MAINTAINERS update reflecting this).

The problematic kconfig patches will hit -next when they are
redone and have survived a somehow more extensive testing than
last round.

I would expect you to take both kbuild-fixes and kbuild-next in -next.
I do not plan to have a -mm specific tree as I do not work
with stuff that far in the future (time does not permit so).

	Sam
