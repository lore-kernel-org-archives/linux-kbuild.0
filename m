Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40191 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbfCMTjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 15:39:11 -0400
MIME-Version: 1.0
References: <20190312215203.27643-1-natechancellor@gmail.com>
 <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk> <20190313134447.GA19066@archlinux-ryzen>
 <CAK8P3a344k=MDAX-d21U4+H+mv7Vcd9YhAN4NPEJm1CXv76tkw@mail.gmail.com>
 <20190313153209.GA14098@archlinux-ryzen> <CAKwvOd=UYEtQC9T2K=O0rxrDKug4XzsA6dHjSKmogFa7whE7Zw@mail.gmail.com>
 <CAKwvOd=8rAZi3ZT8qEupmS6xY2U10cKT7kPtB=gYfWsJEJ0GSQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=8rAZi3ZT8qEupmS6xY2U10cKT7kPtB=gYfWsJEJ0GSQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Mar 2019 20:38:52 +0100
Message-ID: <CAK8P3a206PXqaqv-B=S-4+sP04y5ZFkuP4XoN0bQNxrx56asKg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, "# 3.4.x" <stable@vger.kernel.org>

On Wed, Mar 13, 2019 at 6:27 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:

> > diff --git a/lib/string.c b/lib/string.c
> > index 38e4ca08e757..e6c1954f2716 100644
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -845,7 +845,13 @@ void *memmove(void *dest, const void *src, size_t count)
> >  EXPORT_SYMBOL(memmove);
> >  #endif
> >
> > -#ifndef __HAVE_ARCH_MEMCMP
> > +#ifdef __HAVE_ARCH_MEMCMP
> > +int bcmp(const void *cs, const void *ct, size_t n)
> > +{
> > +       return memcmp(cs, ct, n);
> > +}
> > +EXPORT_SYMBOL(bcmp);
> > +#else
> >  /**
> >   * memcmp - Compare two areas of memory
> >   * @cs: One area of memory
> > @@ -864,6 +870,8 @@ __visible int memcmp(const void *cs, const void
> > *ct, size_t count)
> >         return res;
> >  }
> >  EXPORT_SYMBOL(memcmp);
> > +__weak __alias(memcmp) typeof(memcmp) bcmp;
> > +EXPORT_SYMBOL(bcmp);
> >  #endif
> >
> >  #ifndef __HAVE_ARCH_MEMSCAN
>
> Alternatively, just not worrying about __alias makes this simpler and
> seems to work (need to add comments, thoughts?):

Either way seems fine to me. If we don't plan to provide an
optimized version, I'd go with the simpler definition rather than
the alias.

       Arnd
