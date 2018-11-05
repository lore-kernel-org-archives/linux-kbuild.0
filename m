Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:57292 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbeKES1y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 13:27:54 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Mon, 05 Nov 2018 10:09:11 +0100
From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] kbuild: consolidate Clang compiler flags
In-Reply-To: <1541386099-13118-1-git-send-email-yamada.masahiro@socionext.com>
References: <1541386099-13118-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <a55e4534ef759585088a037e4cfd8468@agner.ch>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Matthias Kaehlcke <mka@chromium.org>, Chris Fries <cfries@google.com>, Joel Stanley <joel@jms.id.au>, Daniel Axtens <dja@axtens.net>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 05.11.2018 03:48, Masahiro Yamada wrote:
> Add basic options for Clang such as --target, --prefix, --gcc-toolchain,
> -no-integrated-as to a single variable CLANG_FLAGS.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 93315eb..58c838a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -487,18 +487,17 @@ endif
>  
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_TARGET	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
> +CLANG_FLAGS	= --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
> -CLANG_PREFIX	:= --prefix=$(GCC_TOOLCHAIN_DIR)
> +CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)

So this will expand later now, is this ok?

--
Stefan

>  GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_GCC_TC	:= --gcc-toolchain=$(GCC_TOOLCHAIN)
> +CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> -KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
> -KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
> -KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
> +CLANG_FLAGS	+= $(call cc-option, -no-integrated-as)
> +KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> +KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>  endif
>  
>  RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern
> -mindirect-branch-register
