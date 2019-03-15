Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16451 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729396AbfCOQJe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 12:09:34 -0400
MIME-Version: 1.0
References: <20190314234159.191745-1-dianders@chromium.org>
 <CAK7LNATa+TnXb+a6on-sx2mjNoAiORe-WeZ8UusETHdSrXowuw@mail.gmail.com>
 <CAK7LNAT=04WAMEfN7u5N_oO2RwT9bYALMN3SZ3WFQo-=3vEjsQ@mail.gmail.com> <CAD=FV=XqH7knZwK+a+bsACwc-j2NgH914mLTc_POR_GAipVf7w@mail.gmail.com>
In-Reply-To: <CAD=FV=XqH7knZwK+a+bsACwc-j2NgH914mLTc_POR_GAipVf7w@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Mar 2019 01:08:49 +0900
Message-ID: <CAK7LNAQff3c9zUMSyj37WT_hgPQ9x7Vf-Hxnm_u0LxNwEMJ+7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Make NOSTDINC_FLAGS a simply expanded variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi,

On Sat, Mar 16, 2019 at 12:41 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Mar 15, 2019 at 8:37 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, Mar 16, 2019 at 12:27 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > On Fri, Mar 15, 2019 at 8:42 AM Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > During a simple no-op (nothing changed) build I saw 39 invocations of
> > > > the C compiler with the argument "-print-file-name=include".  We don't
> > > > need to call the C compiler 39 times for this--one time will suffice.
> > > >
> > > > Let's change NOSTDINC_FLAGS to a simply expanded variable to avoid
> > > > this since there doesn't appear to be any reason it should be
> > > > recursively expanded.
> > > >
> > > > On my build this shaved ~400 ms off my "no-op" build.
> > > >
> > > > Note that the recursive expansion seems to date back to the (really
> > > > old) commit e8f5bdb02ce0 ("[PATCH] Makefile include path ordering").
> > > > It's a little unclear to me if the point of that patch was to switch
> > > > the variable to be recursively expanded (which it did) or to avoid
> > > > directly assigning to NOSTDINC_FLAGS (AKA to switch to +=) because
> > > > someone else (out of tree?) was setting it.  I presume later since if
> > > > the only goal was to switch to recursive expansion the patch would
> > > > have just removed the ":".
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > Applied to linux-kbuild.
> > > Thanks.
> >
> >
> > BTW, I noticed no one else
> > appends NOSTDINC_FLAGS.
> >
> >
> > So, does it make more sense to do as follows?
> >
> >
> > NOSTDINC_FLAGS := -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>
> It might.  ...but go back to look at commit e8f5bdb02ce0 ("[PATCH]
> Makefile include path ordering").  Why did they do a += there since
> even then nobody was setting it.  Try:
>
> $ git grep NOSTDINC_FLAGS e8f5bdb02ce0~
>
>
> Do you understand what was going on in that commit?


No, I do not understand.

Maybe, it fixed a problem in downstream code
since there was no directory like include/asm-xen.


If you do not want to take risk,
I am fine with this patch, though.



> -Doug



-- 
Best Regards
Masahiro Yamada
