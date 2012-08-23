Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:40396 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754380Ab2HWC3M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Aug 2012 22:29:12 -0400
Date: Wed, 22 Aug 2012 19:29:12 -0700
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 74/74] lto, workaround: Mark do_futex noinline to prevent
 clobbering ebp
Message-ID: <20120823022912.GC12707@tassilo.jf.intel.com>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
 <1345345030-22211-75-git-send-email-andi@firstfloor.org>
 <503576AB.5030208@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <503576AB.5030208@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org

> The right thing to do is to change head_32.S to not violate the i386
> ABI.  Arguments pushed (by value) on the stack are property of the
> callee, that is, they are volatile, so the hack of making them do double
> duty as both being saved and passed as arguments is just plain bogus.
> The problem is that it works "just well enough" that people (including
> myself) keep hacking around it with hacks like this, with assembly
> macros, and whatnot instead of fixing the root cause.

How about just use register arguments for the first three arguments.
This should work for the syscalls at least (may be too risky for all
other asm entry points)

And for syscalls with more than three generate a stub that saves on the stack
explicitely.  This could be done using the new fancy SYSCALL definition macros 
(except that arch/x86 would need to start using them too in its own code)

Or is there some subtle reason with syscall restart and updated args 
that prevents it? 

Perhaps newer gcc can do regparm(X), X > 3 too, may be worth trying.

Don't have time to look into this currently though.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
