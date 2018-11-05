Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35718 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387983AbeKFH7x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Nov 2018 02:59:53 -0500
Received: by mail-pl1-f194.google.com with SMTP id n4-v6so5163674plp.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2018 14:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20181104231133.30848-1-joel@jms.id.au>
In-Reply-To: <20181104231133.30848-1-joel@jms.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 5 Nov 2018 14:37:44 -0800
Message-ID: <CAKwvOdm8WZTeB_wxkO2nN7PW=v=2z7tdVapTq-TiB18nZZfS=A@mail.gmail.com>
Subject: Re: [PATCH 0/2] poewrpc/Boot: Fix cross compiling with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joel@jms.id.au
Cc: mpe@ellerman.id.au, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org

On Sun, Nov 4, 2018 at 3:11 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello,
>
> These patches allow clang to cross-compile the powerpc boot wrapper.
> The boot wrapper constructs it's own compiler flags as it may not be
> built for the same arch as the kernel.

Hi Joel, thanks for the series!  I'm just curious, how does the boot
wrapper run on a different arch than the kernel?

>
> The powerpc64le kernel builds natively with clang and with this patch it
> can cross compile too.
>
> Joel Stanley (2):
>   Makefile: Export clang toolchain variables
>   powerpc/boot: Set target when cross-compiling for clang
>
>  Makefile                   | 3 +++
>  arch/powerpc/boot/Makefile | 7 +++++++
>  2 files changed, 10 insertions(+)
>
> --
> 2.19.1
>


-- 
Thanks,
~Nick Desaulniers
