Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33844 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728310AbfGPVUS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 17:20:18 -0400
Received: by mail-qk1-f193.google.com with SMTP id t8so15817734qkt.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 14:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716170606.GA38406@archlinux-threadripper> <alpine.DEB.2.21.1907162059200.1767@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1907162135590.1767@nanos.tec.linutronix.de> <20190716195957.GA38495@archlinux-threadripper>
In-Reply-To: <20190716195957.GA38495@archlinux-threadripper>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 16 Jul 2019 22:20:06 +0100
Message-ID: <CAHbf0-GjYKZtV2786d5n2EEnVM9TW6cZbxjG3mtqm_bw=1CThA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Fail if gold linker is detected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org, "H.J. Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>

On Tue, 16 Jul 2019 at 21:00, Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Jul 16, 2019 at 09:47:27PM +0200, Thomas Gleixner wrote:
> > The gold linker has known issues of failing the build both in random and in
> > predictible ways:
> >
> >  - The x86/X32 VDSO build fails with:
> >
> >    arch/x86/entry/vdso/vclock_gettime-x32.o:vclock_gettime.c:function do_hres:
> >    error: relocation overflow: reference to 'hvclock_page'
> >
> >    That's a known issue for years and the usual workaround is to disable
> >    CONFIG_X86_32
> >
> >  - A recent build failure is caused by turning a relocation into an
> >    absolute one for unknown reasons. See link below.
> >
> >  - There are a couple of gold workarounds applied already, but reports
> >    about broken builds with ld.gold keep coming in on a regular base and in
> >    most cases the root cause is unclear.
> >
> > In context of the most recent fail H.J. stated:
> >
> >   "Since building a workable kernel for different kernel configurations
> >    isn't a requirement for gold, I don't recommend gold for kernel."
> >
> > So instead of dealing with attempts to duct tape gold support without
> > understanding the root cause and without support from the gold folks, fail
> > the build when gold is detected.
> >
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Link: https://lore.kernel.org/r/CAMe9rOqMqkQ0LNpm25yE_Yt0FKp05WmHOrwc0aRDb53miFKM+w@mail.gmail.com
>
> Based on the crude little testing script I wrote below:
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
> $ cat test.sh
> #!/bin/bash
>
> # ld.bfd (expected to pass)
> make distclean defconfig || exit ${?}
>
> # ld.gold explicitly (expected to fail)
> make LD=ld.gold distclean defconfig && exit ${?}
>
> # ld.gold as if it were the system linker (expected to fail)
> ln -fs /usr/bin/ld.gold ld
> PATH=${PWD}:${PATH} make distclean defconfig && exit ${?}
>
> # ld.lld (expected to pass)
> make LD=ld.lld distclean defconfig || exit ${?}

Hi

Would it be possible to force ld.bfd with -fuse-ld=bfd when gold is detected?

Are there gold bug reports for any of the issues that have been seen
with gold? It's been my default system linker for years and I've had
very few issues with it and it's a big improvement when linking with
LTO

Cheers

Mike
