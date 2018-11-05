Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36553 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbeKEJ2p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 04:28:45 -0500
Received: by mail-qk1-f195.google.com with SMTP id o125so12004070qkf.3
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Nov 2018 16:11:55 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH 2/2] powerpc/boot: Set target when cross-compiling for clang
In-Reply-To: <20181104231133.30848-3-joel@jms.id.au>
References: <20181104231133.30848-1-joel@jms.id.au> <20181104231133.30848-3-joel@jms.id.au>
Date: Mon, 05 Nov 2018 11:11:49 +1100
Message-ID: <87d0rk4c3e.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

Joel Stanley <joel@jms.id.au> writes:

Hi Joel,

Thanks!

Tested-by: Daniel Axtens <dja@axtens.net> # powerpc 64-bit BE

This solves one of the 2 issues I have in building for 64-bit BE with
clang. The other is the VDSO32 stuff, and I hope to send a patch for
that soon.

Regards,
Daniel

> Clang needs to be told which target it is building for when cross
> compiling.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/259
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/powerpc/boot/Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> index 39354365f54a..8fdb1890f09a 100644
> --- a/arch/powerpc/boot/Makefile
> +++ b/arch/powerpc/boot/Makefile
> @@ -55,6 +55,13 @@ BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
>  
>  BOOTARFLAGS	:= -cr$(KBUILD_ARFLAGS)
>  
> +ifdef CONFIG_CC_IS_CLANG
> +BOOTCFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> +BOOTAFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> +BOOTCFLAGS += $(call cc-option, -no-integrated-as)
> +BOOTAFLAGS += $(call cc-option, -no-integrated-as)
> +endif
> +
>  ifdef CONFIG_DEBUG_INFO
>  BOOTCFLAGS	+= -g
>  endif
> -- 
> 2.19.1
