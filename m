Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0018.hostedemail.com ([216.40.44.18]:51193 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932614AbbDIOLY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 10:11:24 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave05.hostedemail.com (Postfix) with ESMTP id DFE4318454E
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2015 14:03:59 +0000 (UTC)
Date: Thu, 9 Apr 2015 10:03:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/3] jump_label: Allow jump labels to be used in
 assembly
Message-ID: <20150409100355.16d5e32a@gandalf.local.home>
In-Reply-To: <1428551492-21977-2-git-send-email-anton@samba.org>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
	<1428551492-21977-2-git-send-email-anton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, peterz@infradead.org, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  9 Apr 2015 13:51:31 +1000
Anton Blanchard <anton@samba.org> wrote:

> To use jump labels in assembly we need the HAVE_JUMP_LABEL define,
> so we select a fallback version if the toolchain does not support
> them.
> 
> Modify linux/jump_label.h so it can be included by assembly files.
> We also need to add -DCC_HAVE_ASM_GOTO to KBUILD_AFLAGS.
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
