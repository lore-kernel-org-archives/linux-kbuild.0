Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35981 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbbDIHJR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 03:09:17 -0400
Date: Thu, 9 Apr 2015 09:08:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 2/3] jump_label: Allow jump labels to be used in assembly
Message-ID: <20150409070838.GN27490@worktop.programming.kicks-ass.net>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
 <1428551492-21977-2-git-send-email-anton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428551492-21977-2-git-send-email-anton@samba.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 09, 2015 at 01:51:31PM +1000, Anton Blanchard wrote:
> To use jump labels in assembly we need the HAVE_JUMP_LABEL define,
> so we select a fallback version if the toolchain does not support
> them.
> 
> Modify linux/jump_label.h so it can be included by assembly files.
> We also need to add -DCC_HAVE_ASM_GOTO to KBUILD_AFLAGS.
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
