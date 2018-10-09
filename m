Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19076 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbeJIWPy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 18:15:54 -0400
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Oct 2018 23:57:41 +0900
Message-ID: <CAK7LNASmxy=FQ0_Qg7ryNnCyh8uR_ffkT5L0P4s015F+1egJYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: add -Wno-pointer-sign flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Oct 1, 2018 at 6:45 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We have raised the compiler requirement from time to time.
> With commit cafa0010cd51 ("Raise the minimum required gcc version
> to 4.6"), the minimum for GCC is 4.6 now.
>
> The -Wno-pointer-sign has been here since the pre-git era.  It is
> documented in the GCC 4.6 manual, and it is recognized by Clang
> and ICC as well.
>
> Let's rip off the cc-disable-warning switch, and see if somebody
> complains about it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c6d1f2f..505a324 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -800,7 +800,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>
>  # disable pointer signed / unsigned warnings in gcc 4.0
> -KBUILD_CFLAGS += $(call cc-disable-warning, pointer-sign)
> +KBUILD_CFLAGS += -Wno-pointer-sign
>
>  # disable stringop warnings in gcc 8+
>  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
