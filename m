Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:35817 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752433AbdLKKRR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Dec 2017 05:17:17 -0500
MIME-Version: 1.0
In-Reply-To: <20171106184756.24404-1-ndesaulniers@google.com>
References: <CAKwvOdmhuaLC6=vG2DMFAbhfXoUr74_aemM2DK7me6pQ0obW4g@mail.gmail.com>
 <20171106184756.24404-1-ndesaulniers@google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Dec 2017 11:17:16 +0100
Message-ID: <CAK8P3a1zKD1VyG+hz13=2Ht9Q=zACiavoz54QdJpvZvz30SFrQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, pirama@google.com, Matthias Kaehlcke <mka@chromium.org>, Ingo Molnar <mingo@kernel.org>, Douglas Anderson <dianders@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Mark Charlebois <charlebm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 6, 2017 at 7:47 PM, Nick Desaulniers
<ndesaulniers@google.com> wrote:
> I was not seeing my linker flags getting added when using ld-option when
> cross compiling with Clang. Upon investigation, this seems to be due to
> a difference in how GCC vs Clang handle cross compilation.
>
> GCC is configured at build time to support one backend, that is implicit
> when compiling.  Clang is explicit via the use of `-target <triple>` and
> ships with all supported backends by default.
>
> GNU Make feature test macros that compile then link will always fail
> when cross compiling with Clang unless Clang's triple is passed along to
> the compiler. For example:
>
> $ clang -x c /dev/null -c -o temp.o
> $ aarch64-linux-android/bin/ld -E temp.o
> aarch64-linux-android/bin/ld:
> unknown architecture of input file `temp.o' is incompatible with
> aarch64 output
> aarch64-linux-android/bin/ld:
> warning: cannot find entry symbol _start; defaulting to
> 0000000000400078
> $ echo $?
> 1
>
> $ clang -target aarch64-linux-android- -x c /dev/null -c -o temp.o
> $ aarch64-linux-android/bin/ld -E temp.o
> aarch64-linux-android/bin/ld:
> warning: cannot find entry symbol _start; defaulting to 00000000004002e4
> $ echo $?
> 0
>
> This causes conditional checks that invoke $(CC) without the target
> triple, then $(LD) on the result, to always fail.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

After this patch, I get the following warning in arm64 kernel builds
with CONFIG_ARM64_ERRATUM_843419:

arch/arm64/Makefile:27: ld does not support --fix-cortex-a53-843419;
kernel may be susceptible to erratum

This only happens on the first build though, when the cached variable
is being set. On the second build we get the contents from the cache
and the warning disappears.

I've tried debugging it further but did not get anywhere with that.

        Arnd
