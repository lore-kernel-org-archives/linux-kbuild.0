Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32848 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbfBKQFg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 11:05:36 -0500
MIME-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com> <20190208055059.GD9647@archlinux-ryzen>
 <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com> <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Mon, 11 Feb 2019 17:05:22 +0100
Message-ID: <CA+icZUV2NnXQxu57PeQgOjiQm_LMjfDKY+AJKn-K9i7gG6PAfQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Feb 11, 2019 at 4:33 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
[ ... ]
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/342
> > > > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > ---
> > > >  Makefile | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 0eae4277206e..6307c17259ea 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -502,6 +502,9 @@ endif
> > > >  CLANG_FLAGS  += -no-integrated-as
> > > >  KBUILD_CFLAGS        += $(CLANG_FLAGS)
> > > >  KBUILD_AFLAGS        += $(CLANG_FLAGS)
> > > > +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> > > > +CLANG_FLAGS  += -fuse-ld=lld
> >
> > Sorry, Sedat reports [0] that this is not quite correct; if $(LD)
> > matches LLD, then we need to set -fuse-ld=$(LD), not -fuse-ld=lld,
> > since you may have lld installed as lld-7 or lld-8, for example:
> > https://github.com/ClangBuiltLinux/linux/issues/358
>
>
> Hmm, $(LD) might be a full path.
>
> Looks like Clang can take a full-path for -fuse-ld=,
> but does it work for GCC?
>

Nope. GCC expects "-fuse-ld={bfd,gold,lld} ".
Adding suffix "$-VER" was not recognized while building a
llvm-toolchain, so I guess this will be the same for the Linux kernel
side.

- Sedat -

[1] https://gcc.gnu.org/onlinedocs/gcc/Link-Options.html
[2] https://github.com/ClangBuiltLinux/linux/issues/358
