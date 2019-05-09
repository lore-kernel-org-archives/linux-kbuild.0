Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:32854 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILQI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:16:08 -0400
Date: Thu, 9 May 2019 04:16:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
Message-ID: <20190509111603.GB32696@archlinux-i9>
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Thu, May 09, 2019 at 03:45:49PM +0900, Masahiro Yamada wrote:
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

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
