Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38469 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932297AbcKNUpp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Nov 2016 15:45:45 -0500
Subject: Re: [PATCH] kbuild: Steal gcc's pie from the very beginning
References: <20161114185130.30641-1-bp@alien8.de>
From: Michal Marek <mmarek@suse.com>
Message-ID: <40122b67-52d7-e133-c119-172c2e1f43b0@suse.com>
Date: Mon, 14 Nov 2016 21:45:42 +0100
MIME-Version: 1.0
In-Reply-To: <20161114185130.30641-1-bp@alien8.de>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>, linux-kbuild@vger.kernel.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Dne 14.11.2016 v 19:51 Borislav Petkov napsal(a):
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
> 
> So let's turn off PIE/PIC at the earliest possible moment, when we
> declare KBUILD_CFLAGS so that cc-disable-warning picks it up too.
> 
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Ben Hutchings <ben@decadent.org.uk>
> Cc: Michal Marek <mmarek@suse.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Makefile | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3ff1fb26d8b2..5558cc5b1505 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -399,11 +399,12 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>  		   -fno-strict-aliasing -fno-common \
>  		   -Werror-implicit-function-declaration \
>  		   -Wno-format-security \
> -		   -std=gnu89
> +		   -std=gnu89 -fno-PIE

Please use the cc-option variant, otherwise good catch.

Michal
