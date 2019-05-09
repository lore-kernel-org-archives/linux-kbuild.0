Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36059 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfEIHIN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:08:13 -0400
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 9 May 2019 09:07:59 +0200
Message-ID: <CA+icZUUB7EZhzfjoQcLLbSy8t=RroWNWSdMdzbvAje2wdXtJ=g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

On Thu, May 9, 2019 at 8:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
>

[ CC Kees who did the VLA removal/cleanup ]

Looks good to me.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c71ffb6f55b5..3f5e8a0f4561 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -841,7 +841,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> -KBUILD_CFLAGS += $(call cc-option,-Wvla)
> +KBUILD_CFLAGS += -Wvla
>
>  # disable pointer signed / unsigned warnings in gcc 4.0
>  KBUILD_CFLAGS += -Wno-pointer-sign
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064549.1302-1-yamada.masahiro%40socionext.com.
> For more options, visit https://groups.google.com/d/optout.
