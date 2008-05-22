Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:42661 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759408AbYEVHM5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 May 2008 03:12:57 -0400
Subject: Re: [2.6 patch] run all userspace headers through unifdef
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20080522000838.da3931e0.akpm@linux-foundation.org>
References: <alpine.LFD.1.10.0805172016210.8908@localhost.localdomain>
	 <20080520000835.80f7b14a.akpm@linux-foundation.org>
	 <alpine.LFD.1.10.0805210434180.7101@localhost.localdomain>
	 <20080521014337.1543ff20.akpm@linux-foundation.org>
	 <1211360434.21380.319.camel@pmac.infradead.org>
	 <20080521100245.GC18352@cs181133002.pp.htv.fi>
	 <1211366874.21380.341.camel@pmac.infradead.org>
	 <20080521174143.GE15355@cs181133002.pp.htv.fi>
	 <20080521232243.bca09103.akpm@linux-foundation.org>
	 <1211439612.21380.385.camel@pmac.infradead.org>
	 <20080522000838.da3931e0.akpm@linux-foundation.org>
Content-Type: text/plain
Date: Thu, 22 May 2008 08:12:49 +0100
Message-Id: <1211440369.21380.395.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Adrian Bunk <bunk@kernel.org>, sam@ravnborg.org, "Robert P. J. Day" <rpjday@crashcourse.ca>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Thu, 2008-05-22 at 00:08 -0700, Andrew Morton wrote:
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

OK, maybe that makes sense then. Linus can do the conversion with a
simple sed invocation whenever we're ready.

-- 
dwmw2

