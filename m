Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37472 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfHGCdH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 22:33:07 -0400
MIME-Version: 1.0
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
In-Reply-To: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Aug 2019 11:32:04 +0900
Message-ID: <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: add OBJSIZE variable for the size tool
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Define and export OBJSIZE variable for "size" tool from binutils to be
> used in architecture specific Makefiles (naming the variable just "SIZE"
> would be too risky). In particular this tool is useful to perform checks
> that early boot code is not using bss section (which might have not been
> zeroed yet or intersects with initrd or other files boot loader might
> have put right after the linux kernel).
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>

I think you want to apply both to the s390 tree. If so,

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks.

> ---
>  Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index fa0fbe7851ea..ff4cff29fe46 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -419,6 +419,7 @@ NM          = $(CROSS_COMPILE)nm
>  STRIP          = $(CROSS_COMPILE)strip
>  OBJCOPY                = $(CROSS_COMPILE)objcopy
>  OBJDUMP                = $(CROSS_COMPILE)objdump
> +OBJSIZE                = $(CROSS_COMPILE)size
>  PAHOLE         = pahole
>  LEX            = flex
>  YACC           = bison
> @@ -474,9 +475,9 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> -export CPP AR NM STRIP OBJCOPY OBJDUMP PAHOLE KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
> -export MAKE LEX YACC AWK INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
> -export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> +export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
> +export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
