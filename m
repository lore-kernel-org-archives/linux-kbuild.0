Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40020 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfCURCt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Mar 2019 13:02:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id u9so4602384pgo.7
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2019 10:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
 <20190313211335.165605-1-ndesaulniers@google.com> <20190320191135.e49e976a8258c8ac0bb428c9@linux-foundation.org>
In-Reply-To: <20190320191135.e49e976a8258c8ac0bb428c9@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Mar 2019 10:02:37 -0700
Message-ID: <CAKwvOdn84HNEB3u4XO-V_+c=txmDd1061G_7K0zZVS4MfF--Lg@mail.gmail.com>
Subject: Re: [PATCH v4] lib/string.c: implement a basic bcmp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, Mar 20, 2019 at 7:11 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 13 Mar 2019 14:13:31 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > A recent optimization in Clang (r355672) lowers comparisons of the
> > return value of memcmp against zero to comparisons of the return value
> > of bcmp against zero.  This helps some platforms that implement bcmp
> > more efficiently than memcmp. glibc simply aliases bcmp to memcmp, but
> > an optimized implementation is in the works.
> >
> > This results in linkage failures for all targets with Clang due to the
> > undefined symbol.  For now, just implement bcmp as a tailcail to memcmp
> > to unbreak the build.  This routine can be further optimized in the
> > future.
> >
> > Other ideas discussed:
> > * A weak alias was discussed, but breaks for architectures that define
> > their own implementations of memcmp since aliases to declarations are
> > not permitted (only definitions).  Arch-specific memcmp implementations
> > typically declare memcmp in C headers, but implement them in assembly.
> > * -ffreestanding also is used sporadically throughout the kernel.
> > * -fno-builtin-bcmp doesn't work when doing LTO.
>
> I guess we should backport this into -stable so that older kernels can
> be built with newer Clang.

Ah, you're right.  I always forget.  Is it too late to add

Cc: stable@vger.kernel.org

to the patch in your tree?

>
> > ...
> >
> > --- a/lib/string.c
> > +++ b/lib/string.c
> > @@ -866,6 +866,26 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
> >  EXPORT_SYMBOL(memcmp);
> >  #endif
> >
> > +#ifndef __HAVE_ARCH_BCMP
> > +/**
> > + * bcmp - returns 0 if and only if the buffers have identical contents.
> > + * @a: pointer to first buffer.
> > + * @b: pointer to second buffer.
> > + * @len: size of buffers.
> > + *
> > + * The sign or magnitude of a non-zero return value has no particular
> > + * meaning, and architectures may implement their own more efficient bcmp(). So
> > + * while this particular implementation is a simple (tail) call to memcmp, do
> > + * not rely on anything but whether the return value is zero or non-zero.
> > + */
> > +#undef bcmp
>
> What is the undef for?

Used the same convention as memcpy.  Looking at the rest of the
translation unit, I see that there's a mix of functions that do or do
not undef their symbol.  Rasmus pointed out that memcpy is implemented
as a macro for x86 (arch/x86/include/asm/string_32.h).  But looking
closer now, I suspect it's not needed (anyone declaring memcmp as a
macro should be setting __HAVE_ARCH_MEMCMP).

Shall I send you a cleanup removing the undefs for bcmp, memcmp,
strcat, strcpy, and strcmp?  Of those, I only see memcmp being
`#defined` in arch/m68k/include/asm/string.h, arch/x86/boot/string.h,
and arch/x86/include/asm/string_32.h.

Further, I can drop some of the __GNUC__ < 4 code in
arch/x86/include/asm/string_32.h. (grepping for __GNUC__, looks like
there's a fair amount of code that can be cleaned up).  We should
probably check it since Clang lies about being GCC 4.2 compatible,
which will surely break in horrific ways at some point.

-- 
Thanks,
~Nick Desaulniers
