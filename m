Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28682 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFOi0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:38:26 -0400
MIME-Version: 1.0
References: <20190628051300.30678-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190628051300.30678-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 6 Jul 2019 23:37:44 +0900
Message-ID: <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -E instead of -c for __cc-option
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jun 28, 2019 at 2:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Use -E instead of -c like scripts/Kconfig.include
> This makes the compiler flag evaluation slightly faster.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



>  scripts/Kbuild.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index f641bb0aa63f..e4329b92d165 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -113,7 +113,7 @@ as-instr = $(call try-run,\
>  # __cc-option
>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
>  __cc-option = $(call try-run,\
> -       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +       $(1) -Werror $(2) $(3) -E -x c /dev/null -o "$$TMP",$(3),$(4))
>
>  # Do not attempt to build with gcc plugins during cc-option tests.
>  # (And this uses delayed resolution so the flags will be up to date.)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
