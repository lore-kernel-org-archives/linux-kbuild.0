Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0058.hostedemail.com ([216.40.44.58]:59816 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751458AbbDIOKT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 10:10:19 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 8C8AFB1A76
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2015 14:05:04 +0000 (UTC)
Date: Thu, 9 Apr 2015 10:04:59 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 3/3] powerpc: Include linux/jump_label.h to get
 HAVE_JUMP_LABEL define
Message-ID: <20150409100459.552e54d9@gandalf.local.home>
In-Reply-To: <1428551492-21977-3-git-send-email-anton@samba.org>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
	<1428551492-21977-3-git-send-email-anton@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, peterz@infradead.org, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu,  9 Apr 2015 13:51:32 +1000
Anton Blanchard <anton@samba.org> wrote:

> Commit 1bc9e47aa8e4 ("powerpc/jump_label: Use HAVE_JUMP_LABEL")
> converted uses of CONFIG_JUMP_LABEL to HAVE_JUMP_LABEL in
> some assembly files.
> 
> HAVE_JUMP_LABEL is defined in linux/jump_label.h, so we need to
> include this or we always get the non jump label fallback code.
> 
> Fixes: 1bc9e47aa8e4 ("powerpc/jump_label: Use HAVE_JUMP_LABEL")
> Signed-off-by: Anton Blanchard <anton@samba.org>

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve
