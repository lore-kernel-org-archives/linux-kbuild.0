Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60359 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbeKNJ1U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 04:27:20 -0500
MIME-Version: 1.0
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-3-joel@jms.id.au>
 <CAKwvOd=Sck9MMyq4sBe24iNbcVd=KX7enfxN=+Y7uvL-YrxHrg@mail.gmail.com>
In-Reply-To: <CAKwvOd=Sck9MMyq4sBe24iNbcVd=KX7enfxN=+Y7uvL-YrxHrg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Nov 2018 08:25:56 +0900
Message-ID: <CAK7LNARF0vKwY7WxjZWPyJxJByqU_a_Fz0NSbny=K=FL9nDZ6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/boot: Set target when cross-compiling for clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, dja@axtens.net, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, Nov 13, 2018 at 4:03 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Nov 11, 2018 at 8:21 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > Clang needs to be told which target it is building for when cross
> > compiling.
>
> Neat! This will help us for continuous integration.
> https://github.com/ClangBuiltLinux/continuous-integration
>
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/259
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Assuming patch 1/2 gets fixed up (or is fine) and doesn't radically change:
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>



Applied to linux-kbuild.
Thanks!



> > ---
> >  arch/powerpc/boot/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
> > index 39354365f54a..111f97b1ccec 100644
> > --- a/arch/powerpc/boot/Makefile
> > +++ b/arch/powerpc/boot/Makefile
> > @@ -55,6 +55,11 @@ BOOTAFLAGS   := -D__ASSEMBLY__ $(BOOTCFLAGS) -traditional -nostdinc
> >
> >  BOOTARFLAGS    := -cr$(KBUILD_ARFLAGS)
> >
> > +ifdef CONFIG_CC_IS_CLANG
> > +BOOTCFLAGS += $(CLANG_FLAGS)
> > +BOOTAFLAGS += $(CLANG_FLAGS)
> > +endif
> > +
> >  ifdef CONFIG_DEBUG_INFO
> >  BOOTCFLAGS     += -g
> >  endif
> > --
> > 2.19.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
