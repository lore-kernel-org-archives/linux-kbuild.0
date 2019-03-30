Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60294 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfC3FMe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 01:12:34 -0400
MIME-Version: 1.0
References: <1553580672-29551-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553580672-29551-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 30 Mar 2019 14:11:49 +0900
Message-ID: <CAK7LNARrTy7sFfO7FF=Sadrz7FygRMcfe9oG7bKbWni1PfszRg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move RETPOLINE flags below config-targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 26, 2019 at 3:11 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> When you run a "make *config" target, the retpoline compiler flags
> are evaluated for nothing because the code is located above the
> 'ifeq ($(config-targets),1)'.
>
> Move it a bit below to avoid unneeded computation in the Kconfig stage.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
>  Makefile | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 1b361bd..66a8e04 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -519,15 +519,6 @@ KBUILD_AFLAGS      += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>
> -RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> -RETPOLINE_VDSO_CFLAGS_GCC := -mindirect-branch=thunk-inline -mindirect-branch-register
> -RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
> -RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
> -RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
> -RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
> -export RETPOLINE_CFLAGS
> -export RETPOLINE_VDSO_CFLAGS
> -
>  # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
>  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
>  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> @@ -624,6 +615,15 @@ ifdef CONFIG_FUNCTION_TRACER
>    CC_FLAGS_FTRACE := -pg
>  endif
>
> +RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> +RETPOLINE_VDSO_CFLAGS_GCC := -mindirect-branch=thunk-inline -mindirect-branch-register
> +RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
> +RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
> +RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
> +RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
> +export RETPOLINE_CFLAGS
> +export RETPOLINE_VDSO_CFLAGS
> +
>  # The arch Makefile can set ARCH_{CPP,A,C}FLAGS to override the default
>  # values of the respective KBUILD_* variables
>  ARCH_CPPFLAGS :=
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
