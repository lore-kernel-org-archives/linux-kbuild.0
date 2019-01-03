Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24115 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfACBPU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jan 2019 20:15:20 -0500
MIME-Version: 1.0
References: <1546244651-10447-1-git-send-email-yamada.masahiro@socionext.com> <1546244651-10447-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1546244651-10447-4-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Jan 2019 10:14:30 +0900
Message-ID: <CAK7LNAThpS+W_aUr3V9EN7V5A67mjvhOWAU1XZGDvS4ByBfeVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] kbuild: make LINUX_VERSION_CODE in <linux/version.h>
 more readable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Dec 31, 2018 at 5:25 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Makefile does not need to calculate LINUX_VERSION_CODE.
> Let's leave it to the preprocessor.
>
> This commit changes include/generated/uapi/linux/version.h as follows:
>
> Before:
>
>   #define LINUX_VERSION_CODE 267264
>   #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
>
> After:
>
>   #define LINUX_VERSION_CODE KERNEL_VERSION(4, 20, 0)
>   #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
>
> The latter is more human-readable in my opinion.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


I retract this patch
because it would cause a build error.




> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 437d603..1ebf5ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1131,8 +1131,7 @@ define filechk_utsrelease.h
>  endef
>
>  define filechk_version.h
> -       echo \#define LINUX_VERSION_CODE $(shell                         \
> -       expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> +       echo '#define LINUX_VERSION_CODE KERNEL_VERSION($(VERSION), $(PATCHLEVEL), $(SUBLEVEL))'; \
>         echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
>  endef
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
