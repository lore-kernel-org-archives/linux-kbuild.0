Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34167 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751960AbbDIHdU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 03:33:20 -0400
Message-ID: <1428564799.26637.4.camel@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc: Include linux/jump_label.h to get
 HAVE_JUMP_LABEL define
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 09 Apr 2015 17:33:19 +1000
In-Reply-To: <1428551492-21977-3-git-send-email-anton@samba.org>
References: <1428551492-21977-1-git-send-email-anton@samba.org>
	 <1428551492-21977-3-git-send-email-anton@samba.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Blanchard <anton@samba.org>
Cc: benh@kernel.crashing.org, paulus@samba.org, mmarek@suse.cz, akpm@linux-foundation.org, jbaron@akamai.com, peterz@infradead.org, liuj97@gmail.com, mingo@kernel.org, mgorman@suse.de, linux@arm.linux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, ralf@linux-mips.org, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2015-04-09 at 13:51 +1000, Anton Blanchard wrote:
> Commit 1bc9e47aa8e4 ("powerpc/jump_label: Use HAVE_JUMP_LABEL")
> converted uses of CONFIG_JUMP_LABEL to HAVE_JUMP_LABEL in
> some assembly files.
> 
> HAVE_JUMP_LABEL is defined in linux/jump_label.h, so we need to
> include this or we always get the non jump label fallback code.
> 
> Fixes: 1bc9e47aa8e4 ("powerpc/jump_label: Use HAVE_JUMP_LABEL")
> Signed-off-by: Anton Blanchard <anton@samba.org>
> ---
>  arch/powerpc/platforms/powernv/opal-wrappers.S | 2 +-
>  arch/powerpc/platforms/pseries/hvCall.S        | 2 +-
>  arch/powerpc/platforms/pseries/lpar.c          | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>


I assume it's best for Andrew to take this series with all the cross-archness?

cheers


