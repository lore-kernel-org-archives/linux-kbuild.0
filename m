Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:58252 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbfE1OMj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 May 2019 10:12:39 -0400
Date: Tue, 28 May 2019 15:12:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 4/5] kconfig: make arch/*/configs/defconfig the default
 of KBUILD_DEFCONFIG
Message-ID: <20190528141232.GC32006@arrakis.emea.arm.com>
References: <20190527143725.12542-1-yamada.masahiro@socionext.com>
 <20190527143725.12542-4-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527143725.12542-4-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, Firoz Khan <firoz.khan@linaro.org>, Richard Henderson <rth@twiddle.net>, Matt Turner <mattst88@gmail.com>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>, linux-alpha@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, May 27, 2019 at 11:37:24PM +0900, Masahiro Yamada wrote:
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index b025304bde46..970c41a30ed3 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -30,8 +30,6 @@ LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
>    endif
>  endif
>  
> -KBUILD_DEFCONFIG := defconfig
> -
>  # Check for binutils support for specific extensions
>  lseinstr := $(call as-instr,.arch_extension lse,-DCONFIG_AS_LSE=1)

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
