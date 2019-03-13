Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbfCMUMY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Mar 2019 16:12:24 -0400
Date: Wed, 13 Mar 2019 16:12:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2] lib/string.c: implement a basic bcmp
Message-ID: <20190313161221.41797313@gandalf.local.home>
In-Reply-To: <65c69aac-696c-0534-2243-679db926d527@rasmusvillemoes.dk>
References: <CAKwvOdmdEH1U9vOmVKo2Fn+hMPF9AB1enZ2rkpJcU9XHgR8Wng@mail.gmail.com>
        <20190313181719.87859-1-ndesaulniers@google.com>
        <20190313144013.37cab5c7@gandalf.local.home>
        <CAKwvOdnheUi6Ho5u4akTLGa-tBeUq94hQJH0+a4ROe_aEUgo7g@mail.gmail.com>
        <20190313150133.117e2b63@gandalf.local.home>
        <65c69aac-696c-0534-2243-679db926d527@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Andrew Morton <akpm@linux-foundation.org>, clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, 13 Mar 2019 20:34:11 +0100
Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:

> Yes, but let's completely avoid mentioning memcmp in the summary.
> 
> bcmp - return 0 if and only if the buffers have identical contents
> @a: pointer to first buffer
> @b: pointer to second buffer
> @len: size of buffers
> 
> The sign or magnitude of a non-zero return value has no particular
> meaning, and architectures may implement their own more efficient
> bcmp(). So while this particular implementation is a simple (tail) call
> to memcmp, do not rely on anything but whether the return value is zero
> or non-zero.

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks!

-- Steve
