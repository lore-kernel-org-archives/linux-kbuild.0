Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34344 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbeJAX4L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 19:56:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id g12-v6so4254570pgs.1
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Oct 2018 10:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com> <1538387078-21892-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538387078-21892-3-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 1 Oct 2018 10:17:12 -0700
Message-ID: <CAKwvOd=R1FN_nmR4Wkpb=nTt+v2f2+uWOcQCFoB+B1hWzCXCXA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: add -Wno-unused-but-set-variable compiler
 flag unconditionally
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
> This flag was added by GCC 4.6, and it is recognized by Clang and
> ICC as well.

This doesn't seem to be the case for Clang:
https://godbolt.org/z/qesF5o

Nacked-by: Nick Desaulniers <ndesaulniers@google.com>


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
> index 8a23fee..2627266 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -716,7 +716,7 @@ else
>
>  # These warnings generated too much noise in a regular build.
>  # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> +KBUILD_CFLAGS += -Wno-unused-but-set-variable
>  endif
>
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
