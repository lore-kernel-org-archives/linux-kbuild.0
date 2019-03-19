Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:16724 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfCSAyH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 20:54:07 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x2J0s0cg012430
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Mar 2019 09:54:00 +0900
Received: by mail-vk1-f170.google.com with SMTP id d15so1689854vka.8
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 17:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
 <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com>
 <CA+icZUWQwuOH_GTRdSG0wo-dAi-JwZph9eTQphrrwytOMw=Awg@mail.gmail.com>
 <CAK7LNAQoBs5_0t_FUqRCBm4ir4PuhyW1gSL+xmoM8_uPHrBP1Q@mail.gmail.com> <CA+icZUV1k-MX8PYyN4pEXdsiRrXiC4Qg7vb-kamj1XBAN4j7sg@mail.gmail.com>
In-Reply-To: <CA+icZUV1k-MX8PYyN4pEXdsiRrXiC4Qg7vb-kamj1XBAN4j7sg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 19 Mar 2019 09:53:23 +0900
Message-ID: <CAK7LNATbTGXTVTJjnB3uCjyga+hgwPefvjTt8g1L5JL0sDUtVw@mail.gmail.com>
Subject: Re: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Mar 18, 2019 at 8:51 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Mar 18, 2019 at 10:46 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> [ ... ]
> > > ifeq ($(CONFIG_X86_64),y)
> > > KBUILD_LDFLAGS += $(call ld-option, -z noreloc-overflow)
> >
> >
> > Is this equivalent to
> >    $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" ... ?
>
> I tried with BFD (option exists and is set) and LLD (option does not
> exist, is not set).
>
> You do not think it is equivalent?


How about BFD (option does not exist) ?

cc-option, ld-option, and friends
check whether the exit code is zero or not.


ld shows a warning for unsupported "-v ...",
but returns 0 somehow.

But, it correctly returns 1 for the other
unsupported options.

I do not know why.


$ ld -v
GNU ld (GNU Binutils for Ubuntu) 2.26.1
$ ld --help 2>&1 | grep -q "\-z noreloc-overflow"
$ echo $?
1
$ ld -z noreloc-overflow -v
ld: warning: -z noreloc-overflow ignored.
GNU ld (GNU Binutils for Ubuntu) 2.26.1
$ echo $?
0
$ ld -mmy-machine -v
ld: unrecognised emulation mode: my-machine
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
i386linux elf_l1om elf_k1om i386pep i386pe
$ echo $?
1




-- 
Best Regards
Masahiro Yamada
