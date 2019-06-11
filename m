Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36837 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405266AbfFKThr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Jun 2019 15:37:47 -0400
Received: by mail-pl1-f193.google.com with SMTP id d21so5545813plr.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jun 2019 12:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190611184331.44242-1-natechancellor@gmail.com>
In-Reply-To: <20190611184331.44242-1-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 11 Jun 2019 12:37:35 -0700
Message-ID: <CAKwvOdkxjweo=s-9tBNGwyjDJfyDfHjT7+DS+-Q-Sx7Ms8uoPg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Peter Smith <peter.smith@linaro.org>

On Tue, Jun 11, 2019 at 11:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> Suggested-by: Peter Smith <peter.smith@linaro.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

I verified this has no negative effect with -Qunused-arguments and the
relative position of the two flags.  The build failure is much more
explicit with this patch:
> error: unknown warning option '-Wno-psabi' [-Werror,-Wunknown-warning-option]

Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index b81e17261250..5f9d09bd2252 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -528,6 +528,7 @@ ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  CLANG_FLAGS    += -no-integrated-as
> +CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.22.0
>


-- 
Thanks,
~Nick Desaulniers
