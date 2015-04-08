Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:40138 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753058AbbDHXu0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 19:50:26 -0400
Date: Thu, 9 Apr 2015 01:50:23 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] lto: Add __noreorder and mark initcalls __noreorder
Message-ID: <20150408235023.GT2366@two.firstfloor.org>
References: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
 <20150408153112.bd375a883138f4c9fd319645@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150408153112.bd375a883138f4c9fd319645@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, hubicka@ucw.cz

Hi Andrew,

On Wed, Apr 08, 2015 at 03:31:12PM -0700, Andrew Morton wrote:
> On Wed,  8 Apr 2015 06:17:38 -0700 Andi Kleen <andi@firstfloor.org> wrote:
> 
> > From: Andi Kleen <ak@linux.intel.com>
> > 
> > gcc 5 has a new no_reorder attribute that prevents top level
> > reordering only for that symbol.
> 
> I'm having trouble locating gcc documentation which explains all this
> stuff.

The official manuals only have released versions, and gcc 5 is not
released yet, but it's here:

https://github.com/gcc-mirror/gcc/blob/master/gcc/doc/extend.texi#L3505

> > Kernels don't like any reordering of initcalls between files, as several
> > initcalls depend on each other. LTO previously needed to use
> > -fno-toplevel-reordering to prevent boot failures.
> 
> That's "-fno-toplevel-reorder", I believe?

Yes.

> 
> > Add a __noreorder wrapper for the no_reorder attribute and use
> > it for initcalls.
> 
> Head is spinning a bit.  As this all appears to be shiny new
> added-by-andi gcc functionality, it would be useful if we could have a
> few more words describing what it's all about.  Reordering of what with
> respect to what and why and why is it bad.  Why is gcc reordering
> things anyway, and what's the downside of preventing this.  Why is the
> compiler reordering things rather than the linker. etc etc etc.

Ok, let me try.

The original gcc a long time was function at a time: it read one
function, optimizes and writes it out, then the next. Then gcc 3.x
added unit-at-a-time where it reads one complete file, optimizes it
completely and writes it out. This has the advantage that it can make
better inlining decisions, it can remove unused statics, it can propagate
execution frequencies over the call tree before optimizing, and some
other things. Then it writes it out the unit in the call tree order,
which can also lead to better executable layout.  One side effect of
this is that the order of top level statements gets lost, unless you
specify -fno-toplevel-reorder

We had to fix Linux for this sometime in early 2.6, late 2.4. Most
problems were in top level asm() statements, assuming they had a defined
order to other variables. To still support programs doing that gcc added
-fno-toplevel-reorder, which avoided such reordering, but also disabled
a small number of optimizations.

Now 4.x added LTO, where it takes unit-at-a-time one step further and
optimizes the complete program in the same way at link time. It actually
does not keep it in memory all the time, but uses various tricks to only
look at it in pieces and distribute the work to multiple cores. To do
that it uses partitioning, where the program is split into different
partitions based on its global call tree, and then each partition is
assigned to a compiler process.  The result is a changed order for
everything in the final program.

Modern Linux was generally fine with reordering, except for initcalls. We have
a lot of initcalls that assume that some other initcalls already ran
before them, without using priorities. The order is defined in in the
Makefile's object file order for the linker. Linkers generally do not
reorder, unless told to. Unfortunately that gets lost with LTO. 

When I started the LTO patchkit I tried to debug and fix some of these
init calls, but it was hopeless. It was like a many-headed hydra.
So I needed to use -fno-toplevel-reorder for LTO. In LTO this both
gives worse partitioning (so the build is less balanced between
different cores) and also disables some optimizations, like eliminating
unused variables or some cross file optimizations.

gcc 5 finally gained a way to specify the no-toplevel-reorder attribute
per symbol with this new attribute. So it can be only done for the initcall
symbols, and everything else left alone.

That is what this patch is about.

It's not needed without LTO, but I belive it's useful documentation even
without it.

-Andi
