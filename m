Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:61880 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfDKOY6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Apr 2019 10:24:58 -0400
MIME-Version: 1.0
References: <1554631398-29297-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1554631398-29297-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 11 Apr 2019 23:24:17 +0900
Message-ID: <CAK7LNATZOhGAF0d5fvwHb4ATYYdtkmZNjtSMvcM+bv8CsPWfhw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded dependency for include/config/kernel.release
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Apr 7, 2019 at 7:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This is unneeded since commit 43fee2b23895 ("kbuild: do not redirect
> the first prerequisite for filechk").
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild.


> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 895022b..10643c3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1067,7 +1067,7 @@ filechk_kernel.release = \
>         echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
>
>  # Store (new) KERNELRELEASE string in include/config/kernel.release
> -include/config/kernel.release: $(srctree)/Makefile FORCE
> +include/config/kernel.release: FORCE
>         $(call filechk,kernel.release)
>
>  # Additional helpers built in scripts/
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
