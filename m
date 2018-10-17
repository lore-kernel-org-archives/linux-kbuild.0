Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37239 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbeJQM0C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 08:26:02 -0400
Subject: Re: [Lkcamp] [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
References: <20181017000809.GA21292@WindFlash>
From: Helen Koike <helen@koikeco.de>
Message-ID: <716d591a-a0da-e048-a00d-0fe7dabdc4f1@koikeco.de>
Date: Wed, 17 Oct 2018 01:32:12 -0300
MIME-Version: 1.0
In-Reply-To: <20181017000809.GA21292@WindFlash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hi Leonardo,

Thanks for the patch.

On 10/16/18 9:08 PM, Leonardo Brás wrote:
> Adds -Wshadow=local on KBUILD_HOSTCFLAGS to show shadow warnings
> on tools built for HOST.
> 
> Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index e8b599b4dcde..fb0a9ac195e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -360,7 +360,7 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>  
>  HOSTCC       = gcc
>  HOSTCXX      = g++
> -KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
> +KBUILD_HOSTCFLAGS   := -Wall -Wshadow=local -Wmissing-prototypes -Wstrict-prototypes -O2 \
>  		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
>  		$(HOSTCFLAGS)
>  KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
> 

I believe this should be the last patch on this series and not the first
one to avoid commits in between where we have those warnings.

Regards
Helen
