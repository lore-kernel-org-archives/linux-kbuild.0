Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17668 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfFOK4q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Jun 2019 06:56:46 -0400
MIME-Version: 1.0
References: <20190604181453.30422-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190604181453.30422-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 15 Jun 2019 19:55:59 +0900
Message-ID: <CAK7LNARpRQo1o65EGm2kzDfhGy-C0u=AJ0K1q+HR4uwJ_aNT1A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: run olddefconfig instead of oldconfig after
 merging fragments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 5, 2019 at 3:15 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> 'make olddefconfig' is non-interactive, so we can drop 'yes'.
> The behavior is equivalent.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/kconfig.



>
>  scripts/kconfig/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ab30fe724c43..7656e1137b6b 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -94,7 +94,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
>  %.config: $(obj)/conf
>         $(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> -       +$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
> +       $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>
>  PHONY += kvmconfig
>  kvmconfig: kvm_guest.config
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
