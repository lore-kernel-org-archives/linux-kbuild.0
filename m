Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38934 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfCOPhV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 11:37:21 -0400
MIME-Version: 1.0
References: <20190314234159.191745-1-dianders@chromium.org> <CAK7LNATa+TnXb+a6on-sx2mjNoAiORe-WeZ8UusETHdSrXowuw@mail.gmail.com>
In-Reply-To: <CAK7LNATa+TnXb+a6on-sx2mjNoAiORe-WeZ8UusETHdSrXowuw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Mar 2019 00:36:34 +0900
Message-ID: <CAK7LNAT=04WAMEfN7u5N_oO2RwT9bYALMN3SZ3WFQo-=3vEjsQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Make NOSTDINC_FLAGS a simply expanded variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Mar 16, 2019 at 12:27 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Mar 15, 2019 at 8:42 AM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > During a simple no-op (nothing changed) build I saw 39 invocations of
> > the C compiler with the argument "-print-file-name=include".  We don't
> > need to call the C compiler 39 times for this--one time will suffice.
> >
> > Let's change NOSTDINC_FLAGS to a simply expanded variable to avoid
> > this since there doesn't appear to be any reason it should be
> > recursively expanded.
> >
> > On my build this shaved ~400 ms off my "no-op" build.
> >
> > Note that the recursive expansion seems to date back to the (really
> > old) commit e8f5bdb02ce0 ("[PATCH] Makefile include path ordering").
> > It's a little unclear to me if the point of that patch was to switch
> > the variable to be recursively expanded (which it did) or to avoid
> > directly assigning to NOSTDINC_FLAGS (AKA to switch to +=) because
> > someone else (out of tree?) was setting it.  I presume later since if
> > the only goal was to switch to recursive expansion the patch would
> > have just removed the ":".
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Applied to linux-kbuild.
> Thanks.


BTW, I noticed no one else
appends NOSTDINC_FLAGS.


So, does it make more sense to do as follows?


NOSTDINC_FLAGS := -nostdinc -isystem $(shell $(CC) -print-file-name=include)






>
>
> > ---
> >
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9ef547fc7ffe..3034ba66ad51 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -402,7 +402,7 @@ CHECK               = sparse
> >
> >  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
> >                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> > -NOSTDINC_FLAGS  =
> > +NOSTDINC_FLAGS :=
> >  CFLAGS_MODULE   =
> >  AFLAGS_MODULE   =
> >  LDFLAGS_MODULE  =
> > --
> > 2.21.0.360.g471c308f928-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
