Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from baikonur.stro.at ([88.198.36.42]:34473 "EHLO baikonur.stro.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932520Ab3HNSXE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Aug 2013 14:23:04 -0400
Date: Wed, 14 Aug 2013 20:15:23 +0200
From: maximilian attems <max@stro.at>
Subject: Re: [PATCH] Provide version number for Debian firmware package
Message-ID: <20130814181523.GA16017@stro.at>
References: <1376250919-13886-1-git-send-email-xypron.glpk@gmx.de>
 <520A9528.4000309@suse.cz>
 <1376427766.11676.42.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376427766.11676.42.camel@deadeye.wl.decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kbuild@vger.kernel.org

On Tue, 13 Aug 2013, Ben Hutchings wrote:

> On Tue, 2013-08-13 at 22:20 +0200, Michal Marek wrote:
> > Dne 11.8.2013 21:55, Heinrich Schuchardt napsal(a):
> > > scripts/package/builddeb is used to create Debian packages.
> > > Currently the firmware package always gets the same version number
> > > irrespective of the Kernel version.
> > > The paths inside the firmware package depend on the Kernel
> > > version.
> > > 
> > > With the patch supplied the Kernel version becomes part of the
> > > Debian firmware package number.
> > 
> > Ben, Max, is this how the official linux-firmware-image package is built
> > in Debian? The change makes sense to me.
> 
> but since builddeb is already doing so, and the generated package
> installs files in /lib/firmware/$version, it would make sense to include
> $version in the package name.

acked by me too.

-- 
maks
