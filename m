Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45909 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbfIDWky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 18:40:54 -0400
Date: Wed, 4 Sep 2019 15:40:50 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: refactor scripts/Makefile.extrawarn
Message-ID: <20190904224050.GA82176@archlinux-threadripper>
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Sep 04, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> On Sat, Aug 31, 2019 at 6:26 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> 
> > +# Some diagnostics enabled by default are noisy.
> > +# Suppress them by using -Wno... except for W=1.
> > +
> >  ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS += -Wno-initializer-overrides
> >  KBUILD_CFLAGS += -Wno-format
> >  KBUILD_CFLAGS += -Wno-sign-compare
> >  KBUILD_CFLAGS += -Wno-format-zero-length
> >  endif
> 
> FWIW, I just found out I missed a bug that clang failed to warn about
> because of the  -Wno-format. Apparently gcc warns only about type
> mismatches that result in incompatible calling conventions (e.g.
> int vs int64_t) but not smaller types (int, short) that get converted to an
> int anyway. Passing -Wno-format turns both off.
> 
>       Arnd

Hi Arnd,

This has been fixed in clang 10.0.0 but this areas has not been updated
as nobody has sent a patch yet:

https://github.com/ClangBuiltLinux/linux/issues/378#issuecomment-524411147

Cheers,
Nathan
