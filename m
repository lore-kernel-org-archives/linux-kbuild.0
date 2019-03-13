Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727151AbfCMSkR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 14:40:17 -0400
Date: Wed, 13 Mar 2019 14:40:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] lib/string.c: implement a basic bcmp
Message-ID: <20190313144013.37cab5c7@gandalf.local.home>
In-Reply-To: <20190313181719.87859-1-ndesaulniers@google.com>
References: <CAKwvOdmdEH1U9vOmVKo2Fn+hMPF9AB1enZ2rkpJcU9XHgR8Wng@mail.gmail.com>
        <20190313181719.87859-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: akpm@linux-foundation.org, clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org, stable@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

On Wed, 13 Mar 2019 11:17:15 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

> +#ifndef __HAVE_ARCH_BCMP
> +/**
> + * bcmp - Like memcmp but a non-zero return code simply indicates a non-match.
> + * @cs: One area of memory.
> + * @ct: Another area of memory.
> + * @count: The size of the areas.
> + */
> +#undef bcmp
> +int bcmp(const void *cs, const void *ct, size_t count)
> +{
> +	return memcmp(cs, ct, count);

This is confusing where the comment says "like memcmp but .." and then
just returns memcmp() unmodified. If anything, I would expect to see

	return !!memcmp(cs, ct, conut);

or have a better comment explaining why its the same.

-- Steve

> +}
> +EXPORT_SYMBOL(bcmp);
> +#endif
> +
