Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:57299 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388855AbfIJCV0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 22:21:26 -0400
Date: Mon, 9 Sep 2019 22:21:22 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1909092220020.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr> <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com> <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
 <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, 10 Sep 2019, Masahiro Yamada wrote:

> On Tue, Sep 10, 2019 at 1:06 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> >
> > > Hi Nicolas,
> > >
> > > On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > > >
> > > > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> > > >
> > > > > This line was touched by commit f235541699bc ("export.h: allow for
> > > > > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > > > > not explain why.
> > > > >
> > > > > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
> > > >
> > > > I'm pretty sure it was needed back then so not to interfere with users
> > > > of this file. My fault for not documenting it.
> > >
> > > Hmm, I did not see a problem in my quick build test.
> > >
> > > Do you remember which file was causing the problem?
> >
> > If you build commit 7ec925701f5f with CONFIG_TRIM_UNUSED_KSYMS=y and the
> > defined(__KERNEL__) test removed then you'll get:
> >
> >   HOSTCC  scripts/mod/modpost.o
> > In file included from scripts/mod/modpost.c:24:
> > scripts/mod/../../include/linux/export.h:81:10: fatal error: linux/kconfig.h: No such file or directory
> >
> >
> > Nicolas
> 
> 
> Thanks for explaining this.
> 
> It is not the case any more.
> 
> 
> I will reword the commit message as follows:
> 
> ------------------------>8---------------------------------------
> export.h: remove defined(__KERNEL__), which is no longer needed
> 
> The conditional define(__KERNEL__) was added by commit f235541699bc
> ("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").
> 
> It was needed at that time to avoid the build error of modpost
> with CONFIG_TRIM_UNUSED_KSYMS=y.
> 
> Since commit b2c5cdcfd4bc ("modpost: remove symbol prefix support"),
> modpost no longer includes linux/export.h, thus the define(__KERNEL__)
> is unneeded.
> ------------------------>8---------------------------------------
> 

Acked-by: Nicolas Pitre <nico@fluxnic.net>


Nicolas
