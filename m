Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55721 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbfCMIwK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 04:52:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id 4so980906wmf.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 01:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
 <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com>
In-Reply-To: <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 13 Mar 2019 09:51:56 +0100
Message-ID: <CA+icZUWQwuOH_GTRdSG0wo-dAi-JwZph9eTQphrrwytOMw=Awg@mail.gmail.com>
Subject: Re: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 12, 2019 at 5:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Tue, Mar 12, 2019 at 6:13 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro Yamada,
> >
> > do you have an idea how to fix this properly - as for example LLD
> > hasn't this option?
> > Speaking of the shell-line.
> > I mean use the method "call ld-option".
> >
> > The below should be if $linker supports z noreloc-overflow then set
> > -pie together with --no-dynamic-linker.
> > AFAICS this is for x86-64-only?
> >
> > Is it possible to simplify and have have one single line...?
>
>
> Sorry, I do not understand.
>
> Could you clarify what you want to achieve?
>
>
> Thanks.
>
>
>
>
>
>
> > KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
> >
> > [ arch/x86/boot/compressed/Makefile ]
> >
> > KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
> > # Compressed kernel should be built as PIE since it may be loaded at any
> > # address by the bootloader.
> > ifeq ($(CONFIG_X86_32),y)
> > KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)

See below.

> > else
> > # To build 64-bit compressed kernel as PIE, we disable relocation
> > # overflow check to avoid relocation overflow error with a new linker
> > # command-line option, -z noreloc-overflow.

> > KBUILD_LDFLAGS += $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
> >         && echo "-z noreloc-overflow -pie --no-dynamic-linker")

First of all, I would like to have the "-z noreloc-overflow" checked
via "call ld-option".
Where I have problems is how to check the following, "-pie
--no-dynamic-linker" shall be set if "-z noreloc-overflow" is
available.
According to the comments, this is for the  CONFIG_X86_64 case.

ifeq ($(CONFIG_X86_64),y)
KBUILD_LDFLAGS += $(call ld-option, -z noreloc-overflow)
if z-noreloc-oevrflow-ld-option-is-available
KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
endif # z-noreloc-oevrflow-ld-option-is-available
endif # CONFIG_X86_64

As we have the 2nd check for the CONFIG_X86_32 case already, I asked
myself if it is possible to use it at one single place.

KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)

Is this now clearer?

Regards,
- Sedat -

> > endif
> > LDFLAGS_vmlinux := -T
> >
> > If you need more infos let me know.
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/411
>
>
>
> --
> Best Regards
> Masahiro Yamada
