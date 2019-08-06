Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34182 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfHFJAi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 05:00:38 -0400
MIME-Version: 1.0
References: <20190806043729.5562-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190806043729.5562-1-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 6 Aug 2019 11:00:19 +0200
Message-ID: <CAK8P3a2POcb+AReLKib513i_RTN9kLM_Tun7+G5LOacDuy7gjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: re-implement detection of CONFIG options
 leaked to user-space
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Amit Pundir <amit.pundir@linaro.org>

On Tue, Aug 6, 2019 at 6:38 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I was playing with sed yesterday, but the resulted code might be unreadable.
>
> Sed scripts tend to be somewhat unreadable.
> I just wondered which language is appropriate for this?
> Maybe perl, or what else? I am not good at perl, though.

I like the sed version, in particular as it seems to do the job and
I'm not volunteering to write it in anything else.

> Maybe, it will be better to fix existing warnings
> before enabling this check.

Yes, absolutely.

> If somebody takes a closer look at them, that would be great.

Let's see:

> warning: include/uapi/linux/elfcore.h: leaks CONFIG_BINFMT_ELF_FDPIC to user-space

This one is nontrivial, since it defines two incompatible layouts for
this structure,
and the fdpic version is currently not usable at all from user space. Also,
the definition breaks configurations that have both CONFIG_BINFMT_ELF
and CONFIG_BINFMT_ELF_FDPIC enabled, which has become possible
with commit 382e67aec6a7 ("ARM: enable elf_fdpic on systems with an MMU").

The best way forward I see is to duplicate the structure definition, adding
a new 'struct elf_fdpic_prstatus', and using that in fs/binfmt_elf_fdpic.c.
The same change is required in include/linux/elfcore-compat.h.

> warning: include/uapi/linux/atmdev.h: leaks CONFIG_COMPAT to user-space

The "#define COMPAT_ATM_ADDPARTY" can be moved to include/linux/atmdev.h,
it's not needed in the uapi header

> warning: include/uapi/linux/raw.h: leaks CONFIG_MAX_RAW_DEVS to user-space

This has never been usable, I'd just remove MAX_RAW_MINORS and change
drivers/char/raw.c to use CONFIG_MAX_RAW_DEVS

> warning: include/uapi/linux/pktcdvd.h: leaks CONFIG_CDROM_PKTCDVD_WCACHE to user-space

USE_WCACHING can be moved to drivers/block/pktcdvd.c

> warning: include/uapi/linux/eventpoll.h: leaks CONFIG_PM_SLEEP to user-space

ep_take_care_of_epollwakeup() should not be in the header at all I think.
Commit 95f19f658ce1 ("epoll: drop EPOLLWAKEUP if PM_SLEEP is disabled")
was wrong to move it out of fs/eventpoll.c, and I'd just move it back
as an inline function. (Added Amit to Cc for clarification).

> warning: include/uapi/linux/hw_breakpoint.h: leaks CONFIG_HAVE_MIXED_BREAKPOINTS_REGS to user-space

enum bp_type_idx started out in kernel/events/hw_breakpoint.c
and was later moved to a header which then became public. I
don't think it was ever meant to be public though. We either want
to move it back, or change the CONFIG_HAVE_MIXED_BREAKPOINTS_REGS
macro to an __ARCH_HAVE_MIXED_BREAKPOINTS_REGS that
is explicitly set in a header file by x86 and superh.

> warning: include/uapi/asm-generic/fcntl.h: leaks CONFIG_64BIT to user-space

The #ifdef could just be changed to
#if __BITS_PER_LONG == 32

We could also do this differently, given that most 64-bit architectures define
the same macros in their arch/*/include/asm/compat.h files (parisc and mips
use different values).

> warning: arch/x86/include/uapi/asm/mman.h: leaks CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS to user-space

I think arch_vm_get_page_prot should not be in the uapi header,
other architectures have it in arch/powerpc/include/asm/mman.h

> warning: arch/x86/include/uapi/asm/auxvec.h: leaks CONFIG_IA32_EMULATION to user-space
> warning: arch/x86/include/uapi/asm/auxvec.h: leaks CONFIG_X86_64 to user-space

It looks like this definition has always been wrong, across several
changes that made it wrong in different ways.

AT_VECTOR_SIZE_ARCH is supposed to define the size of the extra
aux vectors, which is meant to be '2' for i386 tasks, and '1' for
x86_64 tasks, regardless of how the kernel is configured. I looked at
this for a bit but it's hard to tell how to fix this without introducing
possible regressions. Note how 'mm->saved_auxv' uses this
size and gets copied between kernel and user space.

       Arnd
