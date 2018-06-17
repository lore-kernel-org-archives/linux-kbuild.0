Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55506 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756930AbeFQAlx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jun 2018 20:41:53 -0400
MIME-Version: 1.0
In-Reply-To: <D9AF0864-EE2A-4C2E-A5A4-C002DEB95B2B@vmware.com>
References: <20180612115050.185112-1-namit@vmware.com> <20180612115050.185112-2-namit@vmware.com>
 <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com> <D9AF0864-EE2A-4C2E-A5A4-C002DEB95B2B@vmware.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 17 Jun 2018 09:40:56 +0900
Message-ID: <CAK7LNASdmie+Y4haU5bCMb8s4RztHzOcFXUxGxjcCqsbwPN7uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nadav Amit <namit@vmware.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi.

2018-06-14 7:19 GMT+09:00 Nadav Amit <namit@vmware.com>:
>>
>>
>> I have not fully understood this series yet.
>>
>> I do not have enough skill in x86 architecture,
>> but just some comments from the build system point of view.
>>
>>
>>
>> I guess this will probably break the parallel building.
>>
>> Kbuild can build 'prepare' and 'scripts' simultaneously.
>>
>>
>> I locally modified the following line:
>>
>>
>> diff --git a/Makefile b/Makefile
>> index 2dea909440..6ad484a 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1030,7 +1030,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
>> # Error messages still appears in the original language
>>
>> PHONY += $(vmlinux-dirs)
>> -$(vmlinux-dirs): prepare scripts
>> +$(vmlinux-dirs): scripts prepare
>>        $(Q)$(MAKE) $(build)=$@ need-builtin=1
>>
>> define filechk_kernel.release
>>
>>
>>
>> masahiro@grover:~/workspace/linux-kbuild$ make  defconfig
>>  HOSTCC  scripts/basic/fixdep
>>  HOSTCC  scripts/kconfig/conf.o
>>  YACC    scripts/kconfig/zconf.tab.c
>>  LEX     scripts/kconfig/zconf.lex.c
>>  HOSTCC  scripts/kconfig/zconf.tab.o
>>  HOSTLD  scripts/kconfig/conf
>> *** Default configuration is based on 'x86_64_defconfig'
>> #
>> # configuration written to .config
>> #
>> masahiro@grover:~/workspace/linux-kbuild$ make all
>> scripts/kconfig/conf  --syncconfig Kconfig
>>  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
>>  WRAP    arch/x86/include/generated/uapi/asm/poll.h
>>  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
>>  WRAP    arch/x86/include/generated/asm/early_ioremap.h
>>  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
>>  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
>>  CC      scripts/mod/empty.o
>> Assembler messages:
>> Error: can't open arch/x86/kernel/macros.s for reading: No such file
>> or directory
>> make[2]: *** [scripts/Makefile.build:318: scripts/mod/empty.o] Error 1
>> make[1]: *** [scripts/Makefile.build:558: scripts/mod] Error 2
>> make: *** [Makefile:1050: scripts] Error 2
>
> You are right. I tried to filter out the use of the switch (exported as
> ASM_MACRO_FLAGS) for empty.o. Any suggestions on how to do it properly?


You can do like this:


diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 42c5d50..a5b4af4 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -4,6 +4,8 @@ OBJECT_FILES_NON_STANDARD := y
 hostprogs-y    := modpost mk_elfconfig
 always         := $(hostprogs-y) empty.o

+CFLAGS_REMOVE_empty.o := $(ASM_MACRO_FLAGS)
+
 modpost-objs   := modpost.o file2alias.o sumversion.o

 devicetable-offsets-file := devicetable-offsets.h





modpost is an exceptional hostprogam - it depends on
target compiler, which makes the build order complicated.

I want to compile under scripts/ only with $(HOSTCC).

I am planning to change modpost
target-independent by detecting
32/64 bit, little/big-endianness run-time.
Then, empty.c will go away.


In the meanwhile, CFLAGS_REMOVE_ will do
as a workaround.


-- 
Best Regards
Masahiro Yamada
