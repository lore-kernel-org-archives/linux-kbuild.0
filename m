Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59129 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfBPC4k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Feb 2019 21:56:40 -0500
MIME-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com> <20190211193008.24101-4-ndesaulniers@google.com>
In-Reply-To: <20190211193008.24101-4-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Feb 2019 11:55:52 +0900
Message-ID: <CAK7LNARbCfB9pW8f5B-1YmSw41ExWohhRT=y0m5Osb++9cZCFg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Makefile: lld: set -O2 linker flag when linking
 with LLD
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Nicholas Piggin <npiggin@gmail.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vasily Gorbik <gor@linux.ibm.com>, Adrian Reber <adrian@lisas.de>, Richard Guy Briggs <rgb@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rui Ueyama <ruiu@google.com>

On Tue, Feb 12, 2019 at 5:42 AM <ndesaulniers@google.com> wrote:
>
> For arm64:
> 0.34% size improvement with lld -O2 over lld for vmlinux.
> 3.3% size improvement with lld -O2 over lld for Image.lz4-dtb.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/343
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


I wondered why this option should be added only for lld,
and I found the answer in the "Link:"

"for bfd, didn't seem to change the size at all (I can't recall if
this was arm64 or x86 I had tested with though)."


Hmm, I see.
My 'man ld' says it is currently effective only for shared libraries.


       -O level
           If level is a numeric values greater than zero ld optimizes the
           output.  This might take significantly longer and therefore
           probably should only be enabled for the final binary.  At the
           moment this option only affects ELF shared library generation.
           Future releases of the linker may make more use of this option.
           Also currently there is no difference in the linker's behaviour for
           different non-zero values of this option.  Again this may change
           with future releases.



I am fine with adding it unconditionally
as long as it is harmless for bfd, gold.






>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS  += -fno-omit-frame-pointer -fno-optimize-sibling-calls
> --
> 2.20.1.791.gb4d0f1c61a-goog
>


-- 
Best Regards
Masahiro Yamada
