Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:37234 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfGFOqQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:46:16 -0400
MIME-Version: 1.0
References: <20190623161328.22461-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190623161328.22461-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 6 Jul 2019 23:45:15 +0900
Message-ID: <CAK7LNARCHQ3Tv91txwnLAVwFuZaOJeA+tJe2TpJ0NA8Q6ThnDw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: fix missed rebuild of modules.builtin
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jun 24, 2019 at 1:13 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Unlike modules.order, modules.builtin is not rebuilt every time.
> Once modules.builtin is created, it will not be updated until
> auto.conf or tristate.conf is changed.
>
> So, it misses to notice a change in Makefile, for example, renaming
> of modules.
>
> Kbuild must always descend into directories for modules.builtin too.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Both applied to linux-kbuild.

>
>  Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9514dac2660a..19c33bc69bb1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1289,12 +1289,16 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
>
> -modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
> -       $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> +modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
>
> -%/modules.builtin: include/config/auto.conf include/config/tristate.conf
> -       $(Q)$(MAKE) $(modbuiltin)=$*
> +modules.builtin: $(modbuiltin-dirs)
> +       $(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
>
> +PHONY += $(modbuiltin-dirs)
> +# tristate.conf is not included from this Makefile. Add it as a prerequisite
> +# here to make it self-healing in case somebody accidentally removes it.
> +$(modbuiltin-dirs): include/config/tristate.conf
> +       $(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
>
>  # Target to prepare building external modules
>  PHONY += modules_prepare
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
