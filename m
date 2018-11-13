Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59240 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbeKNJ0a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Nov 2018 04:26:30 -0500
MIME-Version: 1.0
References: <1541473495-25262-1-git-send-email-yamada.masahiro@socionext.com> <1541473495-25262-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1541473495-25262-2-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 14 Nov 2018 08:25:17 +0900
Message-ID: <CAK7LNASUq-bJKsAWtX1bnRHsf+AhGCm_fVToy2Gpyc5BbW0K5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: consolidate Clang compiler flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Stefan Agner <stefan@agner.ch>, Matthias Kaehlcke <mka@chromium.org>, Joel Stanley <joel@jms.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 6, 2018 at 12:06 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Collect basic Clang options such as --target, --prefix, --gcc-toolchain,
> -no-integrated-as into a single variable CLANG_FLAGS so that it can be
> easily reused in other parts of Makefile.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---


Applied to linux-kbuild.


> Changes in v2:
>  - Use := flavor instead of = because $(CLANG_FLAGS) is expanded soon anyway
>
>  Makefile | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index da11700..e173a73 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -487,18 +487,17 @@ endif
>
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
> +CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> -CLANG_PREFIX   := --prefix=$(GCC_TOOLCHAIN_DIR)
> +CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)
>  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
> +CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> -KBUILD_CFLAGS += -no-integrated-as
> -KBUILD_AFLAGS += -no-integrated-as
> +CLANG_FLAGS    += -no-integrated-as
> +KBUILD_CFLAGS  += $(CLANG_FLAGS)
> +KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  endif
>
>  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
