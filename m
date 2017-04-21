Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:55767 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1036627AbdDUIYl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 04:24:41 -0400
MIME-Version: 1.0
In-Reply-To: <20170410210904.68211-1-mka@chromium.org>
References: <20170410210904.68211-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Apr 2017 17:24:31 +0900
Message-ID: <CAK7LNASiT1u218kOAXuc9Ai4oeFZBzxrdhBNUYHnYWF_eFTB6w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add better clang cross build support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Matthias,


2017-04-11 6:09 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:


> COMPILER is previously set to "clang" if CC=3Dclang was set from the
> make command line.  So -target and -gcc-toolchain can be added to CC,
> since we already know that it is set.

Can you reword or delete this paragraph?
I think this is confusing because COMPILER was replaced with cc-name
by commit 5631d9c4.




> Clang will fallback to using things like ld, as, and libgcc if
> (respectively) one of the llvm linkers isn't available, the integrated
> assembler is turned off, or an appropriately cross-compiled version of
> compiler-rt isn't available. To this end, you can specify the path to
> this fallback gcc toolchain with GCC_TOOLCHAIN.
>
> From: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Reviewed-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
> Reviewed-by: Mark Charlebois <charlebm@gmail.com>
> Signed-off-by: Greg Hackmann <ghackmann@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v2:
> - Fix GCC_TOOLCHAIN definition. $(LD) is needed to link the kernel, use
>   its path to determine the installation prefix of the toolchain.
>   (From: Greg Hackmann <ghackmann@google.com>)
>
>  Makefile | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e11989d36c87..d3a02786bb53 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -375,6 +375,16 @@ LDFLAGS_vmlinux =3D
>  CFLAGS_GCOV    =3D -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno=
-maybe-uninitialized
>  CFLAGS_KCOV    :=3D $(call cc-option,-fsanitize-coverage=3Dtrace-pc,)
>
> +ifeq ($(cc-name),clang)
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_TARGET   :=3D -target $(notdir $(CROSS_COMPILE:%-=3D%))
> +GCC_TOOLCHAIN  :=3D $(realpath $(dir $(shell which $(LD)))/..)
> +endif
> +ifneq ($(GCC_TOOLCHAIN),)
> +CLANG_GCC_TC   :=3D -gcc-toolchain $(GCC_TOOLCHAIN)
> +endif
> +CLANG_FLAGS    :=3D $(CLANG_TARGET) $(CLANG_GCC_TC)
> +endif
>
>  # Use USERINCLUDE when you must reference the UAPI directories only.
>  USERINCLUDE    :=3D \
> @@ -395,18 +405,18 @@ LINUXINCLUDE    :=3D \
>
>  LINUXINCLUDE   +=3D $(filter-out $(LINUXINCLUDE),$(USERINCLUDE))
>
> -KBUILD_CPPFLAGS :=3D -D__KERNEL__
> +KBUILD_CPPFLAGS :=3D -D__KERNEL__ $(CLANG_FLAGS)
>
>  KBUILD_CFLAGS   :=3D -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common \
>                    -Werror-implicit-function-declaration \
>                    -Wno-format-security \
> -                  -std=3Dgnu89 $(call cc-option,-fno-PIE)
> -
> +                  -std=3Dgnu89 $(call cc-option,-fno-PIE) \
> +                  $(CLANG_FLAGS)
>
>  KBUILD_AFLAGS_KERNEL :=3D
>  KBUILD_CFLAGS_KERNEL :=3D
> -KBUILD_AFLAGS   :=3D -D__ASSEMBLY__ $(call cc-option,-fno-PIE)
> +KBUILD_AFLAGS   :=3D -D__ASSEMBLY__ $(call cc-option,-fno-PIE) $(CLANG_F=
LAGS)


This adds multiple -gcc-toolchain because both KBUILD_CPPFLAGS and KBUILD_C=
FLAGS
are added to c_flags.   See scripts/Makefile.lib

orig_c_flags   =3D $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFL=
AGS) \
                 $(ccflags-y) $(CFLAGS_$(basetarget).o)


Pre-processing is related to the front-end part,
so -target and -gcc-toolchain are not necessary for KBUILD_CPPFLAGS?

Maybe, adding it to KBUILD_CFLAGS and KBUILD_AFLAGS could be enough?




Is it possible to move these to around line 700?

ifeq ($(cc-name),clang)
   < add here ? >
KBUILD_CPPFLAGS +=3D $(call cc-option,-Qunused-arguments,)
KBUILD_CPPFLAGS +=3D $(call cc-option,-Wno-unknown-warning-option,)



I do not want to sprinkle ugly ifeq ($(cc-name,clang).





--=20
Best Regards
Masahiro Yamada
