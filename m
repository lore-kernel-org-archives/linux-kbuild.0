Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40773 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbfCRV4H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 17:56:07 -0400
Received: by mail-pf1-f196.google.com with SMTP id c207so3196667pfc.7
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Mar 2019 14:56:06 -0700 (PDT)
Date: Mon, 18 Mar 2019 14:56:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] Revert "kbuild: use -Oz instead of -Os when using clang"
Message-ID: <20190318215605.GJ112750@google.com>
References: <CAG5bF+RvumzKK0E-GAT223jnBvkRe1RN_0J9cGpfPOqCBvfWyw@mail.gmail.com>
 <CAKwvOdnms16AC3jPcc_7MXD7QF43dKvHsi+aqmsz0wX-u1GTpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdnms16AC3jPcc_7MXD7QF43dKvHsi+aqmsz0wX-u1GTpA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, Manoj Gupta <manojgupta@chromium.org>, Tiancong Wang <tcwang@chromium.org>, Stephen Hines <srhines@google.com>, clang-built-linux@googlegroups.com

On Mon, Mar 18, 2019 at 02:47:13PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Mon, Mar 18, 2019 at 2:10 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > The clang option -Oz enables *aggressive* optimization for size,
> > which doesn't necessarily result in smaller images, but can have
> > negative impact on performance. Switch back to the less aggressive
> > -Os.
> >
> > This reverts commit 6748cb3c299de1ffbe56733647b01dbcc398c419.
> 
> Does scripts/checkpatch.pl complain about this format (full sha, no
> title)?

Nope, for reverts checkpatch is happy with it, I suppose because by
default the subject of the reverted patch is part of the revert's
subject.

> Not sure that necessitates a v2, but if so would be good to
> mention that Clang generates excessive calls into libgcc/compiler-rt
> at -Oz.  Thanks for the patch and the discussion/sanity check.

I can send a v2 if 'needed'.

> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks!

Matthias

> >
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9ef547fc7ffe..191f3ce3cb5e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -667,7 +667,7 @@ KBUILD_CFLAGS       += $(call cc-disable-warning, format-overflow)
> >  KBUILD_CFLAGS  += $(call cc-disable-warning, int-in-bool-context)
> >
> >  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> > -KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
> > +KBUILD_CFLAGS  += -Os
> >  else
> >  KBUILD_CFLAGS   += -O2
> >  endif
> 
> 
> 
