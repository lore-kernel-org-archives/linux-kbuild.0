Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38272 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfCMR1R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 13:27:17 -0400
Received: by mail-pg1-f193.google.com with SMTP id m2so2002882pgl.5
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Mar 2019 10:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190312215203.27643-1-natechancellor@gmail.com>
 <80fb5b7f-42f9-4fd1-00cf-bfa7965ff8f7@rasmusvillemoes.dk> <20190313134447.GA19066@archlinux-ryzen>
 <CAK8P3a344k=MDAX-d21U4+H+mv7Vcd9YhAN4NPEJm1CXv76tkw@mail.gmail.com>
 <20190313153209.GA14098@archlinux-ryzen> <CAKwvOd=UYEtQC9T2K=O0rxrDKug4XzsA6dHjSKmogFa7whE7Zw@mail.gmail.com>
In-Reply-To: <CAKwvOd=UYEtQC9T2K=O0rxrDKug4XzsA6dHjSKmogFa7whE7Zw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Mar 2019 10:27:05 -0700
Message-ID: <CAKwvOd=8rAZi3ZT8qEupmS6xY2U10cKT7kPtB=gYfWsJEJ0GSQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add '-fno-builtin-bcmp' to CLANG_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Y Knight <jyknight@google.com>, clang-built-linux@googlegroups.com, "# 3.4.x" <stable@vger.kernel.org>

On Wed, Mar 13, 2019 at 10:21 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 13, 2019 at 8:32 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Wed, Mar 13, 2019 at 02:48:49PM +0100, Arnd Bergmann wrote:
> > > On Wed, Mar 13, 2019 at 2:44 PM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > > On Wed, Mar 13, 2019 at 09:13:11AM +0100, Rasmus Villemoes wrote:
> > > > > Wouldn't it be better to just define bcmp as an alias for memcmp? They
> > > > > seem to have compatible prototypes, and then somebody might someday sit
> > > > > down and implement some word-at-a-time version of bcmp making use of the
> > > > > weaker guarantees about the return value to gain some performance. But I
> > > > > suppose that can also be done later.
> > > >
> > > > Thank you much for the review, I didn't even realize this was possible :)
> > > >
> > > > I'd certainly like to explore it as that is what glibc does. How would
> > > > you suggest going about it here?
> > >
> > > I suggested a possible implementation (likely contains bugs) and
> > > an alias for architectures that require strict alignment, see
> > > https://bugs.llvm.org/show_bug.cgi?id=41035#c11
> > >
> > > We could start out with just the alias.
> > >
> > >        Arnd
> >
> > So I've been messing around with this for a bit (forgive me, I'm still
> > learning all of the intricacies around here) and this is what I came up
> > with for when __ARCH_HAVE_MEMCMP is unset (not particularly difficult
> > obviously). I can compile, link, and boot an x86 in QEMU.
> >
> > However, I am not sure how to handle memcmp definitions that are written
> > in assembly like arm64, as the alias attribute only works when the alias
> > is defined in the same translation unit. Thoughts?
>
> I hit this, too:
> ./arch/arm64/include/asm/string.h:40:15: error: alias must point to a
> defined variable
>       or function
>
> since memcmp is only declared (not defined) in that header, clang is
> not happy to alias to memcmp.  If __HAVE_ARCH_MEMCMP is defined, then
> we can just return a call to memcmp.  Thoughts (I need to add comments
> above bcmp, anything else)?  Do we like the typeof trick (stolen from
> glibc) or no?
>
> diff --git a/lib/string.c b/lib/string.c
> index 38e4ca08e757..e6c1954f2716 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -845,7 +845,13 @@ void *memmove(void *dest, const void *src, size_t count)
>  EXPORT_SYMBOL(memmove);
>  #endif
>
> -#ifndef __HAVE_ARCH_MEMCMP
> +#ifdef __HAVE_ARCH_MEMCMP
> +int bcmp(const void *cs, const void *ct, size_t n)
> +{
> +       return memcmp(cs, ct, n);
> +}
> +EXPORT_SYMBOL(bcmp);
> +#else
>  /**
>   * memcmp - Compare two areas of memory
>   * @cs: One area of memory
> @@ -864,6 +870,8 @@ __visible int memcmp(const void *cs, const void
> *ct, size_t count)
>         return res;
>  }
>  EXPORT_SYMBOL(memcmp);
> +__weak __alias(memcmp) typeof(memcmp) bcmp;
> +EXPORT_SYMBOL(bcmp);
>  #endif
>
>  #ifndef __HAVE_ARCH_MEMSCAN

Alternatively, just not worrying about __alias makes this simpler and
seems to work (need to add comments, thoughts?):


diff --git a/lib/string.c b/lib/string.c
index 38e4ca08e757..2112108ecc35 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -866,6 +866,15 @@ __visible int memcmp(const void *cs, const void
*ct, size_t count)
 EXPORT_SYMBOL(memcmp);
 #endif

+#ifndef __HAVE_ARCH_BCMP
+#undef bcmp
+int bcmp(const void *cs, const void *ct, size_t count)
+{
+       return memcmp(cs, ct, count);
+}
+EXPORT_SYMBOL(bcmp);
+#endif
+
 #ifndef __HAVE_ARCH_MEMSCAN
 /**
  * memscan - Find a character in an area of memory.

-- 
Thanks,
~Nick Desaulniers
