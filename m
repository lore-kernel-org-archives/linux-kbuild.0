Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34516 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfEIRRg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 13:17:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id w7so1467270plz.1
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 10:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com> <20190509111534.GA32696@archlinux-i9>
In-Reply-To: <20190509111534.GA32696@archlinux-i9>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 9 May 2019 10:17:23 -0700
Message-ID: <CAKwvOd=3UqmwDpKyUGj6gH_TwWc=JeEKdwAi=-AhFvRBGc1ncg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

> On Thu, May 09, 2019 at 03:44:55PM +0900, Masahiro Yamada wrote:
> > We do not support old Clang versions. Upgrade your clang version
> > if any of these flags is unsupported.
> >
> > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > except -fcatch-undefined-behavior.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  Makefile                   | 10 +++++-----
> >  scripts/Makefile.extrawarn | 12 ++++++------
> >  2 files changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index bd7ae11947cb..c71ffb6f55b5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> >  KBUILD_CFLAGS += $(stackp-flags-y)
> >
> >  ifdef CONFIG_CC_IS_CLANG
> > -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> > +KBUILD_CPPFLAGS += -Qunused-arguments
> > +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> > +KBUILD_CFLAGS += -Wno-gnu
> >  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> > -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> > +KBUILD_CFLAGS += -Wno-tautological-compare
> >  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> >  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> >  # See modpost pattern 2
> > -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> > +KBUILD_CFLAGS += -mno-global-merge
> >  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>
> I think we should just remove this, I'm fairly confident the kernel
> can't be reliably compiled with anything earlier than Clang 4 (Pixel 2
> was shipped with it but had some hacks, this commit is from Clang 3.5):

Yeah, clang-4 is usually what I test these with, as that's the
earliest known version of Clang that I ever had success with.
Hopefully a lot of things will stabilize for the clang-9 release.

Anyways, I checked these all w/ godbolt w/ clang-4.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
>
> Otherwise:
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> >  else
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 768306add591..523c4cafe2dc 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
> >  else
> >
> >  ifdef CONFIG_CC_IS_CLANG
> > -KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > +KBUILD_CFLAGS += -Wno-initializer-overrides
> > +KBUILD_CFLAGS += -Wno-unused-value
> > +KBUILD_CFLAGS += -Wno-format
> > +KBUILD_CFLAGS += -Wno-sign-compare
> > +KBUILD_CFLAGS += -Wno-format-zero-length
> > +KBUILD_CFLAGS += -Wno-uninitialized
> >  endif
> >  endif
> > --
> > 2.17.1
> >



-- 
Thanks,
~Nick Desaulniers
