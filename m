Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp5.pp.htv.fi ([213.243.153.39]:35484 "EHLO smtp5.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754368AbYDQN5Y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Apr 2008 09:57:24 -0400
Date: Thu, 17 Apr 2008 16:57:14 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: RFC: run all userspace header through unifdef
Message-ID: <20080417135714.GB9314@cs181133002.pp.htv.fi>
References: <20080416192312.GQ1677@cs181133002.pp.htv.fi> <20080416192828.GB3090@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080416192828.GB3090@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Apr 16, 2008 at 09:28:28PM +0200, Sam Ravnborg wrote:
> On Wed, Apr 16, 2008 at 10:23:12PM +0300, Adrian Bunk wrote:
> > Facts:
> > - installing userspace headers is nothing normal users need
> > - unifdef is relatively fast
> > - we have sometimes patches moving headers from header-y to
> >   unifdef-y or the other way round
> > 
> > Any objections against dropping unifdef-y and simply running all headers 
> > through unifdef?
> Not from me at least.
> 
> I had some optimized version of the check done once - but lost the patch
> during an over eager rm -rf (and no backup).
> That patch killed unidef-y and ran everything through unidef.

That's exactly what I want to do.

> It would be a welcome cleanup to avoid the distinction.
>...

I'll send a patch in at about a week if that's OK for you.

This is the kind of patches with low risk and many patch conflicts with 
other patches for whom the end of the merge window is IMHO the best 
time.

> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

