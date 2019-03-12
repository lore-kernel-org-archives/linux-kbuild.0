Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56174 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfCLQGX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Mar 2019 12:06:23 -0400
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x2CG6CLk009856
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 01:06:13 +0900
Received: by mail-vk1-f175.google.com with SMTP id p190so451617vke.4
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Mar 2019 09:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
In-Reply-To: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 13 Mar 2019 01:05:36 +0900
Message-ID: <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com>
Subject: Re: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 12, 2019 at 6:13 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro Yamada,
>
> do you have an idea how to fix this properly - as for example LLD
> hasn't this option?
> Speaking of the shell-line.
> I mean use the method "call ld-option".
>
> The below should be if $linker supports z noreloc-overflow then set
> -pie together with --no-dynamic-linker.
> AFAICS this is for x86-64-only?
>
> Is it possible to simplify and have have one single line...?


Sorry, I do not understand.

Could you clarify what you want to achieve?


Thanks.






> KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
>
> [ arch/x86/boot/compressed/Makefile ]
>
> KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
> # Compressed kernel should be built as PIE since it may be loaded at any
> # address by the bootloader.
> ifeq ($(CONFIG_X86_32),y)
> KBUILD_LDFLAGS += $(call ld-option, -pie) $(call ld-option, --no-dynamic-linker)
> else
> # To build 64-bit compressed kernel as PIE, we disable relocation
> # overflow check to avoid relocation overflow error with a new linker
> # command-line option, -z noreloc-overflow.
> KBUILD_LDFLAGS += $(shell $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" \
>         && echo "-z noreloc-overflow -pie --no-dynamic-linker")
> endif
> LDFLAGS_vmlinux := -T
>
> If you need more infos let me know.
>
> Thanks.
>
> Regards,
> - Sedat -
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/411



-- 
Best Regards
Masahiro Yamada
