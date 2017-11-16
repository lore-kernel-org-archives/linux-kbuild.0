Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50362 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759726AbdKPL6D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 06:58:03 -0500
Date: Thu, 16 Nov 2017 11:58:11 +0000
From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Message-ID: <20171116115810.GH9361@arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-19-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, peterz@infradead.org, paulmck@linux.vnet.ibm.com

Hi Sami,

On Wed, Nov 15, 2017 at 01:34:28PM -0800, Sami Tolvanen wrote:
> Allow CONFIG_LTO_CLANG to be enabled for the architecture.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 3a70f763e18a..58504327b9f6 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -40,6 +40,7 @@ config ARM64
>  	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPT
>  	select ARCH_USE_CMPXCHG_LOCKREF
>  	select ARCH_USE_QUEUED_RWLOCKS
> +	select ARCH_SUPPORTS_LTO_CLANG

I'll be honest with you: I'm absolutely terrified about enabling this.
How much testing has this seen?

The main thing that worries me is that this gives the toolchain a lot
more freedom to break dependency ordering with RCU, leading to subtle
concurrency issues that would actually break on arm64. Specifically,
I'm worried about value analysis that could potentially convert an
address dependency into a control dependency. Right now, the C standard
isn't on our side here and we're relying on the compiler not doing this
kind of thing. Can we continue to rely on that in the face of LTO?

Will
