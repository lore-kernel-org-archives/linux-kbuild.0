Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46251 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbfBKT0N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:26:13 -0500
Received: by mail-pg1-f193.google.com with SMTP id w7so2064pgp.13
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com> <20190208055059.GD9647@archlinux-ryzen>
In-Reply-To: <20190208055059.GD9647@archlinux-ryzen>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 11 Feb 2019 11:26:00 -0800
Message-ID: <CAKwvOdnSStbZ35RqSoy-B8sdx+MCR867gKTu4UA5g8wvUHwVFw@mail.gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Feb 7, 2019 at 9:51 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Feb 07, 2019 at 02:01:51PM -0800, ndesaulniers@google.com wrote:
> > This is needed because clang doesn't select which linker to use based on
> > $LD but rather -fuse-ld=$(LD). This is problematic especially for
> > cc-ldoption, which checks for linker flag support via invoking the
> > compiler, rather than the linker.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/342
> > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 0eae4277206e..6307c17259ea 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -502,6 +502,9 @@ endif
> >  CLANG_FLAGS  += -no-integrated-as
> >  KBUILD_CFLAGS        += $(CLANG_FLAGS)
> >  KBUILD_AFLAGS        += $(CLANG_FLAGS)
> > +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> > +CLANG_FLAGS  += -fuse-ld=lld
> > +endif
>
> This section needs to be moved up above KBUILD_CFLAGS otherwise it never
> actually gets passed along.

Great catch! I had that correct in my Pixel kernel patches; messed
that up forward porting them.  Included in v2 (sending imminently).

-- 
Thanks,
~Nick Desaulniers
