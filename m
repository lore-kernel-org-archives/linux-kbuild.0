Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51684 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbeIRIhi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 04:37:38 -0400
MIME-Version: 1.0
In-Reply-To: <20180918023157.23951-1-stefan@agner.ch>
References: <20180918023157.23951-1-stefan@agner.ch>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 18 Sep 2018 12:06:01 +0900
Message-ID: <CAK7LNASz4zabEdjO2AVscWbqGyjpEBE6Li7busC_sbYkuuJ7tQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow to use GCC toolchain not in Clang search path
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stefan,

2018-09-18 11:31 GMT+09:00 Stefan Agner <stefan@agner.ch>:
> When using a GCC cross toolchain which is not in a compiled in
> Clang search path, Clang reverts to the system assembler and
> linker. This leads to assembler or linker errors, depending on
> which tool is first used for a given architecture.
>
> It seems that Clang is not searching $PATH for a matching
> assembler or linker.


The current code passes the absolute path of toolchains
to --gcc-toolchain option.
In my understanding, this is enough for Clang
to find the proper linker and the assembler.


Why is the --prefix option also needed ?


Am I missing something?



> Make sure that Clang picks up the correct assembler or linker by
> passing the cross compilers bin directory as search path.
>
> This allows to use Clang provided by distributions with GCC
> toolchains not in /usr/bin.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/78
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> Nick, I removed your Reviewed-by since I had to change variable
> assignment slightly...
>
>  Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4d5c883a98e5..d5de2db4b549 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -495,13 +495,15 @@ endif
>  ifeq ($(cc-name),clang)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_TARGET   := --target=$(notdir $(CROSS_COMPILE:%-=%))
> -GCC_TOOLCHAIN  := $(realpath $(dir $(shell which $(LD)))/..)
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> +CLANG_PREFIX   := --prefix=$(GCC_TOOLCHAIN_DIR)
> +GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_GCC_TC   := --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
> +KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> +KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
>  KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
>  KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
>  endif
> --
> 2.19.0
>



-- 
Best Regards
Masahiro Yamada
