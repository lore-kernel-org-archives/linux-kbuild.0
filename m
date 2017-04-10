Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:33318 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752817AbdDJSII (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Apr 2017 14:08:08 -0400
Received: by mail-pf0-f178.google.com with SMTP id s16so36884574pfs.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Apr 2017 11:08:08 -0700 (PDT)
Date: Mon, 10 Apr 2017 11:08:04 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] kbuild: use -Oz instead of -Os when using clang
Message-ID: <20170410180804.GA28657@google.com>
References: <20170328011909.150513-1-mka@chromium.org>
 <CAK7LNATU+JNx2eZCTuqyws=CQL3Z2p6QJ7Oa0DNMvxbNJNH4Jg@mail.gmail.com>
 <20170330164106.GA2130@google.com>
 <CAK7LNARe61sBVL=zs7kb4BT5UgkBCYdKWa+esWZnT=j3idDdNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARe61sBVL=zs7kb4BT5UgkBCYdKWa+esWZnT=j3idDdNw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Greg Hackmann <ghackmann@google.com>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Masahiro,

El Fri, Mar 31, 2017 at 02:57:43AM +0900 Masahiro Yamada ha dit:

> 2017-03-31 1:41 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > El Fri, Mar 31, 2017 at 01:03:02AM +0900 Masahiro Yamada ha dit:
> >
> >> 2017-03-28 10:19 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> >> > This generates smaller resulting object code when compiled with clang.
> >> >
> >> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> >> > ---
> >> >  Makefile | 3 ++-
> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/Makefile b/Makefile
> >> > index b2faa9319372..66bcdbf58371 100644
> >> > --- a/Makefile
> >> > +++ b/Makefile
> >> > @@ -638,7 +638,8 @@ KBUILD_CFLAGS       += $(call cc-option,-fdata-sections,)
> >> >  endif
> >> >
> >> >  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> >> > -KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)
> >> > +KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> >> > +KBUILD_CFLAGS  += $(call cc-disable-warning,maybe-uninitialized,)
> >> >  else
> >> >  ifdef CONFIG_PROFILE_ALL_BRANCHES
> >> >  KBUILD_CFLAGS  += -O2 $(call cc-disable-warning,maybe-uninitialized,)
> >> >
> >>
> >>
> >>
> >> This is the same as the following commit in LLVMLinux
> >> except Author/Signed-off-by.
> >>
> >> Who should the authorship really belong to?
> >
> > (this time without html, sorry for the noise)
> >
> > It should belong to Behan, I missed to add a 'From' tag, sorry about
> > that. Should I resend with the tag or can you fix it when applying the
> > patch?
> 
> 
> No need to re-send it.  I can fixup it manually.

I couldn't locate this patch in your tree, has it been picked up?

Thanks

Matthias
