Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62016 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933725AbdKPCdL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 21:33:11 -0500
MIME-Version: 1.0
In-Reply-To: <20171115204231.34914-1-ndesaulniers@google.com>
References: <CAK7LNAS1NaqPRhK6FOXN=YTMhLagpSrR2=tXn-uWZbpzr=NeoQ@mail.gmail.com>
 <20171115204231.34914-1-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 Nov 2017 11:32:19 +0900
Message-ID: <CAK7LNAQSXjxAQgOy1HFbwRXHaUojjEOeFf2OMaB9XkPpkkJfhQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nick,


2017-11-16 5:42 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> From: Chris Fries <cfries@google.com>
>
> Set the clang KBUILD_CFLAGS up before including arch/ Makefiles,
> so that ld-options (etc.) can work correctly.
>
> This fixes errors with clang such as ld-options trying to CC
> against your host architecture, but LD trying to link against
> your target architecture.
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Chris Fries <cfries@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Tested-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes since v2:
> * Move clang block lower in Makefile, so as not to run it when running
>   configuration, per Masahiro.
> * Remove paragraphs from commit message, per Masahiro.
> * Add Masahiro to Suggested-by line in commit message.
>
>  Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a7476e6934f1..b3352becc7df 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -608,6 +608,38 @@ CFLAGS_GCOV        := -fprofile-arcs -ftest-coverage -fno-tree-loop-im $(call cc-disabl
>  CFLAGS_KCOV    := $(call cc-option,-fsanitize-coverage=trace-pc,)
>  export CFLAGS_GCOV CFLAGS_KCOV
>
> +ifeq ($(cc-name),clang)
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_TARGET   := -target $(notdir $(CROSS_COMPILE:%-=%))
> +GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
> +endif
> +ifneq ($(GCC_TOOLCHAIN),)
> +CLANG_GCC_TC   := -gcc-toolchain $(GCC_TOOLCHAIN)
> +endif
> +KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> +KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> +KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> +KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> +KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> +KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> +# Quiet clang warning: comparison of unsigned expression < 0 is always false
> +KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> +# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> +# source of a reference will be _MergedGlobals and not on of the whitelisted names.
> +# See modpost pattern 2
> +KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> +KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
> +KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> +KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> +else
> +
> +# These warnings generated too much noise in a regular build.
> +# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> +endif
> +
>  # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
>  # values of the respective KBUILD_* variables
>  ARCH_CPPFLAGS :=
> @@ -682,38 +714,6 @@ ifdef CONFIG_CC_STACKPROTECTOR
>  endif
>  KBUILD_CFLAGS += $(stackp-flag)
>
> -ifeq ($(cc-name),clang)
> -ifneq ($(CROSS_COMPILE),)
> -CLANG_TARGET   := -target $(notdir $(CROSS_COMPILE:%-=%))
> -GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
> -endif
> -ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_GCC_TC   := -gcc-toolchain $(GCC_TOOLCHAIN)
> -endif
> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> -KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> -# Quiet clang warning: comparison of unsigned expression < 0 is always false
> -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> -# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> -# source of a reference will be _MergedGlobals and not on of the whitelisted names.
> -# See modpost pattern 2
> -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> -KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
> -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> -KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> -else
> -
> -# These warnings generated too much noise in a regular build.
> -# Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> -endif
> -
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS  += -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  else
> --
> 2.15.0.448.gf294e3d99a-goog
>




BTW, I notice another issue.


If we move clang settings before including arch Makefile,
"ifneq ($(CROSS_COMPILE),)" comes early.

Some arch Makefiles (arch/mips/Makefile, arch/blackfin/Makefile, etc.)
set CROSS_COMPILE there if CROSS_COMPILE is not given.

Then, we have a conflict between two requirements among arch.

[1] arm64, powerpc use ld-option in their Makefile.
    So, clang flags must be set before inc. arch Makefile.
[2] mips, blackfin, etc. may set CROSS_COMPILE in their Makefile.
    So, we want to reference CROSS_COMPILE only after inc. arch Makefile


I have no idea how to solve it.


At this moment, I guess clang is intended to support
only limited architectures.

It might be OK to be compromised here.




-- 
Best Regards
Masahiro Yamada
