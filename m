Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27153 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfBADHA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Jan 2019 22:07:00 -0500
MIME-Version: 1.0
References: <20190121095338.8565-1-bp@alien8.de> <20190131115820.GF6749@zn.tnic>
In-Reply-To: <20190131115820.GF6749@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Feb 2019 12:06:13 +0900
Message-ID: <CAK7LNATGUs0PPssA=WfHojEEPuztDcNHf0NdH6ohOdf8k8PZOQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Thu, Jan 31, 2019 at 8:58 PM Borislav Petkov <bp@alien8.de> wrote:
>
> Ping?
>
> On Mon, Jan 21, 2019 at 10:53:38AM +0100, Borislav Petkov wrote:
> > From: Borislav Petkov <bp@suse.de>
> >
> > Modern gcc adds view assignments, reset assertion checking in .loc
> > directives and a couple more additional debug markers, which clutters
> > the asm output unnecessarily:
> >
> > For example:
> >
> >   bsp_resume:
> >   .LFB3466:
> >           .loc 1 1868 1 is_stmt 1 view -0
> >           .cfi_startproc
> >           .loc 1 1869 2 view .LVU73
> >   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
> >           .loc 1 1869 14 is_stmt 0 view .LVU74
> >           movq    this_cpu(%rip), %rax    # this_cpu, this_cpu
> >           movq    64(%rax), %rax  # this_cpu.94_1->c_bsp_resume, _2
> >   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
> >           .loc 1 1869 5 view .LVU75
> >           testq   %rax, %rax      # _2
> >           je      .L8     #,
> >           .loc 1 1870 3 is_stmt 1 view .LVU76
> >           movq    $boot_cpu_data, %rdi    #,
> >           jmp     __x86_indirect_thunk_rax
> >
> > or
> >       .loc 2 57 9 view .LVU478
> >       .loc 2 57 9 view .LVU479
> >       .loc 2 57 9 view .LVU480
> >       .loc 2 57 9 view .LVU481
> >   .LBB1385:
> >   .LBB1383:
> >   .LBB1379:
> >   .LBB1377:
> >   .LBB1375:
> >       .loc 2 57 9 view .LVU482
> >       .loc 2 57 9 view .LVU483
> >       movl    %edi, %edx      # cpu, cpu
> >   .LVL87:
> >       .loc 2 57 9 is_stmt 0 view .LVU484
> >
> > That MOV in there is drowned in debugging information and latter makes
> > it hard to follow the asm. And that DWARF info is not really needed for
> > asm output staring.
> >
> > Disable the debug information generation which clutters the asm output
> > unnecessarily:
> >
> >   bsp_resume:
> >   .LFB3466:
> >           .loc 1 1868 1
> >   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
> >           .loc 1 1869 14
> >           movq    this_cpu(%rip), %rax    # this_cpu, this_cpu
> >           movq    64(%rax), %rax  # this_cpu.94_1->c_bsp_resume, _2
> >   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
> >           .loc 1 1869 5
> >           testq   %rax, %rax      # _2
> >           je      .L8     #,
> >   # arch/x86/kernel/cpu/common.c:1870:            this_cpu->c_bsp_resume(&boot_cpu_data);
> >           .loc 1 1870 3
> >           movq    $boot_cpu_data, %rdi    #,
> >           jmp     __x86_indirect_thunk_rax
> >
> > Signed-off-by: Borislav Petkov <bp@suse.de>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: linux-kbuild@vger.kernel.org
> > ---
> >  scripts/Makefile.build | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index fd03d60f6c5a..4f33fdab89d2 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -103,8 +103,12 @@ modkern_cflags =                                          \
> >               $(KBUILD_CFLAGS_KERNEL) $(CFLAGS_KERNEL))
> >  quiet_modtag = $(if $(part-of-module),[M],   )
> >
> > +disable_extra_cc_dbg := $(call cc-option,-gno-as-locview-support)
> > +disable_extra_cc_dbg += $(call cc-option,-fno-dwarf2-cfi-asm)
> > +disable_extra_cc_dbg += $(call cc-option,-feliminate-unused-debug-symbols)
> > +disable_extra_cc_dbg += $(call cc-option,-gno-statement-frontiers)


This would make the build speed slower
because the compiler is invoked to check those flags in every directory.


I tested this patch with x86_64_defconfig and GCC 8.2
(on ubuntu 18.10 in docker)
but I saw no effect of this patch.

CONFIG_DEBUG_INFO adds dwarf info, and clutters asm output.

Did you enable CONFIG_DEBUG_INFO
when you were debugging asm files?


-- 
Best Regards
Masahiro Yamada
