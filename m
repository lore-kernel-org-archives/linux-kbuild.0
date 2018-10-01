Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43075 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbeJBADn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 20:03:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id 80-v6so1993465pgh.10
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Oct 2018 10:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Oct 2018 10:24:42 -0700
Message-ID: <CAKwvOdkefCpuvKuAo5k82rviWnHd3FJBtNPEzSiFsZ98yqmNdw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: add -Wno-pointer-sign flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 1, 2018 at 2:45 AM Masahiro Yamada
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
>
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

Tested-by: Nick Desaulniers <ndesaulniers@google.com>
https://godbolt.org/z/7vpHIf

>
>  # disable stringop warnings in gcc 8+
>  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
