Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39466 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFfy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:35:54 -0400
MIME-Version: 1.0
References: <20200425051816.791423-1-masahiroy@kernel.org>
In-Reply-To: <20200425051816.791423-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 14:34:52 +0900
Message-ID: <CAK7LNASMbv2cyEyjZCuXM3emmOOkwGwTreKyx-XzjU4vbt0Pjw@mail.gmail.com>
Subject: Re: [PATCH] h8300: suppress error messages for 'make clean'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>

On Sat, Apr 25, 2020 at 2:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'make ARCH=h8300 clean' emits error messages as follows:
>
>   $ make ARCH=h8300 clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>   gcc: error: unrecognized command line option '-mint32'
>
> You can suppress the second one by setting the correct CROSS_COMPILE=,
> but we should not require any compiler for cleaning.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.


>
>  arch/h8300/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/h8300/boot/compressed/Makefile b/arch/h8300/boot/compressed/Makefile
> index 9e2701069bbe..5942793f77a0 100644
> --- a/arch/h8300/boot/compressed/Makefile
> +++ b/arch/h8300/boot/compressed/Makefile
> @@ -18,7 +18,7 @@ CONFIG_MEMORY_START     ?= 0x00400000
>  CONFIG_BOOT_LINK_OFFSET ?= 0x00280000
>  IMAGE_OFFSET := $(shell printf "0x%08x" $$(($(CONFIG_MEMORY_START)+$(CONFIG_BOOT_LINK_OFFSET))))
>
> -LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> +LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
>  LDFLAGS_vmlinux := -Ttext $(IMAGE_OFFSET) -estartup -T $(obj)/vmlinux.lds \
>         --defsym output=$(CONFIG_MEMORY_START)
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
