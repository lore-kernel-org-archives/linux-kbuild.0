Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-by2nam03on0076.outbound.protection.outlook.com ([104.47.42.76]:16460
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935384AbeFMWT1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 18:19:27 -0400
From: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v4 1/9] Makefile: Prepare for using macros for inline asm
Date: Wed, 13 Jun 2018 22:19:24 +0000
Message-ID: <D9AF0864-EE2A-4C2E-A5A4-C002DEB95B2B@vmware.com>
References: <20180612115050.185112-1-namit@vmware.com>
 <20180612115050.185112-2-namit@vmware.com>
 <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
In-Reply-To: <CAK7LNATmjTi4Odp5AfbVHCemn7S_tB9nKvgNOf5sp8BiVJma7Q@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E2A08E6687B074F87E68E9627067233@namprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Thanks for your comment! I am certainly Makefile-challenged, so your help i=
s
highly appreciated.

Please see my responses/questions inline.

at 10:43 AM, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-06-12 20:50 GMT+09:00 Nadav Amit <namit@vmware.com>:
>> Using macros for inline assembly improves both readability and
>> compilation decisions that are distorted by big assembly blocks that use
>> alternative sections. Compile macros.S and use it to assemble all C
>> files. Currently, only x86 will use it.
>>=20
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: Michal Marek <michal.lkml@markovi.net>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Ingo Molnar <mingo@redhat.com>
>> Cc: "H. Peter Anvin" <hpa@zytor.com>
>> Cc: x86@kernel.org
>> Cc: linux-kbuild@vger.kernel.org
>>=20
>> Signed-off-by: Nadav Amit <namit@vmware.com>
>=20
>=20
> I have not fully understood this series yet.
>=20
> I do not have enough skill in x86 architecture,
> but just some comments from the build system point of view.
>=20
>=20
>=20
> I guess this will probably break the parallel building.
>=20
> Kbuild can build 'prepare' and 'scripts' simultaneously.
>=20
>=20
> I locally modified the following line:
>=20
>=20
> diff --git a/Makefile b/Makefile
> index 2dea909440..6ad484a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1030,7 +1030,7 @@ $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
> # Error messages still appears in the original language
>=20
> PHONY +=3D $(vmlinux-dirs)
> -$(vmlinux-dirs): prepare scripts
> +$(vmlinux-dirs): scripts prepare
>        $(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1
>=20
> define filechk_kernel.release
>=20
>=20
>=20
> masahiro@grover:~/workspace/linux-kbuild$ make  defconfig
>  HOSTCC  scripts/basic/fixdep
>  HOSTCC  scripts/kconfig/conf.o
>  YACC    scripts/kconfig/zconf.tab.c
>  LEX     scripts/kconfig/zconf.lex.c
>  HOSTCC  scripts/kconfig/zconf.tab.o
>  HOSTLD  scripts/kconfig/conf
> *** Default configuration is based on 'x86_64_defconfig'
> #
> # configuration written to .config
> #
> masahiro@grover:~/workspace/linux-kbuild$ make all
> scripts/kconfig/conf  --syncconfig Kconfig
>  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
>  WRAP    arch/x86/include/generated/uapi/asm/poll.h
>  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
>  WRAP    arch/x86/include/generated/asm/early_ioremap.h
>  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
>  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
>  CC      scripts/mod/empty.o
> Assembler messages:
> Error: can't open arch/x86/kernel/macros.s for reading: No such file
> or directory
> make[2]: *** [scripts/Makefile.build:318: scripts/mod/empty.o] Error 1
> make[1]: *** [scripts/Makefile.build:558: scripts/mod] Error 2
> make: *** [Makefile:1050: scripts] Error 2

You are right. I tried to filter out the use of the switch (exported as
ASM_MACRO_FLAGS) for empty.o. Any suggestions on how to do it properly?

> Are you planning to support for all architectures, or x86-specific?

Not right now. But I think that other architectures will also prefer to
separate the inline assembly chunks in a similar manner, for better
compilation, easier readability, and better code maintainability.

Thanks again,
Nadav

