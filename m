Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37991 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbeKFJ7C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Nov 2018 04:59:02 -0500
MIME-Version: 1.0
References: <20181104231133.30848-1-joel@jms.id.au> <CAKwvOdm8WZTeB_wxkO2nN7PW=v=2z7tdVapTq-TiB18nZZfS=A@mail.gmail.com>
In-Reply-To: <CAKwvOdm8WZTeB_wxkO2nN7PW=v=2z7tdVapTq-TiB18nZZfS=A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Nov 2018 11:06:24 +1030
Message-ID: <CACPK8XeoBufr6ScXcdESsZEg9LQBHyx5V1T2WKbTbSDCaqFYfA@mail.gmail.com>
Subject: Re: [PATCH 0/2] poewrpc/Boot: Fix cross compiling with clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org

On Tue, 6 Nov 2018 at 09:07, Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Sun, Nov 4, 2018 at 3:11 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Hello,
> >
> > These patches allow clang to cross-compile the powerpc boot wrapper.
> > The boot wrapper constructs it's own compiler flags as it may not be
> > built for the same arch as the kernel.
>
> Hi Joel, thanks for the series!  I'm just curious, how does the boot
> wrapper run on a different arch than the kernel?

The kernel can have a ppc32 boot wrapper for a ppc64 kernel. There's
some rationale in the boot wrapper's Makefile:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/boot/Makefile#n10

Cheers,

Joel
