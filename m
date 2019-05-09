Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56297 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbfEIHLO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:11:14 -0400
MIME-Version: 1.0
References: <20190509064635.1445-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064635.1445-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 9 May 2019 09:11:02 +0200
Message-ID: <CA+icZUV03ZF_FWMMyY=36-zQZPWO0YUBuSs9bjQqpmXJzVYYRA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add some extra warning flags unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, May 9, 2019 at 8:47 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> These flags are documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option / cc-disable-warning switches.
>

BTW, is this a speedup when doing CC/LD FLAGS etc checks unconditionally?
Asking in general - do you have any numbers :-)?

- Sedat -

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
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
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064635.1445-1-yamada.masahiro%40socionext.com.
> For more options, visit https://groups.google.com/d/optout.
