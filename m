Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39412 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729822AbeLNS0X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 13:26:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id c72so3218454pfc.6
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Dec 2018 10:26:22 -0800 (PST)
MIME-Version: 1.0
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com> <1544774739-13471-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544774739-13471-3-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Dec 2018 10:26:10 -0800
Message-ID: <CAKwvOd=YVMgaURxYb2J0aWN-5i_i6uRU-ot7JgO5GBPXvqakrw@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: add -Werror=implicit-int flag unconditionally
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, LKML <linux-kernel@vger.kernel.org>

On Fri, Dec 14, 2018 at 12:06 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

LGTM: https://godbolt.org/z/1Z3aG2
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bcb943e..b63699b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -425,7 +425,7 @@ LINUXINCLUDE    := \
>  KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>                    -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
> -                  -Werror-implicit-function-declaration \
> +                  -Werror-implicit-function-declaration -Werror=implicit-int \
>                    -Wno-format-security \
>                    -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
> @@ -825,9 +825,6 @@ KBUILD_CFLAGS  += $(call cc-option,-fno-stack-check,)
>  # conserve stack if available
>  KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
>
> -# disallow errors like 'EXPORT_GPL(foo);' with missing header
> -KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
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
