Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41625 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750859AbbJZUBs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 16:01:48 -0400
Subject: Re: [PATCH] kbuild: llvmlinux: Fix -fno-delete-null-pointer-checks
 compiler-flag
References: <1442286180-11050-1-git-send-email-sedat.dilek@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <562E86AA.6080405@suse.com>
Date: Mon, 26 Oct 2015 21:01:46 +0100
MIME-Version: 1.0
In-Reply-To: <1442286180-11050-1-git-send-email-sedat.dilek@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Dne 15.9.2015 v 05:03 Sedat Dilek napsal(a):
> CLANG (here: v3.7) does not support '-fno-delete-null-pointer-checks'
> as a compiler-flag.
> 
> Fix the HOSTCFLAGS and KBUILD_CFLAGS settings accordingly.
> Furthermore, move and correct the $HOSTCC check.
> 
> Tested against Linux v4.3-rc1 and a refreshed llvmlinux patchset.
> ---
>  Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index aaf1d52bc646..4249441e535d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -300,9 +300,9 @@ HOSTCXX      = g++
>  HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
>  HOSTCXXFLAGS = -O2
>  
> -ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> -HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
> -		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
> +HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers

You are enabling the -Wno-* options for gcc with this.

Michal
