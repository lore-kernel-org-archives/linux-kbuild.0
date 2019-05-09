Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43205 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfEILkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:40:35 -0400
Date: Thu, 9 May 2019 04:40:30 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Message-ID: <20190509114030.GA7556@archlinux-i9>
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
 <20190509111534.GA32696@archlinux-i9>
 <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 09, 2019 at 08:35:05PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Thu, May 9, 2019 at 8:15 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, May 09, 2019 at 03:44:55PM +0900, Masahiro Yamada wrote:
> > > We do not support old Clang versions. Upgrade your clang version
> > > if any of these flags is unsupported.
> > >
> > > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > > except -fcatch-undefined-behavior.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > >  Makefile                   | 10 +++++-----
> > >  scripts/Makefile.extrawarn | 12 ++++++------
> > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index bd7ae11947cb..c71ffb6f55b5 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> > >  KBUILD_CFLAGS += $(stackp-flags-y)
> > >
> > >  ifdef CONFIG_CC_IS_CLANG
> > > -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> > > +KBUILD_CPPFLAGS += -Qunused-arguments
> > > +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> > > +KBUILD_CFLAGS += -Wno-gnu
> > >  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> > > +KBUILD_CFLAGS += -Wno-tautological-compare
> > >  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> > >  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> > >  # See modpost pattern 2
> > > -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> > > +KBUILD_CFLAGS += -mno-global-merge
> > >  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
> >
> > I think we should just remove this, I'm fairly confident the kernel
> > can't be reliably compiled with anything earlier than Clang 4 (Pixel 2
> > was shipped with it but had some hacks, this commit is from Clang 3.5):
> >
> > https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
> 
> 
> Oh, I did not know this was deprecated.
> 
> Could you send a patch to remove it
> with filling the commit log ?

Sure!

> 
> 
> Thanks.
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNASpsid7_sh4rdRNSTwZ1YtW_%2BuH2eoarJNNUttntQZ-kg%40mail.gmail.com.
> For more options, visit https://groups.google.com/d/optout.
