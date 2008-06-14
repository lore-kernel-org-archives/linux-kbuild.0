Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:42335 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754299AbYFNJsZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jun 2008 05:48:25 -0400
Date: Sat, 14 Jun 2008 12:48:21 +0300
From: Adrian Bunk <bunk@kernel.org>
Subject: Re: about size optimizations (Re: Not as much ccache win as I
	expected)
Message-ID: <20080614094821.GE1716@cs181133002.pp.htv.fi>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com> <1213429403.26255.298.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1213429403.26255.298.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Oleg Verych <olecom@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

On Sat, Jun 14, 2008 at 08:43:23AM +0100, David Woodhouse wrote:
> On Fri, 2008-06-13 at 22:52 +0100, Oleg Verych wrote:
> > Using same `gcc -E` principle, I once had a dream to create
> > build with something like "whole-kernel-at-time" optimising
> > compiler option:
> 
> Doing it for the whole kernel probably doesn't buy you a whole lot more
> than doing it a bit more selectively, which is what I was doing in
> http://lkml.org/lkml/2006/8/24/212

For the interesting CONFIG_MODULES=n case it most likely can give you 
much smaller code.

But Denys had section garbage collection patches, and combining the 
per-module compilation with section garbage collection might get near
at the results of compiling the whole kernel at once?

> I think Segher has been playing with it a bit recently, and confirms my
> suspicion that combining kernel/ with arch/$ARCH/kernel, and mm/ with
> arch/$ARCH/mm, is also a big win.
>...

The big problem I see here is that we lose the link order.

Not unfixable, but quite nasty to sort out.

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

