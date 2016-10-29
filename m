Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:53080 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752440AbcJ2VTP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Oct 2016 17:19:15 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
References: <20161021111600.9417-1-bigeasy@linutronix.de>
        <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
        <1477250598.3561.4.camel@perches.com> <8760oinqly.fsf@turtle.gmx.de>
        <20161024074332.uomcxyhqo6aq7vxk@linutronix.de>
        <874m41mz4h.fsf@turtle.gmx.de>
        <20161029101007.zwqv3lslbzd4urco@nomi.cz>
        <87insbnl3x.fsf@turtle.gmx.de>
        <20161029192150.wcl6a2jk3w6abwb4@nomi.cz>
Date: Sat, 29 Oct 2016 23:18:51 +0200
In-Reply-To: <20161029192150.wcl6a2jk3w6abwb4@nomi.cz> (Tomas Janousek's
        message of "Sat, 29 Oct 2016 21:21:50 +0200")
Message-ID: <8737jeonus.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomas Janousek <tomi@nomi.cz>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On 2016-10-29 21:21 +0200, Tomas Janousek wrote:

> On Sat, Oct 29, 2016 at 07:03:30PM +0200, Sven Joachim wrote:
>> I cannot reproduce that, FWIW.  Also, arch/x86/entry/vdso/Makefile seems
>> to explicitly filter out -mfentry from the compiler flags, but maybe I
>> misunderstand something.
>
> Compiler flags, yes; assembler flags, no. Perhaps adding
>
>     KBUILD_AFLAGS_32 := $(filter-out -mfentry,$(KBUILD_AFLAGS_32))
>
> to arch/x86/entry/vdso/Makefile would fix the build as well. I have honestly
> no idea which solution is better. :-)
>
>> Could you please show the exact command that's failing with "make V=1"?
>
> gcc -Wp,-MD,arch/x86/entry/vdso/vdso32/.note.o.d -nostdinc -isystem
> /usr/lib/gcc/i686-linux-gnu/6/include -I./arch/x86/include
> -I./arch/x86/include/generated/uapi -I./arch/x86/include/generated
> -I./include -I./arch/x86/include/uapi -I./include/uapi
> -I./include/generated/uapi -include ./include/linux/kconfig.h
> -D__KERNEL__ -D__ASSEMBLY__ -DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1
> -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1
> -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1
> -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_SHA1_NI=1
> -DCONFIG_AS_SHA256_NI=1 -Wa,-gdwarf-2 -mfentry -DCC_USING_FENTRY
> -DCC_HAVE_ASM_GOTO -DBUILD_VDSO -m32 -c -o
> arch/x86/entry/vdso/vdso32/note.o arch/x86/entry/vdso/vdso32/note.S
>
> Is this file being built with your .config?

Yes, and "-mfentry -DCC_USING_FENTRY" is missing from the gcc
commandline there.  And not only there, although I have
CONFIG_FUNCTION_TRACER=y and CONFIG_HAVE_FENTRY=y, which should cause it
to be added to KBUILD_CFLAGS and KBUILD_AFLAGS.

I don't understand that, but it's late in the evening here.

Cheers,
       Sven
