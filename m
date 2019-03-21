Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:33930 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727661AbfCUCLh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Mar 2019 22:11:37 -0400
Date: Wed, 20 Mar 2019 19:11:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4] lib/string.c: implement a basic bcmp
Message-Id: <20190320191135.e49e976a8258c8ac0bb428c9@linux-foundation.org>
In-Reply-To: <20190313211335.165605-1-ndesaulniers@google.com>
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
        <20190313211335.165605-1-ndesaulniers@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, stable@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

On Wed, 13 Mar 2019 14:13:31 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:

> A recent optimization in Clang (r355672) lowers comparisons of the
> return value of memcmp against zero to comparisons of the return value
> of bcmp against zero.  This helps some platforms that implement bcmp
> more efficiently than memcmp. glibc simply aliases bcmp to memcmp, but
> an optimized implementation is in the works.
> 
> This results in linkage failures for all targets with Clang due to the
> undefined symbol.  For now, just implement bcmp as a tailcail to memcmp
> to unbreak the build.  This routine can be further optimized in the
> future.
> 
> Other ideas discussed:
> * A weak alias was discussed, but breaks for architectures that define
> their own implementations of memcmp since aliases to declarations are
> not permitted (only definitions).  Arch-specific memcmp implementations
> typically declare memcmp in C headers, but implement them in assembly.
> * -ffreestanding also is used sporadically throughout the kernel.
> * -fno-builtin-bcmp doesn't work when doing LTO.

I guess we should backport this into -stable so that older kernels can
be built with newer Clang.

> ...
>
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -866,6 +866,26 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
>  EXPORT_SYMBOL(memcmp);
>  #endif
>  
> +#ifndef __HAVE_ARCH_BCMP
> +/**
> + * bcmp - returns 0 if and only if the buffers have identical contents.
> + * @a: pointer to first buffer.
> + * @b: pointer to second buffer.
> + * @len: size of buffers.
> + *
> + * The sign or magnitude of a non-zero return value has no particular
> + * meaning, and architectures may implement their own more efficient bcmp(). So
> + * while this particular implementation is a simple (tail) call to memcmp, do
> + * not rely on anything but whether the return value is zero or non-zero.
> + */
> +#undef bcmp

What is the undef for?

> +int bcmp(const void *a, const void *b, size_t len)
> +{
> +	return memcmp(a, b, len);
> +}
> +EXPORT_SYMBOL(bcmp);
> +#endif
> +
>  #ifndef __HAVE_ARCH_MEMSCAN
>  /**
>   * memscan - Find a character in an area of memory.
> -- 
> 2.21.0.360.g471c308f928-goog
