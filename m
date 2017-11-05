Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:40265 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751484AbdKEDHL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Nov 2017 23:07:11 -0400
MIME-Version: 1.0
In-Reply-To: <20171102212649.108880-1-ndesaulniers@google.com>
References: <20171102212649.108880-1-ndesaulniers@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 5 Nov 2017 12:06:20 +0900
Message-ID: <CAK7LNASEWrkV5m6xxXqY6Gq84XZ1oGK86CmE+=k6Pfei=RmnuQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Set KBUILD_CFLAGS before incl. arch Makefile
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Behan Webster <behanw@converseincode.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, Greg Hackmann <ghackmann@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-03 6:26 GMT+09:00 Nick Desaulniers <ndesaulniers@google.com>:
> From: Chris Fries <cfries@google.com>
>
> Set the clang KBUILD_CFLAGS up before including arch/ Makefiles,
> so that ld-options (etc.) can work correctly.


ld-option is only used for arch/{arm64,powerpc}/Makefile

arch/arm64/Makefile:  ifeq ($(call ld-option, --fix-cortex-a53-843419),)
arch/powerpc/Makefile:LDFLAGS_vmlinux += $(call
ld-option,--orphan-handling=warn)



I think this patch makes sense when it comes along with
https://patchwork.kernel.org/patch/10030581/

but, it is now being blocked by 0-day bot
due to a x86 problem.





> This fixes errors with clang such as ld-options trying to CC
> against your host architecture, but LD trying to link against
> your target architecture.
>
> We didn't notice this problem on Android, because we took the original
> LLVMLinux patch into our 4.4 kernels, which did not have this issue. We
> ran into this taking the proper upstream patch on newer kernel versions.
> The original LLVMLinux patch can be seen at:
>
> http://git.linuxfoundation.org/?p=llvmlinux/kernel.git;a=blobdiff;f=Makefile;h=389006c4ef494cda3a1ee52bf355618673ab4f31;hp=e41a3356abee83f08288362950bfceebd25ec3c2;hb=ef9126da11b18ff34eb1f01561f53c378860336c;hpb=f800c25b7a762d445ba1439a2428c8362157eba6
>
> It seems that when the patch was re-upstreamed, a V2 was requested that
> moved the definition of Clang's target triple to be later in the top
> level Makefile than the inclusion of the arch specific Makefile,
> breaking macros like ld-option when cross compiling. V2 was requested
> at:

But, ld-option is defines as follows in llvm-linux tree (and mainline too):

ld-option = $(call try-run,\
        $(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o
"$$TMP",$(1),$(2))


ld-option does not depend on any pre-defined flags.


The location of CLANG_GCC_TC define
only matters after your patch is applied, right?

Did my request for v2 break anything?


One more thing: this patch does not apply to kbuild tree.



> https://lkml.org/lkml/2017/4/21/116
>
> Signed-off-by: Chris Fries <cfries@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 5f91a28a3cea..72ea86157114 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -512,6 +512,38 @@ ifneq ($(filter install,$(MAKECMDGOALS)),)
>          endif
>  endif
>
> +ifeq ($(cc-name),clang)
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
> +GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
> +endif
> +ifneq ($(GCC_TOOLCHAIN),)
> +CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
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
>  ifeq ($(mixed-targets),1)
>  # ===========================================================================
>  # We're called with mixed targets (*config and build targets).
> @@ -695,38 +727,6 @@ ifdef CONFIG_CC_STACKPROTECTOR
>  endif
>  KBUILD_CFLAGS += $(stackp-flag)
>
> -ifeq ($(cc-name),clang)
> -ifneq ($(CROSS_COMPILE),)
> -CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
> -GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
> -endif
> -ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
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
> 2.15.0.403.gc27cc4dac6-goog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
