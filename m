Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:40202 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933138AbeBMCHp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Feb 2018 21:07:45 -0500
Received: by mail-pg0-f68.google.com with SMTP id g2so8823612pgn.7
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2018 18:07:44 -0800 (PST)
Date: Mon, 12 Feb 2018 18:07:43 -0800 (PST)
Subject: Re: [PATCH] riscv: kconfig: Remove RISCV_IRQ_INTC select
In-Reply-To: <20180208225446.rj7ioyeikaqfm2jc@huvuddator>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-90fa3f65-61f6-4ae2-af42-d739f6fbb0aa@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ulfalizer@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, Christoph Hellwig <hch@lst.de>, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, Will Deacon <will.deacon@arm.com>, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, albert@sifive.com, linux-riscv@lists.infradead.org

On Thu, 08 Feb 2018 14:54:46 PST (-0800), ulfalizer@gmail.com wrote:
> The RISCV_IRQ_INTC configuration symbol is undefined, but RISCV selects
> it. Quoting Palmer Dabbelt:
>
> 	It looks like this slipped through, the symbol has been renamed
> 	RISCV_INTC.
>
> No RISCV_INTC configuration symbol has been merged either. Just remove
> the RISCV_IRQ_INTC select for now.
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  arch/riscv/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b6722c246d9c..2be44b6651c5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,7 +34,6 @@ config RISCV
>  	select HAVE_ARCH_TRACEHOOK
>  	select MODULES_USE_ELF_RELA if MODULES
>  	select THREAD_INFO_IN_TASK
> -	select RISCV_IRQ_INTC
>  	select RISCV_TIMER
>
>  config MMU

Thanks!  I'll take this (and the other relevant ones) into the RISC-V tree.
