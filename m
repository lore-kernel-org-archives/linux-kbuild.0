Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42490 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbeJBAAD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 20:00:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id l9-v6so9695943pff.9
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Oct 2018 10:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com> <1538387078-21892-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538387078-21892-2-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Oct 2018 10:21:02 -0700
Message-ID: <CAKwvOd=tpuVaEey2cMLJ5=MF6XZ_sYXd-Qw5xww=+LHZ3rWHdQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: add -Wdeclaration-after-statement flag unconditionally
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
> This flag has been here since the pre-git era.  It is documented in
> the GCC 4.6 manual, and it is recognized by Clang and ICC as well.
>
> Let's rip off the cc-option switch, and see if somebody complains
> about it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 505a324..8a23fee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -797,7 +797,7 @@ endif
>  NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>
>  # warn about C99 declaration after statement
> -KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
> +KBUILD_CFLAGS += -Wdeclaration-after-statement

Tested-by: Nick Desaulniers <ndesaulniers@google.com>
https://godbolt.org/z/TP5722

>
>  # disable pointer signed / unsigned warnings in gcc 4.0
>  KBUILD_CFLAGS += -Wno-pointer-sign
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
