Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp4.pp.htv.fi ([213.243.153.38]:52249 "EHLO smtp4.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933664AbYEUKE7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 May 2008 06:04:59 -0400
Date: Wed, 21 May 2008 13:02:45 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: [PATCH] KBUILD: Move non-__KERNEL__-checking headers to
	header-y.
Message-ID: <20080521100245.GC18352@cs181133002.pp.htv.fi>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain> <20080520000835.80f7b14a.akpm@linux-foundation.org> <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain> <20080521014337.1543ff20.akpm@linux-foundation.org> <1211360434.21380.319.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1211360434.21380.319.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, May 21, 2008 at 10:00:34AM +0100, David Woodhouse wrote:
> On Wed, 2008-05-21 at 01:43 -0700, Andrew Morton wrote:
> > On Wed, 21 May 2008 04:36:30 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> > 
> > > On Tue, 20 May 2008, Andrew Morton wrote:
> > > 
> > > > On Sat, 17 May 2008 20:18:07 -0400 (EDT) "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
> > > >
> > > > >
> > > > > Move exported header files under include/linux that don't check the
> > > > > __KERNEL__ preprocessor from unifdef-y to header-y.
> > > > >
> > > >
> > > > Changelog fails to tell us why this change is being made.
> > > >
> > > > Perhaps it's because these headers just don't need unifdef processing?
> > > >
> > > > If so, that seems fragile.  If we later add a __KERNEL__ section to
> > > > a header we need to remember to move the file to unifdef-y, and
> > > > we'll forget.  It'd be better to process all files with unifdef.
> > > >
> > > > Or something.  Or not.
> > > 
> > >   i don't see a problem with simply running all exported files through
> > > unifdef -- i've never understood the two categories since the unifdef
> > > process is not exactly CPU-intensive and it can't possibly hurt for
> > > some of those operations to be redundant.
> > > 
> > >   but as long as the two categories exist, might as well keep them
> > > clean.
> > > 
> > 
> > Well...  not to let this go for now - nuking the header-y stuff is an
> > attractive cleanup.  David, are we missing something here?
> 
> I don't recall unifdef being anywhere near as fast as simply copying the
> headers, but a quick test shows that it is now -- it makes virtually no
> difference to the time if I unifdef them all. Maybe I was just making it
> up, or maybe the unifdef implementation we were using before was a lot
> less efficient.
> 
> The other reason for having header-y separate from unifdef-y was that it
> highlights the difference between headers which are clean and ifdef-free
> (which we like), and headers with ifdefs (which, in general, we don't).
> 
> Since we've removed the gratuitous __KERNEL__ from unexported headers,
> though, I don't think that matters much either -- we can see the ifdefs
> quite happily.
> 
> So I see no particular reason why we shouldn't drop header-y completely
> and just unifdef the lot.

Sam already ACK'ed this idea when I suggested it a few weeks ago and 
I'll get my ass up and cook a patch today or tomorrow.

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

