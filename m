Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55455 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388360AbeGXMUr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Jul 2018 08:20:47 -0400
Date: Tue, 24 Jul 2018 13:14:45 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v6 1/9] Makefile: Prepare for using macros for inline asm
Message-ID: <20180724111445.GB14212@gmail.com>
References: <20180622172212.199633-1-namit@vmware.com>
 <20180622172212.199633-2-namit@vmware.com>
 <CAK7LNASaZd9fupgu4vxc6+tnCnNMdrCi7LTwS56K1LaKODoCtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASaZd9fupgu4vxc6+tnCnNMdrCi7LTwS56K1LaKODoCtA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nadav Amit <namit@vmware.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


* Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> 2018-06-23 2:22 GMT+09:00 Nadav Amit <namit@vmware.com>:
> > Using macros for inline assembly improves both readability and
> > compilation decisions that are distorted by big assembly blocks that use
> > alternative sections. Compile macros.S and use it to assemble all C
> > files. Currently, only x86 will use it.
> >
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: x86@kernel.org
> > Cc: linux-kbuild@vger.kernel.org
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Signed-off-by: Nadav Amit <namit@vmware.com>
> > ---
> 
> 
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> 
> 
> 
> 
> >  Makefile                 |  9 +++++++--
> >  arch/x86/Makefile        | 11 +++++++++--
> >  arch/x86/kernel/macros.S |  7 +++++++
> >  scripts/Kbuild.include   |  4 +++-
> >  scripts/mod/Makefile     |  2 ++
> >  5 files changed, 28 insertions(+), 5 deletions(-)
> >  create mode 100644 arch/x86/kernel/macros.S

So this patch appears to break the xtensa cross-build on my system, with an older 
version of crosstools:

  MODPOST vmlinux.o
/home/mingo/crosstool-korg/bin//gcc-4.9.0-nolibc/xtensa-linux/bin/xtensa-linux-ld:./arch/xtensa/kernel/vmlinux.lds:430: 
syntax error
/home/mingo/tip/Makefile:1010: recipe for target 'vmlinux' failed
make[1]: *** [vmlinux] Error 1
make[1]: Leaving directory '/dev/shm/tip/build'
Makefile:146: recipe for target 'sub-make' failed

Thanks,

	Ingo
