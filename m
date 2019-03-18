Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f47.google.com ([209.85.128.47]:51379 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfCRLvT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 07:51:19 -0400
Received: by mail-wm1-f47.google.com with SMTP id n19so12675646wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 04:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUVsc8fjxj1KGMWCQVPnaG+_W79HQ8xky=0Qd_vY55GU2Q@mail.gmail.com>
 <CAK7LNASFcbPn2zaYTLhDMnhAQi9KRLnNT1hegXnGTdn=eiCKkw@mail.gmail.com>
 <CA+icZUWQwuOH_GTRdSG0wo-dAi-JwZph9eTQphrrwytOMw=Awg@mail.gmail.com> <CAK7LNAQoBs5_0t_FUqRCBm4ir4PuhyW1gSL+xmoM8_uPHrBP1Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQoBs5_0t_FUqRCBm4ir4PuhyW1gSL+xmoM8_uPHrBP1Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 18 Mar 2019 12:51:05 +0100
Message-ID: <CA+icZUV1k-MX8PYyN4pEXdsiRrXiC4Qg7vb-kamj1XBAN4j7sg@mail.gmail.com>
Subject: Re: Fix and simplify -z noreloc-overflow" linker check in arch/x86/boot/compressed/Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Mar 18, 2019 at 10:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
[ ... ]
> > ifeq ($(CONFIG_X86_64),y)
> > KBUILD_LDFLAGS += $(call ld-option, -z noreloc-overflow)
>
>
> Is this equivalent to
>    $(LD) --help 2>&1 | grep -q "\-z noreloc-overflow" ... ?

I tried with BFD (option exists and is set) and LLD (option does not
exist, is not set).

You do not think it is equivalent?

- sed@ -
