Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:47632 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1762639AbdJQN4M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 09:56:12 -0400
Date: Tue, 17 Oct 2017 14:56:08 +0100
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 4/4] arm64: vdso: remove pointless gcov option
Message-ID: <20171017135607.copc5duf5oon4azr@lakrids.cambridge.arm.com>
References: <20171016132440.38098-1-mark.rutland@arm.com>
 <20171016132440.38098-5-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171016132440.38098-5-mark.rutland@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, marc.zyngier@arm.com, will.deacon@arm.com, yamada.masahiro@socionext.com

On Mon, Oct 16, 2017 at 02:24:40PM +0100, Mark Rutland wrote:
> The arm64 VDSO Makefile explicitly disables gcov; a practice we seem to
> have inherited from other VDSO Makefiles.
> 
> The arm64 VDSO is written entirely in assembly, so this is not
> necessary. Further, if the VDSO were written in C it would be necessary
> to disable all other instrumentation, and this alone would not be
> sufficient.

Evidently, I haven't looked hrough the history thoroughly enough. It
turns out that this was deliberately added in commit:

  543097843ca7c9ac ("arm64: build vdso without libgcov")

... this is necessary because we use the compiler to do the actual
linking. That causes us to have -lgcov in the compilr flags, and the
link can fail.

Please ignore this patch for now.

Thanks,
Mark.

> This patch remosves the redundant GCOV option for now.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: Will Deacon <will.deacon@arm.com>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/kernel/vdso/Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 62c84f7cb01b..350190b749dd 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -15,9 +15,6 @@ ccflags-y := -shared -fno-common -fno-builtin
>  ccflags-y += -nostdlib -Wl,-soname=linux-vdso.so.1 \
>  		$(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
>  
> -# Disable gcov profiling for VDSO code
> -GCOV_PROFILE := n
> -
>  # Workaround for bare-metal (ELF) toolchains that neglect to pass -shared
>  # down to collect2, resulting in silent corruption of the vDSO image.
>  ccflags-y += -Wl,-shared
> -- 
> 2.11.0
> 
