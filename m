Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:61165 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCu3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:50:29 -0400
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
 <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com> <CACPK8XdVZHtCtHzv9vmt8C877SBbZNqRPxT9iUe0+8-o7X9W7g@mail.gmail.com>
In-Reply-To: <CACPK8XdVZHtCtHzv9vmt8C877SBbZNqRPxT9iUe0+8-o7X9W7g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:49:45 +0900
Message-ID: <CAK7LNAS71K4my-eyYryViy_uQ0LR5hbzyMjAwZUta99pU=0X9g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, May 13, 2019 at 11:35 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Mon, 13 May 2019 at 02:28, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Thu, May 9, 2019 at 4:36 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > If the compiler specified by $(CC) is not present, the Kconfig stage
> > > sprinkles 'not found' messages, then succeeds.
> > >
> > >   $ make CROSS_COMPILE=foo defconfig
> > >   /bin/sh: 1: foogcc: not found
> > >   /bin/sh: 1: foogcc: not found
> > >   *** Default configuration is based on 'x86_64_defconfig'
> > >   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> > >   ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
> > >   ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
> > >   init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
> > >   #
> > >   # configuration written to .config
> > >   #
> > >
> > > Terminate parsing files immediately if $(CC) or $(LD) is not found.
> > > "make *config" will fail more nicely.
> > >
> > >   $ make CROSS_COMPILE=foo defconfig
> > >   *** Default configuration is based on 'x86_64_defconfig'
> > >   scripts/Kconfig.include:34: compiler 'foogcc' not found
> > >   make[1]: *** [scripts/kconfig/Makefile;82: defconfig] Error 1
> > >   make: *** [Makefile;557: defconfig] Error 2
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> >
> > Applied to linux-kbuild.
>
> Thanks Masahiro! I had this in my inbox to test but you're too efficient.
>
> Testing your patch on linus' tree as of today (d7a02fa0a8f9) gives me
> this output:
>
> $ CROSS_COMPILE=foo  make
> make: foogcc: Command not found
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/Kconfig.include:34: compiler 'foogcc' not found
> make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
> make[1]: *** [Makefile:557: syncconfig] Error 2
> make: *** [include/config/auto.conf.cmd] Deleting file
> 'include/config/tristate.conf'
> make: Failed to remake makefile 'include/config/auto.conf'.
>   SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   HOSTCC  arch/x86/tools/relocs_32.o
>   HOSTCC  arch/x86/tools/relocs_64.o
>   HOSTCC  arch/x86/tools/relocs_common.o
>   HOSTLD  arch/x86/tools/relocs
>   UPD     include/config/kernel.release
>   WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
>   WRAP    arch/x86/include/generated/uapi/asm/poll.h
>   WRAP    arch/x86/include/generated/uapi/asm/socket.h
>   WRAP    arch/x86/include/generated/uapi/asm/sockios.h
>   WRAP    arch/x86/include/generated/asm/dma-contiguous.h
>   WRAP    arch/x86/include/generated/asm/early_ioremap.h
>   WRAP    arch/x86/include/generated/asm/export.h
>   WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
>   WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
>   WRAP    arch/x86/include/generated/asm/mmiowb.h
>   UPD     include/generated/uapi/linux/version.h
>   UPD     include/generated/utsrelease.h
>   HOSTCC  scripts/selinux/genheaders/genheaders
>   HOSTCC  scripts/selinux/mdp/mdp
>   HOSTCC  scripts/kallsyms
>   HOSTCC  scripts/pnmtologo
>   HOSTCC  scripts/conmakehash
>   HOSTCC  scripts/sortextable
>   HOSTCC  scripts/asn1_compiler
>   HOSTCC  scripts/extract-cert
> You are building kernel with non-retpoline compiler.
> Please update your compiler.
> make: *** [arch/x86/Makefile:308: checkbin] Error 1
>
> Which is a little confusing.
>
> The second time is shorter, but the retpoline message is not ideal:
>
> $ CROSS_COMPILE=foo  make
> make: foogcc: Command not found
> scripts/kconfig/conf  --syncconfig Kconfig
> scripts/Kconfig.include:34: compiler 'foogcc' not found
> make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
> make[1]: *** [Makefile:557: syncconfig] Error 2
> make: Failed to remake makefile 'include/config/auto.conf'.
> You are building kernel with non-retpoline compiler.
> Please update your compiler.


I think you are seeing a different bug.

Please test after applying this as well:
https://patchwork.kernel.org/patch/10939845/


Thanks.




-- 
Best Regards
Masahiro Yamada
