Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:33804 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbfKGPXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:23:09 -0500
Date: Thu, 7 Nov 2019 16:22:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH 0/4] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191107152244.GD4114@hirez.programming.kicks-ass.net>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: shile.zhang@linux.alibaba.com
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, Nov 07, 2019 at 10:32:01PM +0800, shile.zhang@linux.alibaba.com wrote:
> From: Shile Zhang <shile.zhang@linux.alibaba.com>
> 
> Hi,
> 
> I found the unwind_init taken long time (more than 90ms) in kernel
> booting, mainly spent on sorting the two ORC unwind tables, orc_unwind
> and orc_unwind_ip.
> 
> I also noticed that this issued has reported and discussed last year:
> https://lkml.org/lkml/2018/10/8/342
> But seems no final solution until now, I tried to sort the ORC tables at
> build time, followed the helpful hints from Josh and Ingo in that thread.
> And mainly referred the implementation of 'sortextable' tool:
> https://lore.kernel.org/linux-mips/1334872799-14589-1-git-send-email-ddaney.cavm@gmail.com/
> 
> What I did:
> 
> - Add a Kconfig to control build-time sorting or runtime sorting;
> - Referred 'sortextable', create a similar helper tool 'sortorctable',
>   help to sort the ORC unwind tables at vmlinux link process.

What is the build-time cost for doing this? The link phase is already a
fairly big bottleneck for building a kernel.

Can sort{ex,orc}table() be ran concurrently? Do they want to be the same
(threaded) tool?
