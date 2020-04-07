Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24499 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgDGQDt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 12:03:49 -0400
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org> <20200406110333.GA6266@alpha.franken.de>
In-Reply-To: <20200406110333.GA6266@alpha.franken.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 8 Apr 2020 01:02:53 +0900
Message-ID: <CAK7LNARGO5ciqaseZ7z1k+e-dVh9rU+HY3-1H0XYMwq6+5PqaQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org

On Mon, Apr 6, 2020 at 8:36 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Apr 06, 2020 at 01:30:52AM +0900, Masahiro Yamada wrote:
> > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > CONFIG_SGI_IP32 is enabled.
> >
> > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > objects to vmlinux when CONFIG_MODULES=y.
> >
> > As a groundwork, we must fix multiple definitions that have previously
> > been hidden by lib-y.
> >
> > The prom_cleanup() in this file is already marked as __weak (because
> > it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
> > I think it should be OK to do the same for these two.
> >
> > [1]: https://github.com/ClangBuiltLinux/linux/issues/515
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > If MIPS maintainers ack this patch,
> > I want to inser it before the following patch:
>
>
> Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
> Thomas.


Applied to linux-kbuild with Thomas' Ack.

Thanks.


>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200406110333.GA6266%40alpha.franken.de.



-- 
Best Regards
Masahiro Yamada
