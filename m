Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36492 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgBVCIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 21:08:07 -0500
MIME-Version: 1.0
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca> <20200222003820.220854-1-alex_y_xu@yahoo.ca>
In-Reply-To: <20200222003820.220854-1-alex_y_xu@yahoo.ca>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 22 Feb 2020 11:07:14 +0900
Message-ID: <CAK7LNARNEu2gVBVDpRtbha_n=RWWfcQu57LtO=CbLBXLU9Ds-g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>

On Sat, Feb 22, 2020 at 9:40 AM Alex Xu (Hello71) <alex_y_xu@yahoo.ca> wrote:
>
> -pipe reduces unnecessary disk wear for systems where /tmp is not a
> tmpfs, slightly increases compilation speed, and avoids leaving behind
> files when gcc crashes.
>
> According to the gcc manual, "this fails to work on some systems where
> the assembler is unable to read from a pipe; but the GNU assembler has
> no trouble". We already require GNU ld on all platforms, so this is not
> an additional dependency. LLVM as also supports pipes.
>
> -pipe has always been used for most architectures, this change
> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> affected.
>
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

<snip>

> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 20e9ab6cc521..b6a2f553771c 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
>  CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
>  endif
>
> -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
> +cflags-y       += -fno-common -fno-builtin -mmedium-calls -D__linux__
>  cflags-$(CONFIG_ISA_ARCOMPACT) += -mA7
>  cflags-$(CONFIG_ISA_ARCV2)     += -mcpu=hs38
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db857d07114f..7711467e0797 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -21,7 +21,6 @@ KBUILD_LDS_MODULE     += $(srctree)/arch/arm/kernel/module.lds
>  endif
>
>  GZFLAGS                :=-9
> -#KBUILD_CFLAGS +=-pipe


This was commented out by a very old commit,
which is available in the historical git tree.

https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ce20ed858a20f6f04de475cae79e40d3697f4776

But, I could not parse the reason from the commit message.
Russell, do you remember why?


If arch maintainers are fine with this change,
I can pick up it.

Thanks.



--
Best Regards

Masahiro Yamada
