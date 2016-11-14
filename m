Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:40821 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935180AbcKNUPB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Nov 2016 15:15:01 -0500
Date: Mon, 14 Nov 2016 21:14:57 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] kbuild: Steal gcc's pie from the very beginning
Message-ID: <20161114201457.qsevfvn465otwfvz@linutronix.de>
References: <20161114185130.30641-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20161114185130.30641-1-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.com>

On 2016-11-14 19:51:30 [+0100], Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
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

This also means that all feature tests fail unless the -fno-PIE is
there.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This thing gcc v3.4 only but I intend to update the min requirement to
alteast gcc v3.4 to cover this. As per hpa gcc v3.4 is the lowest
version should be used for x86…

Sebastian
