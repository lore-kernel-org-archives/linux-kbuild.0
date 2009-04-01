Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:56916 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757014AbZDARfb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 13:35:31 -0400
Date: Wed, 1 Apr 2009 19:32:36 +0200
From: maximilian attems <max@stro.at>
Subject: Re: Comments on deb-pkg patch series
Message-ID: <20090401173236.GZ3901@baikonur.stro.at>
References: <20090401162320.GY3901@baikonur.stro.at> <200904011907.31585.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200904011907.31585.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wed, Apr 01, 2009 at 07:07:29PM +0200, Frans Pop wrote:
> On Wednesday 01 April 2009, maximilian attems wrote:
> > Sam can you please merge 1-6 of the series as those are not contested.
> > thanks.
> 
> I continue to object to patch 4.

your objection on patch 4 is disregarded.
 
> > the patches were submitted to the relevant subsystem,
> > no need to flood lkml with such.
> 
> However, they are also patches with a fairly general impact that should be 
> reviewed by more people than just the narrow group that is subscribed to 
> kbuild. lkml is the generic list and is often CCed in such cases. AFAIK 
> most kbuild patches go through lkml.
> It's just chance that I saw these and was able to comment.

come on, i pointed out this thread to you.
it is enough to post to relevant maintainer list.
subscribe to linux-fs if you interested in vfs changes and so on..
 
> > > [PATCH 4/7] deb-pkg: Fix Section and Source field
> > >             http://marc.info/?l=linux-kbuild&m=123851275123210&w=2
> > >
> > > I strongly disagree with this patch.
> > >
> > > linux-2.6 is the source package for official Debian kernels and
> > > packages built using deb-pkg are NOT built from that source package.
> > > IMO there's no need to change it (the field is required and thus
> > > cannot simply be dropped). If it does want changing for some reason
> > > I'd suggest "linux-upstream" or similar.
> >
> > no,
> > just checkout linux-2.6 git and you'll get per default a matching
> > linux-2.6 dir, so your arg does not stand.
> 
> That still does not change the fact that when I build directly from git 
> head or whatever other git branch or downloaded upstream source the 
> binary package is *not* built from the linux-2.6 source package.
> 
> Therefore setting source to linux-2.6 is factually incorrect.

no it is not more incorrect then setting to linux.
we don't care about corner cases, but go for the general one:
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
cd linux-2.6
make <config>
make deb-pkg

it does *not* matter that linux-2.6 happens to be same name
than the debian linux images source package.
 
[ snipping discussion of patch 7 that will get reworked ]

-- 
maks
