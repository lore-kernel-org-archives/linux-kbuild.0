Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18784 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfBPDDZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Feb 2019 22:03:25 -0500
MIME-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com> <20190211193008.24101-2-ndesaulniers@google.com>
In-Reply-To: <20190211193008.24101-2-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Feb 2019 12:02:32 +0900
Message-ID: <CAK7LNAQZSqAjw6AV49ZT6nyEu4zgDZwOYRq6W-JFVvfpF8Q8mA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Makefile: clang: choose GCC_TOOLCHAIN_DIR not on LD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vasily Gorbik <gor@linux.ibm.com>, Adrian Reber <adrian@lisas.de>, Richard Guy Briggs <rgb@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 12, 2019 at 5:42 AM <ndesaulniers@google.com> wrote:
>
> This causes an issue when trying to build with `make LD=ld.lld` if
> ld.lld and the rest of your cross tools aren't in the same directory
> (ex. /usr/local/bin) (as is the case for Android's build system), as the
> GCC_TOOLCHAIN_DIR then gets set based on `which $(LD)` which will point
> where LLVM tools are, not GCC/binutils tools are located.
>
> Instead, select the GCC_TOOLCHAIN_DIR based on another tool provided by
> binutils for which LLVM does not provide a substitute for, such as
> elfedit.
>
> Fixes commit 785f11aa595b ("kbuild: Add better clang cross build support")
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/341
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

This one looks correct to me.

Applied to linux-kbuild.



> Changes V1->V2:
> * add reviewed and tested tags.
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 86cf35d1d79d..d3b65e96d183 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -492,7 +492,7 @@ endif
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
> -GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
>  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
> --
> 2.20.1.791.gb4d0f1c61a-goog
>


--
Best Regards
Masahiro Yamada
