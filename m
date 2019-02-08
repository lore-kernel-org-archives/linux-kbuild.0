Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37838 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfBHGHm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Feb 2019 01:07:42 -0500
Date: Thu, 7 Feb 2019 23:07:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 4/4] Makefile: lld: set -O2 linker flag when linking with
 LLD
Message-ID: <20190208060737.GA12027@archlinux-ryzen>
References: <20190207220155.81351-1-ndesaulniers@google.com>
 <20190207220155.81351-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207220155.81351-4-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ndesaulniers@google.com
Cc: yamada.masahiro@socionext.com, Rui Ueyama <ruiu@google.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 07, 2019 at 02:01:52PM -0800, ndesaulniers@google.com wrote:
> -O2 enables tail merging of string table strings.
> 
> For arm64:
> 0.34% size improvement with lld -O2 over lld for vmlinux.
> 3.30% size improvement with lld -O2 over lld for Image.lz4-dtb.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/343
> Suggested-by: Rui Ueyama <ruiu@google.com>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 6307c17259ea..c07208ec49d4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -718,6 +718,10 @@ else
>  KBUILD_CFLAGS += -Wno-unused-but-set-variable
>  endif
>  
> +ifdef CONFIG_LD_IS_LLD
> +KBUILD_LDFLAGS += -O2
> +endif
> +
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
> -- 
> 2.20.1.791.gb4d0f1c61a-goog
> 
