Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30483 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfCRJp5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 05:45:57 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x2I9jqRe004723
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 18:45:53 +0900
Received: by mail-vk1-f179.google.com with SMTP id g24so1272795vki.2
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 02:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
 <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com> <CA+icZUWQwuOH_GTRdSG0wo-dAi-JwZph9eTQphrrwytOMw=Awg@mail.gmail.com>
In-Reply-To: <CA+icZUWQwuOH_GTRdSG0wo-dAi-JwZph9eTQphrrwytOMw=Awg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Mar 2019 18:45:15 +0900
Message-ID: <CAK7LNAQoBs5_0t_FUqRCBm4ir4PuhyW1gSL+xmoM8_uPHrBP1Q@mail.gmail.com>
Subject: Re: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Sedat,


On Wed, Mar 13, 2019 at 5:52 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Mar 12, 2019 at 5:06 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Tue, Mar 12, 2019 at 6:13 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > Hi Masahiro Yamada,
> > >
> > > do you have an idea how to fix this properly - as for example LLD
> > > hasn't this option?
> > > Speaking of the shell-line.
> > > I mean use the method "call ld-option".
> > >
> > > The below should be if $linker supports z noreloc-overflow then set
> > > -pie together with --no-dynamic-linker.
> > > AFAICS this is for x86-64-only?
> > >
> > > Is it possible to simplify and have have one single line...?
> >
> >
> > Sorry, I do not understand.
> >
> > Could you clarify what you want to achieve?
> >
> >
> > Thanks.
> >
> >
> >
> >
> >
> >
> > > KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
> > >
> > > [ arch/x86/boot/compressed/Makefile ]
> > >
> > > KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
> > > # Compressed kernel should be built as PIE since it may be loaded at any
> > > # address by the bootloader.
> > > ifeq ($(CONFIG_X86_32),y)
> > > KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
>
> See below.
>
> > > else
> > > # To build 64-bit compressed kernel as PIE, we disable relocation
> > > # overflow check to avoid relocation overflow error with a new linker
> > > # command-line option, -z noreloc-overflow.
>
> > > KBUILD_LDFLAGS += $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
> > >         && echo "-z noreloc-overflow -pie --no-dynamic-linker")
>
> First of all, I would like to have the "-z noreloc-overflow" checked
> via "call ld-option".
> Where I have problems is how to check the following, "-pie
> --no-dynamic-linker" shall be set if "-z noreloc-overflow" is
> available.
> According to the comments, this is for the  CONFIG_X86_64 case.
>
> ifeq ($(CONFIG_X86_64),y)
> KBUILD_LDFLAGS += $(call ld-option, -z noreloc-overflow)


Is this equivalent to
   $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" ... ?





> if z-noreloc-oevrflow-ld-option-is-available
> KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
> endif # z-noreloc-oevrflow-ld-option-is-available
> endif # CONFIG_X86_64
>
> As we have the 2nd check for the CONFIG_X86_32 case already, I asked
> myself if it is possible to use it at one single place.
>
> KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)


If you want to factor out the -pie --no-dynamic-linker tests,
the following may work.

It is not very clean...


ifeq ($(CONFIG_X86_64),y)
KBUILD_LDFLAGS = $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
       && echo "-z noreloc-overflow")
endif

ifneq ($(filter noreloc-overflow,$(KBUILD_LDFLAGS))$(CONFIG_X86_32),)
KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
endif




Perhaps, testing flags in Kconfig might make it a bit cleaner,
but I am not sure.


Masahiro


> Is this now clearer?
>
> Regards,
> - Sedat -
>
> > > endif
> > > LDFLAGS_vmlinux := -T
> > >
> > > If you need more infos let me know.
> > >
> > > Thanks.
> > >
> > > Regards,
> > > - Sedat -
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/411
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
