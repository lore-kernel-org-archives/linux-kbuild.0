Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from s15228384.onlinehome-server.info ([87.106.30.177]:53050 "EHLO
	mail.x86-64.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757996Ab0BRLvz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2010 06:51:55 -0500
Date: Thu, 18 Feb 2010 12:51:55 +0100
From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 2/5] bitops: compile time optimization for
 hweight_long(CONSTANT)
Message-ID: <20100218115155.GA20473@aftab>
References: <4B6FDAED.9060204@zytor.com>
 <20100208095945.GA14740@a1.tnic>
 <20100211172424.GB19779@aftab>
 <4B743F7D.3090605@zytor.com>
 <20100212170649.GC3114@aftab>
 <4B758FC0.1020600@zytor.com>
 <20100212174751.GD3114@aftab>
 <4B75A66A.70005@zytor.com>
 <4B7BF5D6.3030701@suse.cz>
 <1266490310.26719.185.camel@laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1266490310.26719.185.camel@laptop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Borislav Petkov <petkovbb@googlemail.com>, Andrew Morton <akpm@linux-foundation.org>, Wu Fengguang <fengguang.wu@intel.com>, LKML <linux-kernel@vger.kernel.org>, Jamie Lokier <jamie@shareable.org>, Roland Dreier <rdreier@cisco.com>, Al Viro <viro@ZenIV.linux.org.uk>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Brian Gerst <brgerst@gmail.com>

On Thu, Feb 18, 2010 at 11:51:50AM +0100, Peter Zijlstra wrote:
> I guess one way to achieve that is to create a arch/x86/lib/hweight.c
> that includes lib/hweight.c and give the x86 one special compile flags
> and not build the lib on.

That's what I thought initially too but that won't fly because the
lib/hweight.c helpers have to be inlined into arch/x86/lib/hweight.c so
that gcc can take care of the clobbered registers. Otherwise, it just a
"call __sw_hweightXX" that gets issued into asm.


-- 
Regards/Gruss,
Boris.

-
Advanced Micro Devices, Inc.
Operating Systems Research Center
