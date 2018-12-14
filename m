Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43690 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730623AbeLNS3O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 13:29:14 -0500
Received: by mail-pg1-f196.google.com with SMTP id v28so3050891pgk.10
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Dec 2018 10:29:13 -0800 (PST)
MIME-Version: 1.0
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 14 Dec 2018 10:29:02 -0800
Message-ID: <CAKwvOdk9GVtaChCg0LhjyzY5zrqc3+cDdUpF-ui_+s8ZXzZ=Vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: add -fno-PIE flag unconditionally
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

The oldest GCC build that godbolt has (4.1) even recognizes it.
https://godbolt.org/z/buDBUr
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f2c3423..3bbc16a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -422,9 +422,9 @@ LINUXINCLUDE    := \
>                 -I$(objtree)/include \
>                 $(USERINCLUDE)
>
> -KBUILD_AFLAGS   := -D__ASSEMBLY__
> +KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
>  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> -                  -fno-strict-aliasing -fno-common -fshort-wchar \
> +                  -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>                    -Werror-implicit-function-declaration \
>                    -Wno-format-security \
>                    -std=gnu89
> @@ -510,9 +510,6 @@ RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc
>  export RETPOLINE_CFLAGS
>  export RETPOLINE_VDSO_CFLAGS
>
> -KBUILD_CFLAGS  += $(call cc-option,-fno-PIE)
> -KBUILD_AFLAGS  += $(call cc-option,-fno-PIE)
> -
>  # check for 'asm goto'
>  ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
>    CC_HAVE_ASM_GOTO := 1
> --
> 2.7.4
>


-- 
Thanks,
~Nick Desaulniers
