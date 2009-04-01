Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:40565 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758309AbZDASBm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 14:01:42 -0400
Date: Wed, 1 Apr 2009 19:57:33 +0200
From: maximilian attems <max@stro.at>
Subject: Re: Comments on deb-pkg patch series
Message-ID: <20090401175733.GA3901@baikonur.stro.at>
References: <20090401162320.GY3901@baikonur.stro.at> <200904011907.31585.elendil@planet.nl> <20090401173236.GZ3901@baikonur.stro.at> <200904011953.53889.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200904011953.53889.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wed, Apr 01, 2009 at 07:53:52PM +0200, Frans Pop wrote:
> On Wednesday 01 April 2009, maximilian attems wrote:
> > > I continue to object to patch 4.
> >
> > your objection on patch 4 is disregarded.
> 
> Eh, sorry, but that's not up to you. It's fine that you disagree with me. 
> But as you're not the owner or primary maintainer of the builddeb script, 
> you don't get to "disregard" comments from anybody.
> 
> I'm happy to let Sam decide on this based on the given arguments. Maybe 
> others will comment too.

no
on patch 7 you had a technical reason,
thus i agree with you that this needs better thought or work.
 
> > it does *not* matter that linux-2.6 happens to be same name
> > than the debian linux images source package.
> 
> Technically it does not matter, correct. But for the same reason there is 
> also no good reason to make it the same as the debian linux images source 
> package.
> 
> And as it is factually incorrect I still don't like it. It would very 
> simply result in incorrect info if people query their system using tools 
> like grep-dpkg, or even if they just just view the package info.

we in the Debian kernel team use linux-2.6 as we use the linux-2.6 git
tree as upstream, as it happens to be the primary upstream. so i still
miss your point why make deb-pkg shouldn't show that too!

btw this patch also fixes wrong section behaviour of make deb-pkg.

