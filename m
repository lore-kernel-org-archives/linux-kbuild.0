Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41485 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfBHFvD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 00:51:03 -0500
Date: Thu, 7 Feb 2019 22:50:59 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 3/4] Makefile: lld: tell clang to use lld
Message-ID: <20190208055059.GD9647@archlinux-ryzen>
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207220155.81351-3-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ndesaulniers@google.com
Cc: yamada.masahiro@socionext.com, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 07, 2019 at 02:01:51PM -0800, ndesaulniers@google.com wrote:
> This is needed because clang doesn't select which linker to use based on
> $LD but rather -fuse-ld=$(LD). This is problematic especially for
> cc-ldoption, which checks for linker flag support via invoking the
> compiler, rather than the linker.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/342
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0eae4277206e..6307c17259ea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -502,6 +502,9 @@ endif
>  CLANG_FLAGS	+= -no-integrated-as
>  KBUILD_CFLAGS	+= $(CLANG_FLAGS)
>  KBUILD_AFLAGS	+= $(CLANG_FLAGS)
> +ifneq ($(shell $(LD) --version 2>&1 | head -n 1 | grep LLD),)
> +CLANG_FLAGS	+= -fuse-ld=lld
> +endif

This section needs to be moved up above KBUILD_CFLAGS otherwise it never
actually gets passed along.

With that change, please add:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

>  export CLANG_FLAGS
>  endif
>  
> -- 
> 2.20.1.791.gb4d0f1c61a-goog
> 
