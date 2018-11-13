Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:44720 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbeKMPNt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Nov 2018 10:13:49 -0500
MIME-Version: 1.0
References: <20181112042116.5271-1-joel@jms.id.au> <20181112042116.5271-2-joel@jms.id.au>
 <CAKwvOdnBMFYXvS+GH0cUiczgkpLWtBinPRjkTJBQGrKjxktUUg@mail.gmail.com>
In-Reply-To: <CAKwvOdnBMFYXvS+GH0cUiczgkpLWtBinPRjkTJBQGrKjxktUUg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Nov 2018 14:16:40 +0900
Message-ID: <CAK7LNASE=xCaE-q_Jke5aDd9aF=dJ+ThUjORLa0i_m3e6UzUig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: Export clang toolchain variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Joel Stanley <joel@jms.id.au>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, dja@axtens.net, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Tue, Nov 13, 2018 at 3:56 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Nov 11, 2018 at 8:21 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > The powerpc makefile will use these in it's boot wrapper.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 09278330282d..840efe6eb54c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -495,6 +495,7 @@ endif
> >  ifneq ($(GCC_TOOLCHAIN),)
> >  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
> > +export CLANG_FLAGS
> >  CLANG_FLAGS    += -no-integrated-as
>
> Does this export CLANG_FLAGS before `-no-integrated-as` is set?

This does not matter.

For example, KBUILD_CFLAGS accumulates several compiler flags
after it is marked as 'export'.


> Either way, I think it would be clearer to export this after all the
> relevant flags are set.

OK. It is just a matter of preference,
but I will move the export line below
when I pick up this patch set.



> >  KBUILD_CFLAGS  += $(CLANG_FLAGS)
> >  KBUILD_AFLAGS  += $(CLANG_FLAGS)
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
