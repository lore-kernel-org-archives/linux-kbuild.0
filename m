Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:48465 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKESiE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 13:38:04 -0500
MIME-Version: 1.0
References: <1541386099-13118-1-git-send-email-yamada.masahiro@socionext.com> <a55e4534ef759585088a037e4cfd8468@agner.ch>
In-Reply-To: <a55e4534ef759585088a037e4cfd8468@agner.ch>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Nov 2018 18:18:25 +0900
Message-ID: <CAK7LNAT3ftcuNDfEhecMnfjG0Fkkh42wR7XQ1R9Tkr9OMrzAng@mail.gmail.com>
Subject: Re: [PATCH] kbuild: consolidate Clang compiler flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Joel Stanley <joel@jms.id.au>, dja@axtens.net, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 5, 2018 at 6:10 PM Stefan Agner <stefan@agner.ch> wrote:
>
> On 05.11.2018 03:48, Masahiro Yamada wrote:
> > Add basic options for Clang such as --target, --prefix, --gcc-toolchain,
> > -no-integrated-as to a single variable CLANG_FLAGS.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 93315eb..58c838a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -487,18 +487,17 @@ endif
> >
> >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> >  ifneq ($(CROSS_COMPILE),)
> > -CLANG_TARGET := --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +CLANG_FLAGS  = --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> > -CLANG_PREFIX := --prefix=$(GCC_TOOLCHAIN_DIR)
> > +CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)
>
> So this will expand later now, is this ok?
>
> --
> Stefan
>
> >  GCC_TOOLCHAIN        := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> >  endif
> >  ifneq ($(GCC_TOOLCHAIN),)
> > -CLANG_GCC_TC := --gcc-toolchain=$(GCC_TOOLCHAIN)
> > +CLANG_FLAGS  += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
> > -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> > -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> > -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> > -KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> > +CLANG_FLAGS  += $(call cc-option, -no-integrated-as)
> > +KBUILD_CFLAGS        += $(CLANG_FLAGS)
> > +KBUILD_AFLAGS        += $(CLANG_FLAGS)


CLANG_FLAGS is expanded here because KBUILD_CFLAGS and KBUILD_AFLAGS
are defined by using :=

So, it should be OK, but turning CLANG_FLAGS into a simple variable
will be a little more efficient since $(call cc-option, -no-integrated-as)
is evaluated just once.

(Or, this cc-option may not be necessary any longer.)

Will send v2.


Thanks.




> >  endif
> >
> >  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern
> > -mindirect-branch-register



-- 
Best Regards
Masahiro Yamada
