Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:41085 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761006AbZDASuu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 14:50:50 -0400
Date: Wed, 1 Apr 2009 20:47:55 +0200
From: maximilian attems <max@stro.at>
Subject: Re: Comments on deb-pkg patch series
Message-ID: <20090401184755.GC3901@baikonur.stro.at>
References: <20090401162320.GY3901@baikonur.stro.at> <200904011953.53889.elendil@planet.nl> <20090401175733.GA3901@baikonur.stro.at> <200904012035.58852.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200904012035.58852.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wed, Apr 01, 2009 at 08:35:57PM +0200, Frans Pop wrote:
> On Wednesday 01 April 2009, maximilian attems wrote:
> > > Technically it does not matter, correct. But for the same reason
> > > there is also no good reason to make it the same as the debian linux
> > > images source package.
> > >
> > > And as it is factually incorrect I still don't like it. It would very
> > > simply result in incorrect info if people query their system using
> > > tools like grep-dpkg, or even if they just just view the package
> > > info.
> [...]
> > so i still miss your point why make deb-pkg shouldn't show that too!
> 
> See quoted text above. Even if a binary package _can_ be built from the 
> linux-2.6 source package using deb-pkg, in almost all cases that will 
> _not_ be the case. For me that in itself is sufficient reason not to 
> set "Source: linux-2.6". It very simply does not reflect the truth.

please get your linux-2.6 debianism out of your head. yes most of
the time make deb-pkg will be used by an upstream tarball or git tree.
it will certainly *not* be build by the "source" package linux.
so that is certainly wrong.

i repeat my argument that you have to go for the general case of
linux-2.6, so it will be correct in many cases instead of beeing
always incorrect.

 
> > btw this patch also fixes wrong section behaviour of make deb-pkg.
> 
> Ah, yes. I forgot about that. I do agree with that part of the patch.
> 
> With the recent restructuring of the archive the correct section for 
> kernel packages would be "kernel" and not "admin", but for deb-pkg we 
> probably should postpone that change for a few years as "kernel" is not 
> yet valid for stable and oldstable.

ack, right.
