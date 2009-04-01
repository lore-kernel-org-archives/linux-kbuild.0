Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([213.239.196.228]:57760 "EHLO
	baikonur.stro.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933928AbZDATYJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2009 15:24:09 -0400
Date: Wed, 1 Apr 2009 21:21:17 +0200
From: maximilian attems <max@stro.at>
Subject: Re: Comments on deb-pkg patch series
Message-ID: <20090401192117.GD3901@baikonur.stro.at>
References: <20090401162320.GY3901@baikonur.stro.at> <200904012035.58852.elendil@planet.nl> <20090401184755.GC3901@baikonur.stro.at> <200904012111.11664.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200904012111.11664.elendil@planet.nl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frans Pop <elendil@planet.nl>
Cc: linux-kbuild@vger.kernel.org, Andres Salomon <dilinger@debian.org>, tytso@mit.edu, sam@ravnborg.org

On Wed, Apr 01, 2009 at 09:11:09PM +0200, Frans Pop wrote:
> This is going to be my last post about this as we're in danger of 
> repeating ourselves. IMO the arguments are now clear; others will have
> to make the decision here.

well you made your point clear,
but couldn't convince me to not push this patch :)
nor that it has any real negative effect.
 
> On Wednesday 01 April 2009, maximilian attems wrote:
> > please get your linux-2.6 debianism out of your head. yes most of
> > the time make deb-pkg will be used by an upstream tarball or git tree.
> > it will certainly *not* be build by the "source" package linux.
> > so that is certainly wrong.
> 
> Right. But IMO listing a non-existent source package is actually *better* 
> because a .deb built using deb-pkg per definition does not _have_ a 
> source package.
> 
> > i repeat my argument that you have to go for the general case of
> > linux-2.6, so it will be correct in many cases instead of beeing
> > always incorrect.
> 
> linux-2.6 is not the general case, it is an exception. The general case is 
> building from some upstream git branch. (Unless you mean the linux-2.6 
> git tree, but that is totally irrelevant as it's not a source _package_.)

of course i mean the linux-2.6 git tree.
 
> The fact that the package refers to a non-existant source package has an 
> informational value in itself and because there *is* no source package, 
> it is perfectly correct.
> It would be better to not list a source package at all, but that's 
> impossible due to technical requirements.
> 
> As mentioned before, IMO "Source: linux-upstream" would be a better 
> choice.

linux-2.6 is the most used git tree out there,
so it still stands in my eyes as better term then the "linux" Ubuntuism
source package name that make deb-pkg currently uses.

thanks for your input and looking forward to your patch serie.
it be great if you could base it on that serie so that we can
step further onwards in making make deb-pkg the recommended
way of building a linux image deb.
