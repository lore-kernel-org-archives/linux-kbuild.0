Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:40589 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757211AbdKOW3O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 17:29:14 -0500
Received: by mail-io0-f193.google.com with SMTP id 71so3231804ior.7
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 14:29:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171115213428.22559-9-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com> <20171115213428.22559-9-samitolvanen@google.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 15 Nov 2017 22:29:12 +0000
Message-ID: <CAKv+Gu-wYwBMV7tdb+Kax_cyPsmAB2R2ZVwJuNi9qM0kaYAs=Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] arm64: don't disable ADR_PREL_PG_HI21* with ARM64_ERRATUM_843419
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On 15 November 2017 at 21:34, Sami Tolvanen <samitolvanen@google.com> wrote:
> CONFIG_LTO_CLANG depends on GNU gold, which can generate ADR_PREL_PG_HI21*
> relocations even with --fix-cortex-a53-843419.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  arch/arm64/kernel/module.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index f469e0435903..fec9a578f122 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -336,14 +336,12 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
>                         ovf = reloc_insn_imm(RELOC_OP_PREL, loc, val, 0, 21,
>                                              AARCH64_INSN_IMM_ADR);
>                         break;
> -#ifndef CONFIG_ARM64_ERRATUM_843419
>                 case R_AARCH64_ADR_PREL_PG_HI21_NC:
>                         overflow_check = false;
>                 case R_AARCH64_ADR_PREL_PG_HI21:
>                         ovf = reloc_insn_imm(RELOC_OP_PAGE, loc, val, 12, 21,
>                                              AARCH64_INSN_IMM_ADR);
>                         break;
> -#endif
>                 case R_AARCH64_ADD_ABS_LO12_NC:
>                 case R_AARCH64_LDST8_ABS_LO12_NC:
>                         overflow_check = false;
> --
> 2.15.0.448.gf294e3d99a-goog
>

I think this change is reasonable in itself, but i do wonder how we
can ensure that the adrp instructions that GNU gold does generate are
not affected by the erratum, given that modules are partially linked
object files, not shared libraries.
