Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44190 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfBHFpd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 00:45:33 -0500
Date: Thu, 7 Feb 2019 22:45:28 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 2/4] Makefile: clang: choose GCC_TOOLCHAIN_DIR not on LD
Message-ID: <20190208054528.GC9647@archlinux-ryzen>
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-2-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207220155.81351-2-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ndesaulniers@google.com
Cc: yamada.masahiro@socionext.com, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 07, 2019 at 02:01:50PM -0800, ndesaulniers@google.com wrote:
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
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 3142e67d03f1..0eae4277206e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -492,7 +492,7 @@ endif
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
> -GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
>  GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
> -- 
> 2.20.1.791.gb4d0f1c61a-goog
> 
