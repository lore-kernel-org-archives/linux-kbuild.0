Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:16787 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgC1FwS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Mar 2020 01:52:18 -0400
MIME-Version: 1.0
References: <20200326055719.16755-1-masahiroy@kernel.org> <20200326055719.16755-4-masahiroy@kernel.org>
In-Reply-To: <20200326055719.16755-4-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 28 Mar 2020 14:51:32 +0900
Message-ID: <CAK7LNAR2Vg-Z2TEfU5__d2T2cBmhbgngwdQE9tshAT2XJvB4Mw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: remove AS variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: clang-built-linux <clang-built-linux@googlegroups.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Mar 26, 2020 at 2:58 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) directly in the kernel build.
>
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.
>
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>


I forgot to remove the export.




@@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=

-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE AS LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX
YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE





> ---
>
> Changes in v2:
>   - Fix breakage of CC=clang build
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index fcec84681e4e..2e12fa1cc8f3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
>  CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> @@ -535,7 +534,7 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
> +ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
>  CLANG_FLAGS    += -no-integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200326055719.16755-4-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
