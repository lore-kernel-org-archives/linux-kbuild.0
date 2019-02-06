Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37015 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726727AbfBFRc2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Feb 2019 12:32:28 -0500
Received: by mail-lj1-f193.google.com with SMTP id r10-v6so1086032ljj.4
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Feb 2019 09:32:26 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id g70-v6sm3921502ljg.92.2019.02.06.09.32.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Feb 2019 09:32:24 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id f5so5942673lfc.13
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Feb 2019 09:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20190201210853.244043-1-jflat@chromium.org> <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
 <20190206164528.GA8925@archlinux-ryzen>
In-Reply-To: <20190206164528.GA8925@archlinux-ryzen>
From: Jon Flatley <jflat@chromium.org>
Date: Wed, 6 Feb 2019 09:32:12 -0800
Message-ID: <CACJJ=pyLqhrxka2jXtby9CUqsAr=-_oQUraH5ua3PZpgXHgdOQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, jflat@chromium.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>

On Wed, Feb 6, 2019 at 8:45 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Feb 05, 2019 at 05:26:05PM +0900, Masahiro Yamada wrote:
> > On Sat, Feb 2, 2019 at 6:10 AM <jflat@chromium.org> wrote:
> > >
> > > From: Jon Flatley <jflat@chromium.org>
> > >
> > > gcc produces format warnings that clang suppresses. To keep behavior
> > > consistent between gcc and clang, don't suppress format warnings in
> > > clang.
> > >
> > > Signed-off-by: Jon Flatley <jflat@chromium.org>
> > > ---
> >
> > Applied to linux-kbuild.
> > Thanks.
> >
> >
>
> Hi Jon and Masahiro,
>
> Just as a heads up, this introduces a ton of warnings (duh). Isn't the
> typical plan behind turning on warnings that were disabled to build with
> 'W=', fix them all, then turn them on so as not to pollute the build?
>
> Log file: https://gist.github.com/443db156e56cd3c0f6b21d9d77728d80
>
> Note a big chunk of them come from one scnprintf call in
> include/linux/usb/wusb.h but still, there are many other warnings that
> make quite a bit of noise. Some seem relatively easy to fix, which I
> suppose I will try to tackle soon.
>
> Thanks,
> Nathan
>

Hi Nathan,

This was definitely not my intention.
I noticed the added warnings this morning and was considering calling
for a revert on this patch.

The intent was to match the behavior of gcc, as it has -Wformat enabled.
It was rather naive of me to assume the behavior of -Wformat would be
the same in both gcc and clang.
Indeed, it seems gcc is more permissive about what format
substitutions it allows.

For example passing int to the "%hu" format specifier is fine in gcc
under -Wformat but produces a warning in clang.
Maybe this was the motivation for adding -Wno-format to clang in the
first place.
This difference is puzzling to me, and I wonder if it's by design.

Considering the whole point of this patch was to sync up this behavior
between gcc and clang I am OK with reverting this.

Thanks,
Jon

> >
> >
> > >  scripts/Makefile.extrawarn | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > index 768306add591..94daf4e1fc73 100644
> > > --- a/scripts/Makefile.extrawarn
> > > +++ b/scripts/Makefile.extrawarn
> > > @@ -68,7 +68,6 @@ else
> > >  ifdef CONFIG_CC_IS_CLANG
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > > --
> > > 2.20.1.611.gfbb209baf1-goog
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
