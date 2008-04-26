Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:42545 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759524AbYDZTzj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Apr 2008 15:55:39 -0400
Date: Sat, 26 Apr 2008 22:55:14 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [GIT PULL] kbuild fixes
Message-ID: <20080426195514.GT2252@cs181133002.pp.htv.fi>
References: <20080426191256.GA784@uranus.ravnborg.org> <20080426192037.GR2252@cs181133002.pp.htv.fi> <20080426193701.GA9131@uranus.ravnborg.org> <20080426194904.GB9131@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20080426194904.GB9131@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sat, Apr 26, 2008 at 09:49:04PM +0200, Sam Ravnborg wrote:
> On Sat, Apr 26, 2008 at 09:37:01PM +0200, Sam Ravnborg wrote:
> > On Sat, Apr 26, 2008 at 10:20:37PM +0300, Adrian Bunk wrote:
> > > On Sat, Apr 26, 2008 at 09:12:56PM +0200, Sam Ravnborg wrote:
> > > > Hi Linus.
> > > > 
> > > > Please apply the following two fixes by pulling from:
> > > > 
> > > >    master.kernel.org/pub/scm/linux/kernel/git/sam/kbuild.git
> > > > 
> > > > 
> > > > The MODULE_LICENSE fix is neded to get an allmodconfig
> > > > build fixed.
> > > 
> > > Which one is this?
> > > 
> > > http://lkml.org/lkml/2008/3/31/50 ?
> > > (my allmod build is not yet finished)
> > 
> > The changelog was actually bad for this one.
> > I saw two classes of problems:
> > 
> > 1) I got report about broken builds - fbdev was the culprint.
> > 2) a "make CONFIG_DEBUG_SECTION_MISMATCH=y" build broke
> >    immediately.
> > 
> > I made it non-fatal because we had at least one module that
> > was not yet fixed.
> And by the way - had this been in -mm/-next as it ought to
> be we wuld know the eventual breakage it would have caused.
>...

I had it in my test builds that cover x86 all modular and all defconfigs 
(except ppc), so I doubt there's much breakage of kind 1) left.

> 	Sam

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

