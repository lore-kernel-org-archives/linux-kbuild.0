Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33485 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfDBH4J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Apr 2019 03:56:09 -0400
Date: Tue, 2 Apr 2019 00:56:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3] Makefile: lld: tell clang to use lld
Message-ID: <20190402075603.GA5308@archlinux-ryzen>
References: <CAK7LNAQw7nPwykOEV5i+yWjkxzgf1gPa5ewFhDxbbn8XXjwFUA@mail.gmail.com>
 <20190402070858.49597-1-ndesaulniers@google.com>
 <CA+icZUUgvw7G0rrrhLL0KGXgeuPAxnSAQCopqWrqAAXvjSK=Yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUUgvw7G0rrrhLL0KGXgeuPAxnSAQCopqWrqAAXvjSK=Yw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Kees Cook <keescook@chromium.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 02, 2019 at 09:52:13AM +0200, Sedat Dilek wrote:
> On Tue, Apr 2, 2019 at 9:09 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > This is needed because clang doesn't select which linker to use based on
> > $LD but rather -fuse-ld={bfd,gold,lld,<absolute path to linker>}.  This
> > is problematic especially for cc-ldoption, which checks for linker flag
> > support via invoking the compiler, rather than the linker.
> >
> > Select the linker via absolute path from $PATH via `which`. This allows
> > you to build with:
> >
> > $ make LD=ld.lld
> > $ make LD=ld.lld-8
> > $ make LD=/path/to/ld.lld
> >
> > Add -Qunused-arguments to KBUILD_CPPFLAGS when using LLD, as otherwise
> > Clang likes to complain about -fuse-lld= being unused when compiling but
> > not linking (-c) such as when cc-option is used.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/342
> > Link: https://github.com/ClangBuiltLinux/linux/issues/366
> > Link: https://github.com/ClangBuiltLinux/linux/issues/357
> > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> Thanks for bringing this up again, Nick.
> 
> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com> (see [1]).
> 
> I suggest to do a separate patch on the move of  "KBUILD_CPPFLAGS +=
> -Qunused-arguments".

I think it makes sense to do it all in one patch as it doesn't make much
sense to do the move without this change. Nick already sent a v4 doing
this.

Cheers,
Nathan

> ( Patch was attached in [2],[3]. )
> 
> As pointed by Nathan this needs the removal in the original code-block.
> 
> Other than that:
> 
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> 
> [1] https://github.com/ClangBuiltLinux/linux/issues/366#issuecomment-466836735
> [2] https://github.com/ClangBuiltLinux/linux/issues/366#issuecomment-467118373
> [3] https://github.com/ClangBuiltLinux/linux/files/2901865/kbuild-clang-lld-Move-Qunused-arguments-CPPFLAGS-patch.txt
> 
> > ---
> > Changes V2->V3:
> > * Use absolute path based on `which $LD` as per Masahiro.
> > * Add -Qunused-arguments.
> > * Drop tested-by/reviewed-by tags, since this patched has changed enough
> >   to warrant re-testing/re-review, IMO.
> > * Add more info to the commit message.
> > Changes V1->V2:
> > * add reviewed and tested by tags.
> > * move this addition up 2 statments so that it's properly added to
> >   KBUILD_*FLAGS as per Nathan.
> >
> >  Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 026fbc450906..895c076b6305 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -514,6 +514,10 @@ ifneq ($(GCC_TOOLCHAIN),)
> >  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
> >  CLANG_FLAGS    += -no-integrated-as
> > +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> > +CLANG_FLAGS    += -fuse-ld=$(shell which $(LD))
> > +KBUILD_CPPFLAGS += -Qunused-arguments
> > +endif
> >  KBUILD_CFLAGS  += $(CLANG_FLAGS)
> >  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> >  export CLANG_FLAGS
> > --
> > 2.21.0.392.gf8f6787159e-goog
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To post to this group, send email to clang-built-linux@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190402070858.49597-1-ndesaulniers%40google.com.
> > For more options, visit https://groups.google.com/d/optout.
