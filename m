Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41835 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfBFQpd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Feb 2019 11:45:33 -0500
Date: Wed, 6 Feb 2019 09:45:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Message-ID: <20190206164528.GA8925@archlinux-ryzen>
References: <20190201210853.244043-1-jflat@chromium.org>
 <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: jflat@chromium.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Feb 05, 2019 at 05:26:05PM +0900, Masahiro Yamada wrote:
> On Sat, Feb 2, 2019 at 6:10 AM <jflat@chromium.org> wrote:
> >
> > From: Jon Flatley <jflat@chromium.org>
> >
> > gcc produces format warnings that clang suppresses. To keep behavior
> > consistent between gcc and clang, don't suppress format warnings in
> > clang.
> >
> > Signed-off-by: Jon Flatley <jflat@chromium.org>
> > ---
> 
> Applied to linux-kbuild.
> Thanks.
> 
> 

Hi Jon and Masahiro,

Just as a heads up, this introduces a ton of warnings (duh). Isn't the
typical plan behind turning on warnings that were disabled to build with
'W=', fix them all, then turn them on so as not to pollute the build?

Log file: https://gist.github.com/443db156e56cd3c0f6b21d9d77728d80

Note a big chunk of them come from one scnprintf call in
include/linux/usb/wusb.h but still, there are many other warnings that
make quite a bit of noise. Some seem relatively easy to fix, which I
suppose I will try to tackle soon.

Thanks,
Nathan

> 
> 
> >  scripts/Makefile.extrawarn | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > index 768306add591..94daf4e1fc73 100644
> > --- a/scripts/Makefile.extrawarn
> > +++ b/scripts/Makefile.extrawarn
> > @@ -68,7 +68,6 @@ else
> >  ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> > -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > --
> > 2.20.1.611.gfbb209baf1-goog
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
