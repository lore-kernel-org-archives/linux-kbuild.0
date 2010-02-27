Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s15228384.onlinehome-server.info ([87.106.30.177]:56946 "EHLO
	mail.x86-64.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S967967Ab0B0I2F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Feb 2010 03:28:05 -0500
Date: Sat, 27 Feb 2010 09:28:07 +0100
From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH] x86: Add optimized popcnt variants
Message-ID: <20100227082807.GA21706@aftab>
References: <20100222184945.GD21233@aftab>
 <4B82E144.1050007@zytor.com>
 <20100223155852.GF30382@aftab>
 <4B84118C.90203@zytor.com>
 <20100223175457.GA2401@aftab>
 <4B841BC3.1000908@zytor.com>
 <20100223190614.GB2401@aftab>
 <4B875BBD.4060104@zytor.com>
 <20100226074714.GA15310@aftab>
 <4B88097E.7010608@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B88097E.7010608@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@amd64.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

From: "H. Peter Anvin" <hpa@zytor.com>
Date: Fri, Feb 26, 2010 at 09:48:46AM -0800

> Looks like -mm, which really means that either Andrew has to take your
> patch, too, or we have to wait until that is upstream until we can merge
> your patch.
> 
> I'm a little nervous about just acking the patch and telling Andrew to
> test it, because I don't know what the fallout would look like.  I'm
> particularly concerned about gcc version dependencies.

I have the same concern. Actually, I'll be much more at ease if it saw a
bit of wider testing without hitting mainline just yet. I'll try to give
it some more testing with the machines and toolchains I can get my hands
on next week.

> I guess, on the other hand, if it ends up not getting merged until .35
> it's not a huge deal either.

Yeah, let's give it another round of testing and queue it for .35 -
AFAIR Ingo runs also a wide testing effort so it spending another cycle
in -tip and being hammered on by us could give us a bit more certainty.

Thanks.

-- 
Regards/Gruss,
Boris.

-
Advanced Micro Devices, Inc.
Operating Systems Research Center
