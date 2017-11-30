Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28079 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752624AbdK3MWt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 07:22:49 -0500
MIME-Version: 1.0
In-Reply-To: <20171129000011.55235-3-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com> <20171129000011.55235-3-samitolvanen@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 30 Nov 2017 21:21:49 +0900
Message-ID: <CAK7LNAQg4+eyR-mggswxvkBSxrdwFTQ3A733cSs4965UzO0qgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: add cc-if-name-version and compiler-specific variants
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

2017-11-29 9:00 GMT+09:00 Sami Tolvanen <samitolvanen@google.com>:
> This change adds macros for testing both compiler name and
> version. Current cc-version, cc-ifversion etc. macros that test
> gcc version are left unchanged to prevent compatibility issues
> with existing tests.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/Kbuild.include | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 065324a8046f..b6d7d347b203 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -215,6 +215,37 @@ cc-disable-warning = $(call try-run-cached,\
>  # Expands to either gcc or clang
>  cc-name = $(call shell-cached,$(CC) -v 2>&1 | grep -q "clang version" && echo clang || echo gcc)
>
> +# __cc-version
> +# Returns compiler version
> +__cc-version = $(shell $(CONFIG_SHELL) $(srctree)/scripts/$(cc-name)-version.sh $(CC))
> +
> +# __cc-fullversion
> +# Returns full compiler version
> +__cc-fullversion = $(shell $(CONFIG_SHELL) \
> +       $(srctree)/scripts/$(cc-name)-version.sh -p $(CC))
> +
> +# cc-if-name-version
> +# Matches compiler name and version
> +# Usage:  EXTRA_CFLAGS += $(call cc-if-name-version, gcc, -lt, 0402, -O1)
> +cc-if-name-version = $(shell [ $(cc-name) == $(1) ] && [ $(__cc-version) $(2) $(3) ] && echo $(4) || echo $(5))


BTW, did this patch work in your test?

After applying this series, I saw "/bin/sh: 1: [: gcc: unexpected operator"


$ make ARCH=arm64  CROSS_COMPILE=aarch64-linux-gnu-   defconfig
/bin/sh: 1: [: gcc: unexpected operator
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#


I needed to change

[ $(cc-name) == $(1) ]

into

[ $(cc-name) = $(1) ]

to make it work.



> +# cc-if-name-fullversion
> +# Matches compiler name and full version
> +# Usage:  EXTRA_CFLAGS += $(call cc-if-name-fullversion, gcc, -lt, 040502, -O1)
> +cc-if-name-fullversion = $(shell [ $(cc-name) == $(1) ] && [ $(__cc-fullversion) $(2) $(3) ] && echo $(4) || echo $(5))

Ditto.

I fixed '==' into '=' to make this work as expected.




As for the macro names, maybe

__cc-ifversion, __cc-if-fullversion for consistency?




> +# gcc-ifversion
> +gcc-ifversion = $(call cc-if-name-version, gcc, $(1), $(2), $(3), $(4))
> +
> +# gcc-if-fullversion
> +gcc-if-fullversion = (call cc-if-name-fullversion, gcc, $(1), $(2), $(3), $(4))
> +
> +# clang-ifversion
> +clang-ifversion =  $(call cc-if-name-version, clang, $(1), $(2), $(3), $(4))
> +
> +# clang-if-fullversion
> +clang-if-fullversion = (call cc-if-name-fullversion, clang, $(1), $(2), $(3), $(4))
> +

I think you can do like follows to avoid code duplication.

# backward compatibility
cc-ifversion = $(gcc-ifversion)
cc-if-fullversion = $(gcc-if-fullversion)




>  # cc-version
>  cc-version = $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC))
>
> --
> 2.15.0.417.g466bffb3ac-goog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
