Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54653 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFgl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:36:41 -0400
MIME-Version: 1.0
References: <20200425060640.823362-1-masahiroy@kernel.org>
In-Reply-To: <20200425060640.823362-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:35:44 +0900
Message-ID: <CAK7LNATvEWRnEA-ewRWGqGrqOzav-ONvEXw2Q7dVwDLQ+u9xww@mail.gmail.com>
Subject: Re: [PATCH] unicore32: do not evaluate compiler's library path when cleaning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Guan Xuetao <gxt@pku.edu.cn>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Apr 25, 2020 at 3:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=unicore32 clean' emits error
> messages as follows:
>
>   $ make ARCH=unicore32 clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>   gcc: error: missing argument to '-Wframe-larger-than='
>
> We do not care compiler flags when cleaning.
>
> Use the '=' operator for lazy expansion because we do not use
> GNU_LIBC_A or GNU_LIBGCC_A when cleaning.
>
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>


Applied to linux-kbuild.


>  arch/unicore32/lib/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/unicore32/lib/Makefile b/arch/unicore32/lib/Makefile
> index 098981a01841..5af06645b8f0 100644
> --- a/arch/unicore32/lib/Makefile
> +++ b/arch/unicore32/lib/Makefile
> @@ -10,12 +10,12 @@ lib-y       += strncpy_from_user.o strnlen_user.o
>  lib-y  += clear_user.o copy_page.o
>  lib-y  += copy_from_user.o copy_to_user.o
>
> -GNU_LIBC_A             := $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
> +GNU_LIBC_A             = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
>  GNU_LIBC_A_OBJS                := memchr.o memcpy.o memmove.o memset.o
>  GNU_LIBC_A_OBJS                += strchr.o strrchr.o
>  GNU_LIBC_A_OBJS                += rawmemchr.o                  # needed by strrchr.o
>
> -GNU_LIBGCC_A           := $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
> +GNU_LIBGCC_A           = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
>  GNU_LIBGCC_A_OBJS      := _ashldi3.o _ashrdi3.o _lshrdi3.o
>  GNU_LIBGCC_A_OBJS      += _divsi3.o _modsi3.o _ucmpdi2.o _umodsi3.o _udivsi3.o
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
