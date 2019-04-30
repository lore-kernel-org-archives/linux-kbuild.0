Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40922 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3Jd6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 05:33:58 -0400
Date: Tue, 30 Apr 2019 02:33:52 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Message-ID: <20190430093352.GA16941@archlinux-i9>
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > point, it has not been used because -Wuninitialized has been disabled,
> > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > on finding some bugs [1]. In my experience, it appears to be more
> > accurate than GCC and catch some things that GCC can't.
> >
> > All of these warnings have now been fixed in -next across arm, arm64,
> > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > to prevent more from easily creeping in.
> >
> > As of next-20190429:
> >
> > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > 45
> >
> > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > Masahiro, I am not sure how you want to handle merging this with regards
> > to all of the patches floating around in -next but I wanted to send this
> > out to let everyone know this is ready to be turned on.
> >
> > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > randconfigs?
> 
> No, I don't see any with the patches that I submitted. I haven't checked
> if there are any that still need to get merged into linux-next though.
> 
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 768306add591..f4332981ea85 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> >  endif
> >  endif
> 
> This doesn't look right. Shouldn't you remove the line that turns off
> -Wuninitilized
> instead of adding only -Wsometimes-uninitialized?

Well, there are still some outstanding issues with -Wuninitialized
right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
add warnings to the build but if you feel strongly, we could turn it on
then fix them after.

Nathan

> 
> If we warn about the instances that may or may not be wrong, we should
> also warn about those that are provably wrong.
> 
>         Arnd
