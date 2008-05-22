Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:35494 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758500AbYEVHjo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 May 2008 03:39:44 -0400
Date: Thu, 22 May 2008 10:37:26 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [2.6 patch] run all userspace headers through unifdef
Message-ID: <20080522073726.GG16376@cs181133002.pp.htv.fi>
References: <20080520000835.80f7b14a.akpm@linux-foundation.org> <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain> <20080521014337.1543ff20.akpm@linux-foundation.org> <1211360434.21380.319.camel@pmac.infradead.org> <20080521100245.GC18352@cs181133002.pp.htv.fi> <1211366874.21380.341.camel@pmac.infradead.org> <20080521174143.GE15355@cs181133002.pp.htv.fi> <20080521232243.bca09103.akpm@linux-foundation.org> <1211439612.21380.385.camel@pmac.infradead.org> <20080522000838.da3931e0.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080522000838.da3931e0.akpm@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, sam@ravnborg.org, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Thu, May 22, 2008 at 12:08:38AM -0700, Andrew Morton wrote:
> On Thu, 22 May 2008 08:00:12 +0100 David Woodhouse <dwmw2@infradead.org> wrote:
> 
> > On Wed, 2008-05-21 at 23:22 -0700, Andrew Morton wrote:
> > > 
> > > This is going to be a bit of a pain for everyone - people are forever
> > > patching those Kbuild files.
> > > 
> > > Is there a way in which we can do this in stages?  Treat header-y in
> > > the same manner as unifdef-y, then get all the unifdef-y's switched over
> > > to header-y and once that is done, remove the "treat header-y in the same
> > > manner as unifdef-y" support?
> > 
> > We could. But does that actually reduce the pain, or just spread it
> > about a bit?
> 
> It means Stephen and I only need to carry the bulk of the patch for a
> few days rather than a month or more.

The bulk is the change to include/linux/Kbuild that is more than 50% of 
my patch.

And that's also where the conflicts will be.

If you care about conflicts let's sneak it into Linus' tree right now - 
after all my patch touches nothing that could possibly break stuff other 
then the userspace headers.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

