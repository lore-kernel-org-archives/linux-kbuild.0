Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:39406 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbeJQQGN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 12:06:13 -0400
Date: Wed, 17 Oct 2018 10:11:15 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
Message-ID: <20181017081115.GA22535@zn.tnic>
References: <20181017000809.GA21292@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181017000809.GA21292@WindFlash>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Cc: lkcamp@lists.libreplanetbr.org, Matthew Wilcox <willy6545@gmail.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Tue, Oct 16, 2018 at 09:08:09PM -0300, Leonardo Brás wrote:
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
> -- 

You might wanna take a look at scripts/Makefile.extrawarn which already
has -Wshadow.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
