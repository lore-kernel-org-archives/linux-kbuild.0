Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62278 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728164AbfBSX4F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Feb 2019 18:56:05 -0500
MIME-Version: 1.0
References: <20190201103648.GF31854@zn.tnic> <CAK7LNAQ4juLxrdMoPumQQ-96fMorf+wfAqkNxq1X1k=0i_R4vQ@mail.gmail.com>
 <20190201151139.GK31854@zn.tnic> <CAK7LNATVeX=6Mmn6A4+EGmZ9OSf=ePwbQWV1m1c=e=_LiebdNQ@mail.gmail.com>
 <20190202144227.GC27822@zn.tnic> <20190206104729.GC7314@zn.tnic>
 <CAK7LNAT+GhbEwP7v7NWd2kqW76qbXM1mtKhc21YXkp7BUJjzKQ@mail.gmail.com>
 <20190210123923.GA14948@zn.tnic> <20190218083008.GB4265@zn.tnic>
 <CAK7LNAQ_UfHcin1G_fqEX0qZ-AFe7=GHfnHZ2QZu1oe=dZW-aA@mail.gmail.com> <20190218143145.GF4265@zn.tnic>
In-Reply-To: <20190218143145.GF4265@zn.tnic>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 20 Feb 2019 08:55:16 +0900
Message-ID: <CAK7LNATUcHwiy1btn7sgLmP0jx_OghRn4VNrK_A+4RcQNP4WmQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable extra debugging info in .s output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Mon, Feb 18, 2019 at 11:32 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Mon, Feb 18, 2019 at 06:10:57PM +0900, Masahiro Yamada wrote:
> > Could you send v2 as I suggested?
> > Your commit log describes your motivation perfectly.
> >
> > (I lost the applicable patch because
> > I just modified the code locally and pasted it
> > into the previous email.)
>
> Sure, here it is.
>
> Thx.


Applied to linux-kbuild.

Thanks.


> ---
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date: Sun, 25 Nov 2018 23:58:00 +0100
> Subject: [PATCH] kbuild: Disable extra debugging info in .s output
>
> Modern gcc adds view assignments, reset assertion checking in .loc
> directives and a couple more additional debug markers, which clutters
> the asm output unnecessarily:
>
> For example:
>
>   bsp_resume:
>   .LFB3466:
>           .loc 1 1868 1 is_stmt 1 view -0
>           .cfi_startproc
>           .loc 1 1869 2 view .LVU73
>   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
>           .loc 1 1869 14 is_stmt 0 view .LVU74
>           movq    this_cpu(%rip), %rax    # this_cpu, this_cpu
>           movq    64(%rax), %rax  # this_cpu.94_1->c_bsp_resume, _2
>   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
>           .loc 1 1869 5 view .LVU75
>           testq   %rax, %rax      # _2
>           je      .L8     #,
>           .loc 1 1870 3 is_stmt 1 view .LVU76
>           movq    $boot_cpu_data, %rdi    #,
>           jmp     __x86_indirect_thunk_rax
>
> or
>         .loc 2 57 9 view .LVU478
>         .loc 2 57 9 view .LVU479
>         .loc 2 57 9 view .LVU480
>         .loc 2 57 9 view .LVU481
>   .LBB1385:
>   .LBB1383:
>   .LBB1379:
>   .LBB1377:
>   .LBB1375:
>         .loc 2 57 9 view .LVU482
>         .loc 2 57 9 view .LVU483
>         movl    %edi, %edx      # cpu, cpu
>   .LVL87:
>         .loc 2 57 9 is_stmt 0 view .LVU484
>
> That MOV in there is drowned in debugging information and latter makes
> it hard to follow the asm. And that DWARF info is not really needed for
> asm output staring.
>
> Disable the debug information generation which clutters the asm output
> unnecessarily:
>
>   bsp_resume:
>   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
>           movq    this_cpu(%rip), %rax    # this_cpu, this_cpu
>           movq    64(%rax), %rax  # this_cpu.94_1->c_bsp_resume, _2
>   # arch/x86/kernel/cpu/common.c:1869:    if (this_cpu->c_bsp_resume)
>           testq   %rax, %rax      # _2
>           je      .L8     #,
>   # arch/x86/kernel/cpu/common.c:1870:            this_cpu->c_bsp_resume(&boot_cpu_data);
>           movq    $boot_cpu_data, %rdi    #,
>           jmp     __x86_indirect_thunk_rax
>   .L8:
>   # arch/x86/kernel/cpu/common.c:1871: }
>           rep ret
>           .size   bsp_resume, .-bsp_resume
>
>   [ bp: write commit message. ]
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Makefile               | 13 ++++++++-----
>  scripts/Makefile.build |  2 +-
>  2 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 96c5335e7ee4..c5e7d3ac8bd2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -729,25 +729,28 @@ KBUILD_CFLAGS     += -fomit-frame-pointer
>  endif
>  endif
>
> -KBUILD_CFLAGS   += $(call cc-option, -fno-var-tracking-assignments)
> +DEBUG_CFLAGS   := $(call cc-option, -fno-var-tracking-assignments)
>
>  ifdef CONFIG_DEBUG_INFO
>  ifdef CONFIG_DEBUG_INFO_SPLIT
> -KBUILD_CFLAGS   += $(call cc-option, -gsplit-dwarf, -g)
> +DEBUG_CFLAGS   += $(call cc-option, -gsplit-dwarf, -g)
>  else
> -KBUILD_CFLAGS  += -g
> +DEBUG_CFLAGS   += -g
>  endif
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>  ifdef CONFIG_DEBUG_INFO_DWARF4
> -KBUILD_CFLAGS  += $(call cc-option, -gdwarf-4,)
> +DEBUG_CFLAGS   += $(call cc-option, -gdwarf-4,)
>  endif
>
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> -KBUILD_CFLAGS  += $(call cc-option, -femit-struct-debug-baseonly) \
> +DEBUG_CFLAGS   += $(call cc-option, -femit-struct-debug-baseonly) \
>                    $(call cc-option,-fno-var-tracking)
>  endif
>
> +KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> +export DEBUG_CFLAGS
> +
>  ifdef CONFIG_FUNCTION_TRACER
>  ifdef CONFIG_FTRACE_MCOUNT_RECORD
>    # gcc 5 supports generating the mcount tables directly
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index fd03d60f6c5a..8f5c86da77b1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -104,7 +104,7 @@ modkern_cflags =                                          \
>  quiet_modtag = $(if $(part-of-module),[M],   )
>
>  quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
> -cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
> +cmd_cc_s_c       = $(CC) $(filter-out $(DEBUG_CFLAGS), $(c_flags)) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
>
>  $(obj)/%.s: $(src)/%.c FORCE
>         $(call if_changed_dep,cc_s_c)
> --
> 2.19.1
>
> --
> Regards/Gruss,
>     Boris.
>
> Good mailing practices for 400: avoid top-posting and trim the reply.



-- 
Best Regards
Masahiro Yamada
