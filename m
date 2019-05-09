Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46919 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILRU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:17:20 -0400
Date: Thu, 9 May 2019 04:17:15 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
Message-ID: <20190509111715.GC32696@archlinux-i9>
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509064635.1445-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, May 09, 2019 at 03:46:35PM +0900, Masahiro Yamada wrote:
> These flags are documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option / cc-disable-warning switches.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  scripts/Makefile.extrawarn | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 523c4cafe2dc..3ab8d1a303cd 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -23,15 +23,16 @@ warning-  := $(empty)
>  warning-1 := -Wextra -Wunused -Wno-unused-parameter
>  warning-1 += -Wmissing-declarations
>  warning-1 += -Wmissing-format-attribute
> -warning-1 += $(call cc-option, -Wmissing-prototypes)
> +warning-1 += -Wmissing-prototypes
>  warning-1 += -Wold-style-definition
> -warning-1 += $(call cc-option, -Wmissing-include-dirs)
> +warning-1 += -Wmissing-include-dirs
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
>  warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-option, -Wpacked-not-aligned)
>  warning-1 += $(call cc-option, -Wstringop-truncation)
> -warning-1 += $(call cc-disable-warning, missing-field-initializers)
> -warning-1 += $(call cc-disable-warning, sign-compare)
> +# The following turn off the warnings enabled by -Wextra
> +warning-1 += -Wno-missing-field-initializers
> +warning-1 += -Wno-sign-compare
>  
>  warning-2 := -Waggregate-return
>  warning-2 += -Wcast-align
> @@ -39,8 +40,8 @@ warning-2 += -Wdisabled-optimization
>  warning-2 += -Wnested-externs
>  warning-2 += -Wshadow
>  warning-2 += $(call cc-option, -Wlogical-op)
> -warning-2 += $(call cc-option, -Wmissing-field-initializers)
> -warning-2 += $(call cc-option, -Wsign-compare)
> +warning-2 += -Wmissing-field-initializers
> +warning-2 += -Wsign-compare
>  warning-2 += $(call cc-option, -Wmaybe-uninitialized)
>  warning-2 += $(call cc-option, -Wunused-macros)
>  
> -- 
> 2.17.1
> 
