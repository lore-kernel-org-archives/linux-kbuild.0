Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:38598 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932266AbdK2MPP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 07:15:15 -0500
Received: by mail-it0-f67.google.com with SMTP id r6so3834756itr.3
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 04:15:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171129000011.55235-4-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com> <20171129000011.55235-4-samitolvanen@google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 29 Nov 2017 12:15:14 +0000
Message-ID: <CAKv+Gu99XM5jLcOTkqPJPj5oZnUCNv2c7C=5X2hFCM4-4_gwNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: use -mno-implicit-float instead of -mgeneral-regs-only
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On 29 November 2017 at 00:00, Sami Tolvanen <samitolvanen@google.com> wrote:
> From: Greg Hackmann <ghackmann@google.com>
>
> LLVM bug 30792 causes clang's AArch64 backend to crash compiling
> arch/arm64/crypto/aes-ce-cipher.c.  Replacing -mgeneral-regs-only with
> -mno-implicit-float is the suggested workaround.
>

Do we still need these patches now that the AES code has been fixed?

> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> [added clang-ifversion to enable the workaround only for clang <6.0]
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index b35788c909f1..d2efb5a0212f 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -49,7 +49,10 @@ $(warning Detected assembler with broken .inst; disassembly will be unreliable)
>    endif
>  endif
>
> -KBUILD_CFLAGS  += -mgeneral-regs-only $(lseinstr) $(brokengasinst)
> +# This is a workaround for https://bugs.llvm.org/show_bug.cgi?id=30792.
> +KBUILD_CFLAGS  += $(call clang-ifversion, -lt, 0600, -mno-implicit-float, -mgeneral-regs-only)
> +
> +KBUILD_CFLAGS  += $(lseinstr) $(brokengasinst)
>  KBUILD_CFLAGS  += -fno-asynchronous-unwind-tables
>  KBUILD_CFLAGS  += $(call cc-option, -mpc-relative-literal-loads)
>  KBUILD_AFLAGS  += $(lseinstr) $(brokengasinst)
> --
> 2.15.0.417.g466bffb3ac-goog
>
