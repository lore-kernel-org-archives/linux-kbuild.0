Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43364 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbeJCDzl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Oct 2018 23:55:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id 80-v6so509701pgh.10
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Oct 2018 14:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <1538443943-29805-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538443943-29805-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 2 Oct 2018 14:10:13 -0700
Message-ID: <CAKwvOdmUYu3Hqs1NQru8U3U8ATNc3_TT1o37tSJGzAsScRQnYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add -Wno-unused-but-set-variable flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Mon, Oct 1, 2018 at 6:33 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We have raised the compiler requirement from time to time.
> With commit cafa0010cd51 ("Raise the minimum required gcc version
> to 4.6"), the minimum for GCC is 4.6 now.
>
> This flag was added by GCC 4.6, and it is recognized by ICC as well.
>
> It is true that Clang does not support this flag but this commit is
> just touching the else part of the "ifeq ($(cc-name),clang)" check.
> Hence, Clang build is not affected.
>
> Let's rip off the cc-disable-warning switch, and see if somebody
> complains about it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Fix commit log

Mashiro, thank you for this fix.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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
