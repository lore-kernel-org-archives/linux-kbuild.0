Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35967 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730123AbeLNSeD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 13:34:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id g9so3105454plo.3
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Dec 2018 10:34:03 -0800 (PST)
MIME-Version: 1.0
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com> <1544774739-13471-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544774739-13471-2-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Dec 2018 10:33:51 -0800
Message-ID: <CAKwvOdkSSb-EECgCmYnW40Mbd4ibSf22wqUBqaT_X7g7Sn_9UQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: add -Werror=strict-prototype flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Fri, Dec 14, 2018 at 12:06 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> -Wstrict-prototype is added to KBUILD_CFLAGS first, then overridden

-Wstrict-prototypes (plural)

> by -Werror=strict-prototype later.

-Werror=strict-prototypes (plural)

LGTM: https://godbolt.org/z/DyEpmU

If you would mind updating the commit message (and subject), then:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Let's add -Werror=strict-prototypes unconditionally because it is
> supported by GCC 4.6, and also by Clang.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 3bbc16a..bcb943e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,7 +423,7 @@ LINUXINCLUDE    := \
>                 $(USERINCLUDE)
>
>  KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
> -KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> +KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>                    -Werror-implicit-function-declaration \
>                    -Wno-format-security \
> @@ -828,9 +828,6 @@ KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
>  # disallow errors like 'EXPORT_GPL(foo);' with missing header
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
>
> -# require functions to have arguments in prototypes, not empty 'int foo()'
> -KBUILD_CFLAGS   += $(call cc-option,-Werror=strict-prototypes)
> -
>  # Prohibit date/time macros, which would make the build non-deterministic
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
>
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
