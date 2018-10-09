Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63055 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbeJIWQU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Oct 2018 18:16:20 -0400
MIME-Version: 1.0
References: <1538443943-29805-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538443943-29805-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 9 Oct 2018 23:58:00 +0900
Message-ID: <CAK7LNASykS_y8pA6LUEPasGfVVOEPuiF-q2cygQzWHvHq1mr+A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add -Wno-unused-but-set-variable flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Oct 2, 2018 at 10:33 AM Masahiro Yamada
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


Applied to linux-kbuild.

>
> Changes in v2:
>   - Fix commit log
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
Best Regards
Masahiro Yamada
