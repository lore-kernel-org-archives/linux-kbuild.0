Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34470 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754292AbdKGDlt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Nov 2017 22:41:49 -0500
MIME-Version: 1.0
In-Reply-To: <20171106184756.24404-1-ndesaulniers@google.com>
References: <CAKwvOdmhuaLC6=vG2DMFAbhfXoUr74_aemM2DK7me6pQ0obW4g@mail.gmail.com>
 <20171106184756.24404-1-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 7 Nov 2017 12:41:00 +0900
Message-ID: <CAK7LNATKn+8g=6QWoK3HXb9dk35myNq=xt0vnrHamckhDAhtLA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Douglas Anderson <dianders@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Mark Charlebois <charlebm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-07 3:47 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
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
> ---
> Changes since v2:
> * Add LDFLAGS to ld-option, as per Masahiro, and spotted by 0-day bot:
>   https://lists.01.org/pipermail/lkp/2017-October/007427.html
>
>  scripts/Kbuild.include | 5 +++--


Applied to linux-kbuild/kbuild.


-- 
Best Regards
Masahiro Yamada
