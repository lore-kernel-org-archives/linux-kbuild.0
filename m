Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:45751 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753427AbdKOVxd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:53:33 -0500
Received: by mail-io0-f193.google.com with SMTP id z74so3129083iof.12
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:53:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171115213428.22559-2-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com> <20171115213428.22559-2-samitolvanen@google.com>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 15 Nov 2017 13:53:32 -0800
Message-ID: <CAGXu5jKSPEyfJFjJUP=uUjs5cfU3d04R5Hts5UzxYk+ONcBDhg@mail.gmail.com>
Subject: Re: [PATCH v2 01/18] kbuild: add ld-name macro and support for GNU gold
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, linux-arm-kernel@lists.infradead.org, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Wed, Nov 15, 2017 at 1:34 PM, Sami Tolvanen <samitolvanen@google.com> wrote:
> GNU gold may require different flags than GNU ld. Add a macro for
> detecting the linker and conditionally add gold specific flags from
> LDFLAGS_GOLD.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

(It does seem weird to have only LDFLAGS instead of KBUILD_LDFLAGS,
but that's not really a problem for this patch exactly.)

-Kees

> ---
>  Makefile               | 5 +++++
>  scripts/Kbuild.include | 4 ++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 763ab35df12a..f976af9525bf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -827,6 +827,11 @@ include scripts/Makefile.kasan
>  include scripts/Makefile.extrawarn
>  include scripts/Makefile.ubsan
>
> +# Add any flags specific to ld.gold
> +ifeq ($(ld-name),gold)
> +LDFLAGS                += $(LDFLAGS_GOLD)
> +endif
> +
>  # Add any arch overrides and user supplied CPPFLAGS, AFLAGS and CFLAGS as the
>  # last assignments
>  KBUILD_CPPFLAGS += $(ARCH_CPPFLAGS) $(KCPPFLAGS)
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 9ffd3dda3889..584d6cecd7c0 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -172,6 +172,10 @@ ld-option = $(call try-run,\
>  # Important: no spaces around options
>  ar-option = $(call try-run, $(AR) rc$(1) "$$TMP",$(1),$(2))
>
> +# ld-name
> +# Expands to either bfd or gold
> +ld-name = $(shell $(LD) -v 2>&1 | grep -q "GNU gold" && echo gold || echo bfd)
> +
>  # ld-version
>  # Note this is mainly for HJ Lu's 3 number binutil versions
>  ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
> --
> 2.15.0.448.gf294e3d99a-goog
>



-- 
Kees Cook
Pixel Security
