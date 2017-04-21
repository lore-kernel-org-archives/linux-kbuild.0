Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34344 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1042006AbdDUSfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 14:35:10 -0400
Received: by mail-oi0-f47.google.com with SMTP id x184so107670786oia.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 11:35:10 -0700 (PDT)
Date: Fri, 21 Apr 2017 10:27:52 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2] kbuild: Add better clang cross build support
Message-ID: <20170421172752.GK128305@google.com>
References: <20170410210904.68211-1-mka@chromium.org>
 <CAK7LNASiT1u218kOAXuc9Ai4oeFZBzxrdhBNUYHnYWF_eFTB6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNASiT1u218kOAXuc9Ai4oeFZBzxrdhBNUYHnYWF_eFTB6w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Masahiro,

Thanks for your comments.

El Fri, Apr 21, 2017 at 05:24:31PM +0900 Masahiro Yamada ha dit:

> 2017-04-11 6:09 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> 
> 
> > COMPILER is previously set to "clang" if CC=clang was set from the
> > make command line.  So -target and -gcc-toolchain can be added to CC,
> > since we already know that it is set.
> 
> Can you reword or delete this paragraph?
> I think this is confusing because COMPILER was replaced with cc-name
> by commit 5631d9c4.

Ok, I think not much is lost by deleting it.

<snip>

> > -KBUILD_CPPFLAGS := -D__KERNEL__
> > +KBUILD_CPPFLAGS := -D__KERNEL__ $(CLANG_FLAGS)
> >
> >  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> >                    -fno-strict-aliasing -fno-common \
> >                    -Werror-implicit-function-declaration \
> >                    -Wno-format-security \
> > -                  -std=gnu89 $(call cc-option,-fno-PIE)
> > -
> > +                  -std=gnu89 $(call cc-option,-fno-PIE) \
> > +                  $(CLANG_FLAGS)
> >
> >  KBUILD_AFLAGS_KERNEL :=
> >  KBUILD_CFLAGS_KERNEL :=
> > -KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE)
> > +KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE) $(CLANG_FLAGS)
> 
> 
> This adds multiple -gcc-toolchain because both KBUILD_CPPFLAGS and KBUILD_CFLAGS
> are added to c_flags.   See scripts/Makefile.lib
> 
> orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
>                  $(ccflags-y) $(CFLAGS_$(basetarget).o)
> 
> 
> Pre-processing is related to the front-end part,
> so -target and -gcc-toolchain are not necessary for KBUILD_CPPFLAGS?
> 
> Maybe, adding it to KBUILD_CFLAGS and KBUILD_AFLAGS could be enough?

Indeed it seems it is not needed in KBUILD_CPPFLAGS, at least I
encountered no issues in a x86 and arm64 build.

> Is it possible to move these to around line 700?
> 
> ifeq ($(cc-name),clang)
>    < add here ? >
> KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
> 
> I do not want to sprinkle ugly ifeq ($(cc-name,clang).

I agree, better concentrate clang specific stuff when possible.

I'll rework the patch and send out an update shortly.

Cheers

Matthias
