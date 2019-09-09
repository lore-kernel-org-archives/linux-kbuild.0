Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp21.pobox.com ([173.228.157.53]:57941 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729326AbfIIQGs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 12:06:48 -0400
Date: Mon, 9 Sep 2019 12:06:43 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
In-Reply-To: <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
References: <20190909105317.20473-1-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr> <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Denis Efremov <efremov@linux.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 9 Sep 2019, Masahiro Yamada wrote:

> Hi Nicolas,
> 
> On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> >
> > > This line was touched by commit f235541699bc ("export.h: allow for
> > > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > > not explain why.
> > >
> > > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
> >
> > I'm pretty sure it was needed back then so not to interfere with users
> > of this file. My fault for not documenting it.
> 
> Hmm, I did not see a problem in my quick build test.
> 
> Do you remember which file was causing the problem?

If you build commit 7ec925701f5f with CONFIG_TRIM_UNUSED_KSYMS=y and the 
defined(__KERNEL__) test removed then you'll get:

  HOSTCC  scripts/mod/modpost.o
In file included from scripts/mod/modpost.c:24:
scripts/mod/../../include/linux/export.h:81:10: fatal error: linux/kconfig.h: No such file or directory


Nicolas
