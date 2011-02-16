Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pqueuea.post.tele.dk ([193.162.153.9]:49900 "EHLO
	pqueuea.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742Ab1BPUMF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Feb 2011 15:12:05 -0500
Received: from pfepb.post.tele.dk (pfepb.post.tele.dk [195.41.46.236])
	by pqueuea.post.tele.dk (Postfix) with ESMTP id A3E3EDB95C
	for <linux-kbuild@vger.kernel.org>; Wed, 16 Feb 2011 21:12:04 +0100 (CET)
Date: Wed, 16 Feb 2011 21:11:39 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: kbuild/kconfig for non-Linux projects
Message-ID: <20110216201139.GB25184@merkur.ravnborg.org>
References: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTimpG+9nvad8WnjaORcyZR8Yu5AaYwbQDGOWDjYJ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas De Schampheleire <patrickdepinguin+kbuild@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Feb 16, 2011 at 10:08:08AM +0100, Thomas De Schampheleire wrote:
> Hi,
> 
> I'm interested in using kbuild/kconfig for other projects than the
> Linux kernel. I notice that a lot of projects (e.g. Buildroot,
> Busybox, uClibc, OpenBricks, ...) are already using this framework,
> but it's unclear to me which steps are needed to do so.
> 
> I found a related thread on this mailing list that seemed to have died out.
> http://www.mail-archive.com/kbuild-devel@lists.sourceforge.net/msg02487.html
> 
> I also found a code repository 'menuconfig' here, although I doubt
> that this is an official one:
> http://code.google.com/p/menuconfig/source/browse/trunk/
> 
> Specifically, I'd like to know:
> * are there 'official' sources to kbuild in some repository outside
> the linux kernel?
> * which steps are needed to use kbuild in a project other than the
> linux kernel? Is there some documentation available?

You could take a look at klibc - the kbuild integration used
there is much simpler than what we have in the kernel.
It may need a little refresh - but copying over
Kbuild.include should be 90% of the update.

As for documentation - you should at least read Documentation/kbuild/*

> * what is the license under which kbuild is distributed? In case it's
> GPL, does this impact the license of the software project using
> kbuild, i.e. does using kbuild imply the project being a derived work?

kbuild is part of the build-system. So there is nothing wrong using kbuild
to build your proprietary (closed source) stuff.
So kbuild are under GPLv2 - but that does not impact you program.

Good luck!

	Sam
