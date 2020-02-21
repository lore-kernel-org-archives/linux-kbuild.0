Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43906 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388884AbgBUIun (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 03:50:43 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200221085040euoutp01998fa5e73432f32a5551293b00bfcc98~1XsQuwD8N2143021430euoutp01Q
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Feb 2020 08:50:40 +0000 (GMT)
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for
 DEFCONFIG_LIST
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e0212512-bc44-fc3a-a647-47eff86983b7@samsung.com>
Date: Fri, 21 Feb 2020 09:50:35 +0100
MIME-Version: 1.0
In-Reply-To: <20200216154502.26478-1-masahiroy@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
References: <20200216154502.26478-1-masahiroy@kernel.org>
        <CGME20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929@eucas1p2.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: x86@kernel.org, sparclinux@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>, Nick Hu <nickhu@andestech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>, Vincent Chen <deanbo422@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-riscv@lists.infradead.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>

Dear All,

On 16.02.2020 16:45, Masahiro Yamada wrote:
> Most of the Kconfig commands (except defconfig and all*config) read the
> .config file as a base set of CONFIG options.
>
> When it does not exist, the files in DEFCONFIG_LIST are searched in this
> order and loaded if found.
>
> I do not see much sense in the last two entries in DEFCONFIG_LIST.
>
> [1] ARCH_DEFCONFIG
>
> The entry for DEFCONFIG_LIST is guarded by 'depends on !UML'. So, the
> ARCH_DEFCONFIG definition in arch/x86/um/Kconfig is meaningless.
>
> arch/{sh,sparc,x86}/Kconfig define ARCH_DEFCONFIG depending on 32 or 64
> bit variant symbols. This is a little bit strange; ARCH_DEFCONFIG should
> be a fixed string because the base config file is loaded before the symbol
> evaluation stage.
>
> Using KBUILD_DEFCONFIG is saner because it is fixed before Kconfig is
> invoked. Fortunately, arch/{sh,sparc,x86}/Makefile define it in the
> same way, and it works as expected. Hence, replace ARCH_DEFCONFIG with
> "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)".
>
> [2] arch/$(ARCH)/defconfig
>
> This file path is no longer valid. The defconfig files are always located
> in the arch configs/ directories.
>
>    $ find arch -name defconfig | sort
>    arch/alpha/configs/defconfig
>    arch/arm64/configs/defconfig
>    arch/csky/configs/defconfig
>    arch/nds32/configs/defconfig
>    arch/riscv/configs/defconfig
>    arch/s390/configs/defconfig
>    arch/unicore32/configs/defconfig
>
> The path arch/*/configs/defconfig is already covered by
> "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)". So, this file path is
> not necessary.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This patch landed in today's linux-next (next-20200221) and broke arm64 
builds:

--->8---

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
...

(endless loop)

--->8---

Reverting it fixes the issue:

--->8---

$ git revert cdd5d1a207d6a3a06c9e627a0234d9a6af6ad347
[detached HEAD 1080d6a13b6d] Revert "kbuild: use KBUILD_DEFCONFIG as the 
fallback for DEFCONFIG_LIST"
  5 files changed, 22 insertions(+), 1 deletion(-)
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
*** Default configuration is based on 'defconfig'
#
# No change to .config
#
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
scripts/kconfig/conf  --syncconfig Kconfig
   UPD     include/config/kernel.release
   UPD     include/generated/utsrelease.h
   CC      scripts/mod/empty.o
...

$ aarch64-linux-gnu-gcc --version
aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1) 7.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--->8---

It looks that the issue is similar to the one described here:

https://patchwork.kernel.org/patch/10453685/

I hope this report helps fixing the issue.

> ---
>
>   arch/sh/Kconfig     | 5 -----
>   arch/sparc/Kconfig  | 5 -----
>   arch/x86/Kconfig    | 5 -----
>   arch/x86/um/Kconfig | 5 -----
>   init/Kconfig        | 3 +--
>   5 files changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9ece111b0254..b4f0e37b83eb 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -87,11 +87,6 @@ config SUPERH64
>   	select HAVE_EXIT_THREAD
>   	select KALLSYMS
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/sh/configs/shx3_defconfig" if SUPERH32
> -	default "arch/sh/configs/cayman_defconfig" if SUPERH64
> -
>   config GENERIC_BUG
>   	def_bool y
>   	depends on BUG && SUPERH32
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index c1dd6dd642f4..0de15380d1fc 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -95,11 +95,6 @@ config SPARC64
>   	select PCI_DOMAINS if PCI
>   	select ARCH_HAS_GIGANTIC_PAGE
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/sparc/configs/sparc32_defconfig" if SPARC32
> -	default "arch/sparc/configs/sparc64_defconfig" if SPARC64
> -
>   config ARCH_PROC_KCORE_TEXT
>   	def_bool y
>   
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..98935f4387f9 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -240,11 +240,6 @@ config OUTPUT_FORMAT
>   	default "elf32-i386" if X86_32
>   	default "elf64-x86-64" if X86_64
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/x86/configs/i386_defconfig" if X86_32
> -	default "arch/x86/configs/x86_64_defconfig" if X86_64
> -
>   config LOCKDEP_SUPPORT
>   	def_bool y
>   
> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index a8985e1f7432..95d26a69088b 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -27,11 +27,6 @@ config X86_64
>   	def_bool 64BIT
>   	select MODULES_USE_ELF_RELA
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/um/configs/i386_defconfig" if X86_32
> -	default "arch/um/configs/x86_64_defconfig" if X86_64
> -
>   config 3_LEVEL_PGTABLES
>   	bool "Three-level pagetables" if !64BIT
>   	default 64BIT
> diff --git a/init/Kconfig b/init/Kconfig
> index 452bc1835cd4..6ccdb168dee5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -6,8 +6,7 @@ config DEFCONFIG_LIST
>   	default "/lib/modules/$(shell,uname -r)/.config"
>   	default "/etc/kernel-config"
>   	default "/boot/config-$(shell,uname -r)"
> -	default ARCH_DEFCONFIG
> -	default "arch/$(ARCH)/defconfig"
> +	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
>   
>   config CC_IS_GCC
>   	def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
