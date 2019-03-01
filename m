Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41316 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725978AbfCAMdH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 07:33:07 -0500
Date: Fri, 1 Mar 2019 13:33:04 +0100
From: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH] scripts/kconfig/Makefile: use KCONFIG_CONFIG if set
Message-ID: <20190301123304.GA2318@dell5510>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20190221215901.23970-1-ar@cs.msu.ru>
 <20190221215901.23970-2-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221215901.23970-2-ar@cs.msu.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>

Hi Arseny,

> In a kernel source tree:

> % make mrproper
> % make KCONFIG_CONFIG=.myconfig kvmconfig'
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   LEX     scripts/kconfig/zconf.lex.c
>   YACC    scripts/kconfig/zconf.tab.h
>   HOSTCC  scripts/kconfig/zconf.lex.o
>   YACC    scripts/kconfig/zconf.tab.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> The base file '.config' does not exist.  Exit.
> make[1]: *** [scripts/kconfig/Makefile:96: kvm_guest.config] Error 1
> make: *** [Makefile:538: kvmconfig] Error 2

> Essentially `make kvmconfig' (and probably other similar targets)
> did ignore KCONFIG_CONFIG set to a different filename.

> If KCONFIG_CONFIG is set, use it; otherwise behave as if it was set
> to `.config'.

> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>

Good catch :).
Yes, many targets are affected to it: xenconfig, tinyconfig + archs:
rm -f .config; make ARCH=arm KCONFIG_CONFIG=.myconfig dram_0xd0000000.config

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>


Kind regards,
Petr
> ---
>  scripts/kconfig/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 181973509a05..1c7ac07def4d 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -93,7 +93,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c

>  %.config: $(obj)/conf
>  	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(configfiles)
>  	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig

>  PHONY += kvmconfig
