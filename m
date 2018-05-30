Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:47511 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753562AbeE3ObG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 May 2018 10:31:06 -0400
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com [209.85.213.46]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w4UEUjV7020000
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 23:30:46 +0900
Received: by mail-vk0-f46.google.com with SMTP id g72-v6so11209289vke.2
        for <linux-kbuild@vger.kernel.org>; Wed, 30 May 2018 07:30:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180530121922.22122-2-npiggin@gmail.com>
References: <20180530121922.22122-1-npiggin@gmail.com> <20180530121922.22122-2-npiggin@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 30 May 2018 23:30:04 +0900
Message-ID: <CAK7LNAQCzWQ78aFF=1HPvE=6eWCCGvccjaz4UmR01jcfUu+-jQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] powerpc/kbuild: set default generic machine type
 for 32-bit compile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Segher Boessenkool <segher@kernel.crashing.org>

2018-05-30 21:19 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> Some 64-bit toolchains uses the wrong ISA variant for compiling 32-bit
> kernels, even with -m32. Debian's powerpc64le is one such case, and
> that is because it is built with --with-cpu=power8.
>
> So when cross compiling a 32-bit kernel with a 64-bit toolchain, set
> -mcpu=powerpc initially, which is the generic 32-bit powerpc machine
> type and scheduling model. CPU and platform code can override this
> with subsequent -mcpu flags if necessary.
>
> This is not done for 32-bit toolchains otherwise it would override
> their defaults, which are presumably set appropriately for the
> environment (moreso than a 64-bit cross compiler).
>
> This fixes a lot of build failures due to incompatible assembly when
> compiling 32-bit kernel with th Debian powerpc64le 64-bit toolchain.
>
> Cc: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> Since v1: reworded changelog to explain the cause of the problem (thanks
> Segher) and moved the flags into the 64-32 cross compile case.
> ---
>  arch/powerpc/Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 95813df90801..d628724087c6 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -24,6 +24,14 @@ ifeq ($(HAS_BIARCH),y)
>  ifeq ($(CROSS32_COMPILE),)
>  CROSS32CC      := $(CC) -m32
>  KBUILD_ARFLAGS += --target=elf32-powerpc
> +ifdef CONFIG_PPC32
> +# These options will be overridden by any -mcpu option that the CPU
> +# or platform code sets later on the command line, but they are needed
> +# to set a sane 32-bit cpu target for the 64-bit cross compiler which
> +# may default to the wrong ISA.
> +KBUILD_CFLAGS          += -mcpu=powerpc
> +KBUILD_AFLAGS          += -mcpu=powerpc
> +endif
>  endif
>  endif
>
> --
> 2.17.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


All applied to linux-kbuild/kconfig.
Thanks!




-- 
Best Regards
Masahiro Yamada
