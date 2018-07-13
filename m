Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:43715 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731501AbeGMThi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 15:37:38 -0400
Received: by mail-qt0-f196.google.com with SMTP id f18-v6so28059136qtp.10
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jul 2018 12:21:41 -0700 (PDT)
Subject: Re: [PATCH] arm64: build with baremetal linker target instead of
 Linux when available
References: <20180713150701.GA3049@arm.com>
 <20180713153033.20540-1-olof@lixom.net>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <33f65453-5b6d-0684-8a91-7e9940846143@redhat.com>
Date: Fri, 13 Jul 2018 12:21:37 -0700
MIME-Version: 1.0
In-Reply-To: <20180713153033.20540-1-olof@lixom.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <contact@paulk.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org

On 07/13/2018 08:30 AM, Olof Johansson wrote:
> Not all toolchains have the baremetal elf targets, RedHat/Fedora ones
> in particular. So, probe for whether it's available and use the previous
> (linux) targets if it isn't.
> 


For the Fedora toolchains:

Tested-by: Laura Abbott <labbott@redhat.com>

> Reported-by: Laura Abbott <labbott@redhat.com>
> Cc: Paul Kocialkowski <contact@paulk.fr>
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>   arch/arm64/Makefile    | 9 +++++----
>   scripts/Kbuild.include | 4 ++--
>   2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index e7101b19d590..efe61a2e4b5e 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -60,15 +60,16 @@ ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
>   KBUILD_CPPFLAGS	+= -mbig-endian
>   CHECKFLAGS	+= -D__AARCH64EB__
>   AS		+= -EB
> -# We must use the linux target here, since distributions don't tend to package
> -# the ELF linker scripts with binutils, and this results in a build failure.
> -LDFLAGS		+= -EB -maarch64linuxb
> +# Prefer the baremetal ELF build target, but not all toolchains include
> +# it so fall back to the standard linux version if needed.
> +LDFLAGS		+= -EB $(call ld-option, -maarch64elfb, -maarch64linuxb)
>   UTS_MACHINE	:= aarch64_be
>   else
>   KBUILD_CPPFLAGS	+= -mlittle-endian
>   CHECKFLAGS	+= -D__AARCH64EL__
>   AS		+= -EL
> -LDFLAGS		+= -EL -maarch64linux # See comment above
> +# Same as above, prefer ELF but fall back to linux target if needed.
> +LDFLAGS		+= -EL $(call ld-option, -maarch64elf, -maarch64linux)
>   UTS_MACHINE	:= aarch64
>   endif
>   
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index c8156d61678c..1e13f502b42f 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -163,8 +163,8 @@ cc-ldoption = $(call try-run,\
>   	$(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
>   
>   # ld-option
> -# Usage: LDFLAGS += $(call ld-option, -X)
> -ld-option = $(call try-run, $(LD) $(LDFLAGS) $(1) -v,$(1),$(2))
> +# Usage: LDFLAGS += $(call ld-option, -X, -Y)
> +ld-option = $(call try-run, $(LD) $(LDFLAGS) $(1) -v,$(1),$(2),$(3))
>   
>   # ar-option
>   # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
> 

