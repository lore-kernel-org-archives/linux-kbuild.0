Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:52705 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936082AbdJQOug (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 10:50:36 -0400
Received: by mail-wm0-f45.google.com with SMTP id k4so4515335wmc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2017 07:50:36 -0700 (PDT)
Date: Tue, 17 Oct 2017 07:50:33 -0700
From: Christoffer Dall <cdall@linaro.org>
Subject: Re: [PATCH 3/4] kvm/arm64: simplify CC instrumentation opt-out
Message-ID: <20171017145033.GL5886@lvm>
References: <20171016132440.38098-1-mark.rutland@arm.com>
 <20171016132440.38098-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171016132440.38098-4-mark.rutland@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, mark.zyngier@arm.com, mmarek@suse.com, will.deacon@arm.com, yamada.masahiro@socionext.com

On Mon, Oct 16, 2017 at 02:24:39PM +0100, Mark Rutland wrote:
> Now that we can opt out of all instrumentation with a single option,
> make use of this in the KVM hyp code. Hopefully, this will also avoid
> fragility as new options are introduced.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Christoffer Dall <christoffer.dall@linaro.org>
> Cc: Marc Zyngier <mark.zyngier@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>

Acked-by: Christoffer Dall <christoffer.dall@linaro.org>

> ---
>  arch/arm64/kvm/hyp/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
> index 14c4e3b14bcb..a8a212eb66f1 100644
> --- a/arch/arm64/kvm/hyp/Makefile
> +++ b/arch/arm64/kvm/hyp/Makefile
> @@ -22,7 +22,4 @@ obj-$(CONFIG_KVM_ARM_HOST) += s2-setup.o
>  # KVM code is run at a different exception code with a different map, so
>  # compiler instrumentation that inserts callbacks or checks into the code may
>  # cause crashes. Just disable it.
> -GCOV_PROFILE	:= n
> -KASAN_SANITIZE	:= n
> -UBSAN_SANITIZE	:= n
> -KCOV_INSTRUMENT	:= n
> +CC_INSTRUMENT	:= n
> -- 
> 2.11.0
> 
