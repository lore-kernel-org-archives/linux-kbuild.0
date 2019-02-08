Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45174 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfBHRp6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 12:45:58 -0500
Date: Fri, 8 Feb 2019 10:45:53 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Message-ID: <20190208174553.GA14762@archlinux-ryzen>
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com>
 <20190208055059.GD9647@archlinux-ryzen>
 <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=ytsXYDzVZHUEjokHmW5kpqmCq4cnToOFJ4gwz8j7W=Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, sedat.dilek@gmail.com

On Fri, Feb 08, 2019 at 09:27:19AM -0800, Nick Desaulniers wrote:
> On Thu, Feb 7, 2019 at 9:51 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, Feb 07, 2019 at 02:01:51PM -0800, ndesaulniers@google.com wrote:
> > > This is needed because clang doesn't select which linker to use based on
> > > $LD but rather -fuse-ld=$(LD). This is problematic especially for
> > > cc-ldoption, which checks for linker flag support via invoking the
> > > compiler, rather than the linker.
> > >
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
> 

We'll need to make sure that it is compatible with the way that Clang
expects arguments to '-fuse-ld=' because it looks like 'ld.' is
automatically appended.

https://github.com/llvm/llvm-project/blob/5be3dbdb082ffba4f846e3572ea802d156dd8d34/clang/lib/Driver/ToolChain.cpp#L438-L468

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
