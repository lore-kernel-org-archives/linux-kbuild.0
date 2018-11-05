Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33023 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387652AbeKFDUK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 22:20:10 -0500
Received: by mail-pf1-f195.google.com with SMTP id v68-v6so1201040pfk.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2018 09:59:21 -0800 (PST)
MIME-Version: 1.0
References: <1541386099-13118-1-git-send-email-yamada.masahiro@socionext.com>
 <a55e4534ef759585088a037e4cfd8468@agner.ch> <CAK7LNAT3ftcuNDfEhecMnfjG0Fkkh42wR7XQ1R9Tkr9OMrzAng@mail.gmail.com>
In-Reply-To: <CAK7LNAT3ftcuNDfEhecMnfjG0Fkkh42wR7XQ1R9Tkr9OMrzAng@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 5 Nov 2018 09:59:09 -0800
Message-ID: <CAKwvOdn1Shqc3nW6z0Ji_=4uMrOimhUbX3TRG7fQuysja64zog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: consolidate Clang compiler flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stefan Agner <stefan@agner.ch>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, joel@jms.id.au, dja@axtens.net, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Nov 5, 2018 at 1:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Mon, Nov 5, 2018 at 6:10 PM Stefan Agner <stefan@agner.ch> wrote:
> >
> > On 05.11.2018 03:48, Masahiro Yamada wrote:
> > > Add basic options for Clang such as --target, --prefix, --gcc-toolchain,
> > > -no-integrated-as to a single variable CLANG_FLAGS.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > >  Makefile | 13 ++++++-------
> > >  1 file changed, 6 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 93315eb..58c838a 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -487,18 +487,17 @@ endif
> > >
> > >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> > >  ifneq ($(CROSS_COMPILE),)
> > > -CLANG_TARGET := --target=$(notdir $(CROSS_COMPILE:%-=%))
> > > +CLANG_FLAGS  = --target=$(notdir $(CROSS_COMPILE:%-=%))
> > >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> > > -CLANG_PREFIX := --prefix=$(GCC_TOOLCHAIN_DIR)
> > > +CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)
> >
> > So this will expand later now, is this ok?
> >
> > --
> > Stefan
> >
> > >  GCC_TOOLCHAIN        := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > >  endif
> > >  ifneq ($(GCC_TOOLCHAIN),)
> > > -CLANG_GCC_TC := --gcc-toolchain=$(GCC_TOOLCHAIN)
> > > +CLANG_FLAGS  += --gcc-toolchain=$(GCC_TOOLCHAIN)
> > >  endif
> > > -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> > > -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> > > -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> > > -KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> > > +CLANG_FLAGS  += $(call cc-option, -no-integrated-as)
> > > +KBUILD_CFLAGS        += $(CLANG_FLAGS)
> > > +KBUILD_AFLAGS        += $(CLANG_FLAGS)
>
>
> CLANG_FLAGS is expanded here because KBUILD_CFLAGS and KBUILD_AFLAGS
> are defined by using :=
>
> So, it should be OK, but turning CLANG_FLAGS into a simple variable
> will be a little more efficient since $(call cc-option, -no-integrated-as)
> is evaluated just once.
>
> (Or, this cc-option may not be necessary any longer.)
>
> Will send v2.

If the ultimate goal is not evaluate cc-option more than once,
removing cc-option from both KBUILD_CFLAGS and KBUILD_AFLAGS for clang
is the better approach; we always want those for clang
unconditionally. And if you by chance have an ancient version of clang
that doesn't support those flags, you wont be able to compile a kernel
anyways.  Eventually we want to get Clang's integrated assembler in
shape to be used to assemble the kernel, but I think we're a ways off
there still.


-- 
Thanks,
~Nick Desaulniers
