Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:52435 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751480AbbDIHI2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 03:08:28 -0400
Date: Thu, 9 Apr 2015 09:08:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] jump_label: Allow asm/jump_label.h to be included in
 assembly
Message-ID: <20150409070813.GM27490@worktop.programming.kicks-ass.net>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428551492-21977-1-git-send-email-anton@samba.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 09, 2015 at 01:51:30PM +1000, Anton Blanchard wrote:
> Wrap asm/jump_label.h for all archs with #ifndef __ASSEMBLY__.
> Since these are kernel only headers, we don't need #ifdef __KERNEL__
> so can simplify things a bit.
> 
> If an architecture wants to use jump labels in assembly, it
> will still need to define a macro to create the __jump_table
> entries (see ARCH_STATIC_BRANCH in the powerpc asm/jump_label.h
> for an example).
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
