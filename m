Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:55877 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754493AbeFMRot (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 13:44:49 -0400
MIME-Version: 1.0
In-Reply-To: <20180612115050.185112-2-namit@vmware.com>
References: <20180612115050.185112-1-namit@vmware.com> <20180612115050.185112-2-namit@vmware.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 14 Jun 2018 02:43:56 +0900
Message-ID: <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.


2018-06-12 20:50 GMT+09:00 Nadav Amit <namit@vmware.com>:
> Using macros for inline assembly improves both readability and
> compilation decisions that are distorted by big assembly blocks that use
> alternative sections. Compile macros.S and use it to assemble all C
> files. Currently, only x86 will use it.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: x86@kernel.org
> Cc: linux-kbuild@vger.kernel.org
>
> Signed-off-by: Nadav Amit <namit@vmware.com>


I have not fully understood this series yet.

I do not have enough skill in x86 architecture,
but just some comments from the build system point of view.



I guess this will probably break the parallel building.

Kbuild can build 'prepare' and 'scripts' simultaneously.


I locally modified the following line:


diff --git a/Makefile b/Makefile
index 2dea909440..6ad484a 100644
--- a/Makefile
+++ b/Makefile
@@ -1030,7 +1030,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
 # Error messages still appears in the original language

 PHONY += $(vmlinux-dirs)
-$(vmlinux-dirs): prepare scripts
+$(vmlinux-dirs): scripts prepare
        $(Q)$(MAKE) $(build)=$@ need-builtin=1

 define filechk_kernel.release



masahiro@grover:~/workspace/linux-kbuild$ make  defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  YACC    scripts/kconfig/zconf.tab.c
  LEX     scripts/kconfig/zconf.lex.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'x86_64_defconfig'
#
# configuration written to .config
#
masahiro@grover:~/workspace/linux-kbuild$ make all
scripts/kconfig/conf  --syncconfig Kconfig
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
  CC      scripts/mod/empty.o
Assembler messages:
Error: can't open arch/x86/kernel/macros.s for reading: No such file
or directory
make[2]: *** [scripts/Makefile.build:318: scripts/mod/empty.o] Error 1
make[1]: *** [scripts/Makefile.build:558: scripts/mod] Error 2
make: *** [Makefile:1050: scripts] Error 2







> ---
>  Makefile                 |  9 +++++++--
>  arch/x86/Makefile        | 11 +++++++++--
>  arch/x86/kernel/Makefile |  6 ++++++
>  arch/x86/kernel/macros.S |  7 +++++++
>  scripts/Kbuild.include   |  4 +++-
>  5 files changed, 32 insertions(+), 5 deletions(-)
>  create mode 100644 arch/x86/kernel/macros.S
>
> diff --git a/Makefile b/Makefile
> index 554dcaddbce4..026586db2f26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1085,7 +1085,7 @@ scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
>  # version.h and scripts_basic is processed / created.
>
>  # Listed in dependency order
> -PHONY += prepare archprepare prepare0 prepare1 prepare2 prepare3
> +PHONY += prepare archprepare macroprepare prepare0 prepare1 prepare2 prepare3
>
>  # prepare3 is used to check if we are building in a separate output directory,
>  # and if so do:
> @@ -1109,7 +1109,9 @@ prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
>                     include/config/auto.conf
>         $(cmd_crmodverdir)
>
> -archprepare: archheaders archscripts prepare1 scripts_basic
> +macroprepare: prepare1 archmacros
> +
> +archprepare: archheaders archscripts macroprepare scripts_basic


Are you planning to support for all architectures, or x86-specific?

Currently, there are some hooks to do arch-specific things such as
'archprepare', 'archscripts'.




>  prepare0: archprepare gcc-plugins
>         $(Q)$(MAKE) $(build)=.
> @@ -1214,6 +1216,9 @@ archheaders:
>  PHONY += archscripts
>  archscripts:
>
> +PHONY += archmacros
> +archmacros:
> +
>  PHONY += __headers
>  __headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
>         $(Q)$(MAKE) $(build)=scripts build_unifdef
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 60135cbd905c..6b82314776fd 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -235,8 +235,8 @@ ifdef CONFIG_X86_64
>  LDFLAGS += $(call ld-option, -z max-page-size=0x200000)
>  endif
>
> -# Speed up the build
> -KBUILD_CFLAGS += -pipe
> +# We cannot use -pipe flag since we give an additional .s file to the compiler
> +#KBUILD_CFLAGS += -pipe
>  # Workaround for a gcc prelease that unfortunately was shipped in a suse release
>  KBUILD_CFLAGS += -Wno-sign-compare
>  #
> @@ -258,11 +258,18 @@ archscripts: scripts_basic
>  archheaders:
>         $(Q)$(MAKE) $(build)=arch/x86/entry/syscalls all
>
> +archmacros:
> +       $(Q)$(MAKE) $(build)=arch/x86/kernel macros
> +
>  archprepare:
>  ifeq ($(CONFIG_KEXEC_FILE),y)
>         $(Q)$(MAKE) $(build)=arch/x86/purgatory arch/x86/purgatory/kexec-purgatory.c
>  endif
>
> +ASM_MACRO_FLAGS = -Wa,arch/x86/kernel/macros.s
> +export ASM_MACRO_FLAGS
> +KBUILD_CFLAGS += $(ASM_MACRO_FLAGS)
> +
>  ###
>  # Kernel objects
>
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index 02d6f5cf4e70..fdb6c5b2a922 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -9,6 +9,12 @@ extra-y        += ebda.o
>  extra-y        += platform-quirks.o
>  extra-y        += vmlinux.lds
>
> +$(obj)/macros.s: $(obj)/macros.S FORCE
> +       $(call if_changed_dep,cpp_s_S)

This is unnecessary.

Kbuild will find the correct pattern rule
in scripts/Makefile.build





> +macros: $(obj)/macros.s
> +       @:

If you add a phony target, it should be added to 'PHONY'.

Like this:


PHONY += macros
macros: $(obj)/macros.s
       @:



>  CPPFLAGS_vmlinux.lds += -U$(UTS_MACHINE)
>
>  ifdef CONFIG_FUNCTION_TRACER
> diff --git a/arch/x86/kernel/macros.S b/arch/x86/kernel/macros.S
> new file mode 100644
> index 000000000000..cfc1c7d1a6eb
> --- /dev/null
> +++ b/arch/x86/kernel/macros.S
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * This file includes headers whose assembly part includes macros which are
> + * commonly used. The macros are precompiled into assmebly file which is later
> + * assembled together with each compiled file.
> + */
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 50cee534fd64..ad2c02062aa4 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -189,7 +189,9 @@ __cc-option = $(call try-run-cached,\
>
>  # Do not attempt to build with gcc plugins during cc-option tests.
>  # (And this uses delayed resolution so the flags will be up to date.)
> -CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
> +# In addition, do not include the asm macros which are built later.
> +CC_OPTION_FILTERED = $(GCC_PLUGINS_CFLAGS) $(ASM_MACRO_FLAGS)
> +CC_OPTION_CFLAGS = $(filter-out $(CC_OPTION_FILTERED),$(KBUILD_CFLAGS))
>
>  # cc-option
>  # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> --
> 2.17.0
>



-- 
Best Regards
Masahiro Yamada
