Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34525 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDFBpt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 21:45:49 -0400
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org> <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 Apr 2020 10:45:03 +0900
Message-ID: <CAK7LNATKLcCPYxQZNbrS-jMPg+_BETU0dGv0qYvLqUkJ2fMt5w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>

On Mon, Apr 6, 2020 at 2:16 AM Maciej W. Rozycki <macro@linux-mips.org> wrote:
>
> On Mon, 6 Apr 2020, Masahiro Yamada wrote:
>
> > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > CONFIG_SGI_IP32 is enabled.
> >
> > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > objects to vmlinux when CONFIG_MODULES=y.
>
>  It looks to me like a bug in the linker in the handling of the EXTERN
> command.  Why not fix the linker instead?
>
>   Maciej


I am not sure if this is a bug.
Anyway, they decided to not change ld.lld


MIPS code is so confusing.
There are multiple definitions,
and lib.a is (ab)used to hide them.

I fixed another one for MIPS before, and
0-day bot reported this recently.


There are lots of prom_meminit() definitions
in arch/mips/.

Making the intention clearer is a good thing, IMHO.


-- 
Best Regards
Masahiro Yamada
