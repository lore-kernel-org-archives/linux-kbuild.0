Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58854 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751245AbdKTPUU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 10:20:20 -0500
Date: Mon, 20 Nov 2017 15:20:14 +0000
From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 16/18] arm64: crypto: disable LTO for aes-ce-cipher.c
Message-ID: <20171120152014.hftuded4zxwn2r7m@lakrids.cambridge.arm.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-17-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171115213428.22559-17-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 01:34:26PM -0800, Sami Tolvanen wrote:
> CONFIG_LTO_CLANG requires the use of clang's integrated assembler, which
> doesn't understand the inline assembly in aes-ce-cipher.c. Disable LTO for
> the file to work around the issue.

Could you elaborate on what the integrated asembler doesn't like?

It's not entirely clear at a glance, as the asm in that file doesn't
seem to do anything that obscure.

Is it a bug?

Thanks,
Mark.

> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/crypto/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
> index b5edc5918c28..af08508521a3 100644
> --- a/arch/arm64/crypto/Makefile
> +++ b/arch/arm64/crypto/Makefile
> @@ -24,7 +24,7 @@ obj-$(CONFIG_CRYPTO_CRC32_ARM64_CE) += crc32-ce.o
>  crc32-ce-y:= crc32-ce-core.o crc32-ce-glue.o
>  
>  obj-$(CONFIG_CRYPTO_AES_ARM64_CE) += aes-ce-cipher.o
> -CFLAGS_aes-ce-cipher.o += -march=armv8-a+crypto
> +CFLAGS_aes-ce-cipher.o += -march=armv8-a+crypto $(DISABLE_LTO_CLANG)
>  
>  obj-$(CONFIG_CRYPTO_AES_ARM64_CE_CCM) += aes-ce-ccm.o
>  aes-ce-ccm-y := aes-ce-ccm-glue.o aes-ce-ccm-core.o
> -- 
> 2.15.0.448.gf294e3d99a-goog
> 
