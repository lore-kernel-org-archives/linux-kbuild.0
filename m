Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:45763 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbbDJXCi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Apr 2015 19:02:38 -0400
Date: Sat, 11 Apr 2015 01:02:36 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: [PATCH] lto: Add __noreorder and mark initcalls __noreorder
Message-ID: <20150410230236.GZ2366@two.firstfloor.org>
References: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
 <20150408153112.bd375a883138f4c9fd319645@linux-foundation.org>
 <20150408235023.GT2366@two.firstfloor.org>
 <20150410143629.aaba355c08d3b71e5c1cddd0@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150410143629.aaba355c08d3b71e5c1cddd0@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andi Kleen <andi@firstfloor.org>, mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, hubicka@ucw.cz

On Fri, Apr 10, 2015 at 02:36:29PM -0700, Andrew Morton wrote:
> On Thu, 9 Apr 2015 01:50:23 +0200 Andi Kleen <andi@firstfloor.org> wrote:
> 
> > > Head is spinning a bit.  As this all appears to be shiny new
> > > added-by-andi gcc functionality, it would be useful if we could have a
> > > few more words describing what it's all about.  Reordering of what with
> > > respect to what and why and why is it bad.  Why is gcc reordering
> > > things anyway, and what's the downside of preventing this.  Why is the
> > > compiler reordering things rather than the linker. etc etc etc.
> > 
> > Ok, let me try.
> 
> That was super-useful, thanks.  I slurped it into the changelog -
> maybe one day it will provide material for Documentation/lto-stuff.txt.
> 
> Big picture: do you have a feeling for how much benefit LTO will yield
> in the kernel, if/when it's all completed?

At least nothing of the stuff I usually run seems to be very kernel compiler
dependent in performance. I think other people may benefit from it.
Just looking at the code it is often a lot better.

We've had great results in code size reduction for small systems though.
I also found a range of bugs in the kernel which is good.

The merge is also nearly finished, only a smaller number of patches
left. There are some future technologies which could benefit from it
too.

There is still some compile time penalty, although it got a lot better
with 5. I wouldn't expect developers to use it day-to-day, but it can
be a good release mode.

I think it's a good thing to have now, just for the benefits for
shrinking kernels.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
