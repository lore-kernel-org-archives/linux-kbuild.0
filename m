Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36643 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728996AbfBKTf2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:35:28 -0500
Received: by mail-pl1-f194.google.com with SMTP id g9so39298plo.3
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com> <20190208055059.GD9647@archlinux-ryzen>
 <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com>
 <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com> <CA+icZUV2NnXQxu57PeQgOjiQm_LMjfDKY+AJKn-K9i7gG6PAfQ@mail.gmail.com>
In-Reply-To: <CA+icZUV2NnXQxu57PeQgOjiQm_LMjfDKY+AJKn-K9i7gG6PAfQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Feb 2019 11:30:01 -0800
Message-ID: <CAKwvOdkapB7Epiv=X7rWSF5qD7R=F3JfgbdnT2UrhhA3Jt2b1g@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Feb 11, 2019 at 8:05 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Feb 11, 2019 at 4:33 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> [ ... ]
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/342
> > > > > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > > > ---
> > > > >  Makefile | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/Makefile b/Makefile
> > > > > index 0eae4277206e..6307c17259ea 100644
> > > > > --- a/Makefile
> > > > > +++ b/Makefile
> > > > > @@ -502,6 +502,9 @@ endif
> > > > >  CLANG_FLAGS  += -no-integrated-as
> > > > >  KBUILD_CFLAGS        += $(CLANG_FLAGS)
> > > > >  KBUILD_AFLAGS        += $(CLANG_FLAGS)
> > > > > +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> > > > > +CLANG_FLAGS  += -fuse-ld=lld
> > >
> > > Sorry, Sedat reports [0] that this is not quite correct; if $(LD)
> > > matches LLD, then we need to set -fuse-ld=$(LD), not -fuse-ld=lld,
> > > since you may have lld installed as lld-7 or lld-8, for example:
> > > https://github.com/ClangBuiltLinux/linux/issues/358
> >
> >
> > Hmm, $(LD) might be a full path.
> >
> > Looks like Clang can take a full-path for -fuse-ld=,
> > but does it work for GCC?
> >
>
> Nope. GCC expects "-fuse-ld={bfd,gold,lld} ".
> Adding suffix "$-VER" was not recognized while building a
> llvm-toolchain, so I guess this will be the same for the Linux kernel
> side.

Well for now, let's add support for just `ld.lld` since a build of
llvm will create such a symlink.  If folks really need to
differentiate between different versions of lld, let's cross that
bridge when we get there.
-- 
Thanks,
~Nick Desaulniers
