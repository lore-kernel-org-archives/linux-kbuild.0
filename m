Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0237.hostedemail.com ([216.40.44.237]:59823 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751805AbbDIOKT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 10:10:19 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 826BDB1745
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2015 14:00:59 +0000 (UTC)
Date: Thu, 9 Apr 2015 10:00:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/3] jump_label: Allow asm/jump_label.h to be included
 in assembly
Message-ID: <20150409100055.00c3834e@gandalf.local.home>
In-Reply-To: <1428551492-21977-1-git-send-email-anton@samba.org>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, peterz@infradead.org, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  9 Apr 2015 13:51:30 +1000
Anton Blanchard <anton@samba.org> wrote:

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
> ---
>  arch/arm/include/asm/jump_label.h   | 5 ++---
>  arch/arm64/include/asm/jump_label.h | 8 ++++----
>  arch/mips/include/asm/jump_label.h  | 7 +++----
>  arch/s390/include/asm/jump_label.h  | 3 +++
>  arch/sparc/include/asm/jump_label.h | 5 ++---
>  arch/x86/include/asm/jump_label.h   | 5 ++---
>  6 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/include/asm/jump_label.h b/arch/arm/include/asm/jump_label.h

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
