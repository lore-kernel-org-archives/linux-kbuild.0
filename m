Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:60847 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728350AbeKLVG7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 16:06:59 -0500
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] powerpc/boot: Set target when cross-compiling for clang
In-Reply-To: <20181112042116.5271-3-joel@jms.id.au>
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-3-joel@jms.id.au>
Date: Mon, 12 Nov 2018 22:14:07 +1100
Message-ID: <87muqea6ps.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Daniel Axtens <dja@axtens.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Joel Stanley <joel@jms.id.au> writes:

> Clang needs to be told which target it is building for when cross
> compiling.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/259
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/boot/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 39354365f54a..111f97b1ccec 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -55,6 +55,11 @@ BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
>  
>  BOOTARFLAGS	:= -cr$(KBUILD_ARFLAGS)
>  
> +ifdef CONFIG_CC_IS_CLANG
> +BOOTCFLAGS += $(CLANG_FLAGS)
> +BOOTAFLAGS += $(CLANG_FLAGS)
> +endif
> +
>  ifdef CONFIG_DEBUG_INFO
>  BOOTCFLAGS	+= -g
>  endif
> -- 
> 2.19.1
