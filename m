Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:50726 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758048AbYEVH23 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 May 2008 03:28:29 -0400
Date: Thu, 22 May 2008 03:28:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: [2.6 patch] run all userspace headers through unifdef
In-Reply-To: <1211440369.21380.395.camel@pmac.infradead.org>
Message-ID: <alpine.LFD.1.10.0805220327190.7016@localhost.localdomain>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>  <20080520000835.80f7b14a.akpm@linux-foundation.org>  <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>  <20080521014337.1543ff20.akpm@linux-foundation.org>
 <1211360434.21380.319.camel@pmac.infradead.org>  <20080521100245.GC18352@cs181133002.pp.htv.fi>  <1211366874.21380.341.camel@pmac.infradead.org>  <20080521174143.GE15355@cs181133002.pp.htv.fi>  <20080521232243.bca09103.akpm@linux-foundation.org>
 <1211439612.21380.385.camel@pmac.infradead.org>  <20080522000838.da3931e0.akpm@linux-foundation.org> <1211440369.21380.395.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Adrian Bunk <bunk@kernel.org>, sam@ravnborg.org, kbuild devel list <linux-kbuild@vger.kernel.org>

On Thu, 22 May 2008, David Woodhouse wrote:

> On Thu, 2008-05-22 at 00:08 -0700, Andrew Morton wrote:
> > On Thu, 22 May 2008 08:00:12 +0100 David Woodhouse <dwmw2@infradead.org> wrote:
> >
> > > On Wed, 2008-05-21 at 23:22 -0700, Andrew Morton wrote:
> > > >
> > > > This is going to be a bit of a pain for everyone - people are forever
> > > > patching those Kbuild files.
> > > >
> > > > Is there a way in which we can do this in stages?  Treat header-y in
> > > > the same manner as unifdef-y, then get all the unifdef-y's switched over
> > > > to header-y and once that is done, remove the "treat header-y in the same
> > > > manner as unifdef-y" support?
> > >
> > > We could. But does that actually reduce the pain, or just spread it
> > > about a bit?
> >
> > It means Stephen and I only need to carry the bulk of the patch
> > for a few days rather than a month or more.
>
> OK, maybe that makes sense then. Linus can do the conversion with a
> simple sed invocation whenever we're ready.

awesome.  another one of my cleanup scripts i can throw away.  then
i'll be down to ... uh ... lots.  :-)

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
