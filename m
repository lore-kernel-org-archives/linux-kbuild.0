Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35918 "EHLO
	conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751076AbcGFCAV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Jul 2016 22:00:21 -0400
MIME-Version: 1.0
In-Reply-To: <20160704142608.2069991-1-arnd@arndb.de>
References: <20160704142608.2069991-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Jul 2016 11:00:01 +0900
Message-ID: <CAK7LNAT4mZ_W46wvmM9BWY8VDznfi7mXOHDQvV2sXXrUiH5sVQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Arnd,


2016-07-04 23:25 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> The introduction of "make *.config" as a shorthand for merging configuration
> files unfortunately introduced some build warnings that we see in every
> single run of the various build bots testing tinyconfig:

I am not convinced with this statement.

Why do you think 63a91033d52e is a bad commit?


With/without 63a91033d52e, I see the same warnings.


$ git log --oneline  -1
63a9103 kbuild: add generic mergeconfig target, %.config
$ make -s mrproper
$ make tinyconfig >/dev/null
.config:871:warning: override: KERNEL_XZ changes choice state
.config:873:warning: override: SLOB changes choice state
.config:874:warning: override: NOHIGHMEM changes choice state
$ git checkout HEAD^
Previous HEAD position was 63a9103... kbuild: add generic mergeconfig
target, %.config
HEAD is now at bc8f8f5... merge_config.sh: rename MAKE to RUNMAKE
$ git log --oneline  -1
bc8f8f5 merge_config.sh: rename MAKE to RUNMAKE
$ make -s mrproper
$ make tinyconfig >/dev/null
.config:871:warning: override: KERNEL_XZ changes choice state
.config:873:warning: override: SLOB changes choice state
.config:874:warning: override: NOHIGHMEM changes choice state







> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ebced77deb9c..35d0e191fe3f 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -125,8 +125,8 @@ xenconfig: xen.config
>         @:
>
>  PHONY += tinyconfig
> -tinyconfig:
> -       $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
> +tinyconfig: $(obj)/conf
> +       $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig KCONFIG_ALLCONFIG=$(wildcard $(srctree)/kernel/configs/tiny.config $(srctree)/arch/$(SRCARCH)/configs/tiny.config)
>
>  # Help text used by make help
>  help:


The dependency "tinyconfig: $(obj)/conf" is redundant.


It is already specified by:

allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
         $< --$@ $(Kconfig)







What is worse, this patch breaks "make tinyconfig" on x86.


$ uname -m
x86_64
$ git log --oneline -2
754e472 Kbuild: avoid "make tinyconfig" warnings
a99cde4 Linux 4.7-rc6
$ make -s mrproper
$ make tinyconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  SHIPPED scripts/kconfig/zconf.tab.c
  SHIPPED scripts/kconfig/zconf.lex.c
  SHIPPED scripts/kconfig/zconf.hash.c
  HOSTCC  scripts/kconfig/zconf.tab.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --allnoconfig Kconfig
#
# configuration written to .config
#
scripts/kconfig/Makefile:115: *** No configuration exists for this
target on this architecture.  Stop.
make[3]: *** [arch/x86/configs/tiny.config] Error 2
make[2]: *** [__build_one_by_one] Error 2
make[1]: *** [tinyconfig] Error 2
make: *** [tinyconfig] Error 2


-- 
Best Regards
Masahiro Yamada
