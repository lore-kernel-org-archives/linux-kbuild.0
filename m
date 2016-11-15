Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34497 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750776AbcKOQIN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Nov 2016 11:08:13 -0500
Date: Tue, 15 Nov 2016 17:08:09 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH -v1.1] kbuild: Steal gcc's pie from the very beginning
Message-ID: <20161115160809.GA18830@sepie.suse.cz>
References: <20161114185130.30641-1-bp@alien8.de>
 <20161114201457.qsevfvn465otwfvz@linutronix.de>
 <20161114204529.sqn6z2bockmhxpfz@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161114204529.sqn6z2bockmhxpfz@pd.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>, +@pd.tnic

On Mon, Nov 14, 2016 at 09:45:29PM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> Date: Mon, 14 Nov 2016 19:41:31 +0100
> Subject: [PATCH] kbuild: Steal gcc's pie from the very beginning
> 
> So Sebastian turned off the PIE for kernel builds but that was too late
> - Kbuild.include already uses KBUILD_CFLAGS and trying to disable gcc
> options with, say cc-disable-warning, fails:
> 
>   gcc -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
>   ...
>   -Wno-sign-compare -fno-asynchronous-unwind-tables -Wframe-address -c -x c /dev/null -o .31392.tmp
>   /dev/null:1:0: error: code model kernel does not support PIC mode
> 
> because that returns an error and we can't disable the warning. For
> example in this case:
> 
> KBUILD_CFLAGS   += $(call cc-disable-warning,frame-address,)
> 
> which leads to gcc issuing all those warnings again.
> 
> So let's turn off PIE/PIC at the earliest possible moment, when we
> declare KBUILD_CFLAGS so that cc-disable-warning picks it up too.
> 
> Also, we need the $(call cc-option ...) because -fno-PIE is supported
> since gcc v3.4 and our lowest supported gcc version is 3.2 right now.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: stable@vger.kernel.org
> Cc: Ben Hutchings <ben@decadent.org.uk>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks, applied to kbuild.git#rc-fixes.

Michal
