Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:50716 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfBLMWo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Feb 2019 07:22:44 -0500
Date: Tue, 12 Feb 2019 13:22:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 4/4] Makefile: lld: set -O2 linker flag when linking
 with LLD
Message-ID: <20190212122221.GF32494@hirez.programming.kicks-ass.net>
References: <20190211193008.24101-1-ndesaulniers@google.com>
 <20190211193008.24101-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190211193008.24101-4-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ndesaulniers@google.com
Cc: yamada.masahiro@socionext.com, natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rui Ueyama <ruiu@google.com>

On Mon, Feb 11, 2019 at 11:30:06AM -0800, ndesaulniers@google.com wrote:
> For arm64:
> 0.34% size improvement with lld -O2 over lld for vmlinux.
> 3.3% size improvement with lld -O2 over lld for Image.lz4-dtb.

The Changelog is utterly failing to explain what it does.

> Link: https://github.com/ClangBuiltLinux/linux/issues/343

That is irrelevant crap.

> Suggested-by: Rui Ueyama <ruiu@google.com>
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1->V2:
> * add tested and reviewed by tags.
> 
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 00e8e01d23fc..8011555745aa 100644
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
