Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48446 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbfBKPdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 10:33:39 -0500
MIME-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com> <20190208055059.GD9647@archlinux-ryzen>
 <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com>
In-Reply-To: <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 12 Feb 2019 00:32:55 +0900
Message-ID: <CAK7LNAQD=ZVcbn3cz2bcW0KrkL9ZOU44SHrmf2aRZwhYdmQrqQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>

On Sat, Feb 9, 2019 at 2:27 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Feb 7, 2019 at 9:51 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, Feb 07, 2019 at 02:01:51PM -0800, ndesaulniers@google.com wrote:
> > > This is needed because clang doesn't select which linker to use based on
> > > $LD but rather -fuse-ld=$(LD). This is problematic especially for
> > > cc-ldoption, which checks for linker flag support via invoking the
> > > compiler, rather than the linker.

What do you mean by 'problematic' ?

I see no build error in
arch/arm64/kernel/vdso/Makefile, at least.

Clang uses BFD linker by default,
which may not match to the $(LD) passed in.

Is this what you mean?





> > > Link: https://github.com/ClangBuiltLinux/linux/issues/342
> > > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  Makefile | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 0eae4277206e..6307c17259ea 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -502,6 +502,9 @@ endif
> > >  CLANG_FLAGS  += -no-integrated-as
> > >  KBUILD_CFLAGS        += $(CLANG_FLAGS)
> > >  KBUILD_AFLAGS        += $(CLANG_FLAGS)
> > > +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> > > +CLANG_FLAGS  += -fuse-ld=lld
>
> Sorry, Sedat reports [0] that this is not quite correct; if $(LD)
> matches LLD, then we need to set -fuse-ld=$(LD), not -fuse-ld=lld,
> since you may have lld installed as lld-7 or lld-8, for example:
> https://github.com/ClangBuiltLinux/linux/issues/358


Hmm, $(LD) might be a full path.

Looks like Clang can take a full-path for -fuse-ld=,
but does it work for GCC?






> > > +endif
> >
> > This section needs to be moved up above KBUILD_CFLAGS otherwise it never
> > actually gets passed along.
> >
> > With that change, please add:
> >
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > >  export CLANG_FLAGS
> > >  endif
> > >
> > > --
> > > 2.20.1.791.gb4d0f1c61a-goog
> > >
>
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
