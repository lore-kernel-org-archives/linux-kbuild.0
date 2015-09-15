Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33424 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766AbbIODkT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 23:40:19 -0400
Received: by pacex6 with SMTP id ex6so163059190pac.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2015 20:40:19 -0700 (PDT)
Subject: Re: [PATCH] kbuild: llvmlinux: Set appropriate compiler-flag for
 CONFIG_CC_OPTIMIZE_FOR_SIZE
References: <1442287188-11326-1-git-send-email-sedat.dilek@gmail.com>
From: Behan Webster <behanw@converseincode.com>
Message-ID: <55F7931F.2020100@converseincode.com>
Date: Mon, 14 Sep 2015 21:40:15 -0600
MIME-Version: 1.0
In-Reply-To: <1442287188-11326-1-git-send-email-sedat.dilek@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Other than you changing the commit comment, this *is* my patch.

I haven't upstreamed this patch yet because we are still characterizing 
its effects on other architectures.

Clang certainly doesn't require -Oz to be used to be able to boot for 
arm nor arm64. So the commit message isn't correct either.

NAK

Behan

On 09/14/15 21:19, Sedat Dilek wrote:
> Based on a patch of Behan Webster (see [1]).
>
> CLANG (here: v3.7) requires '-Oz' as OptLevel to be set.
>
> A Linux v4.3-rc1 kernel built fine with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> and boots on bare metal.
> This is a Ubuntu/precise AMD64 system.
>
> Tested against Linux v4.3-rc1 and a refreshed llvmlinux patchset.
>
> [1] http://git.linuxfoundation.org/?p=llvmlinux.git;a=blob;f=arch/all/patches/smaller.patch
>
> CC: Behan Webster <behanw@converseincode.com>
> ---
>   Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 4249441e535d..a57fb6b39ed7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -622,7 +622,8 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
>   endif
>   
>   ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> -KBUILD_CFLAGS	+= -Os $(call cc-disable-warning,maybe-uninitialized,)
> +KBUILD_CFLAGS 	+= $(call cc-option,-Oz,-Os)
> +KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
>   else
>   KBUILD_CFLAGS	+= -O2
>   endif


-- 
Behan Webster
behanw@converseincode.com

