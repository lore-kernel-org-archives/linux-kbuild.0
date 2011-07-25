Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60016 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750977Ab1GYIRQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Jul 2011 04:17:16 -0400
Message-ID: <4E2D2689.6030500@suse.cz>
Date: Mon, 25 Jul 2011 10:17:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] This patch gives ability for add some "-fno-..."
 options for GCC and to force -O1 optimization. Supporting files, like Kconfig,
 Makefile are auto-generated due to large amount of available options.
References: <20110723102335.7792b7c1.rdunlap@xenotime.net> <1311506250-20470-2-git-send-email-mail@smogura.eu>
In-Reply-To: <1311506250-20470-2-git-send-email-mail@smogura.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?UmFkb3PFgmF3IFNtb2d1cmE=?= <mail@smogura.eu>
Cc: Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org

On 24.7.2011 13:17, Radosław Smogura wrote:
> Patch helps to debug kernel.
>
> Fixed some language mistakes and added few -f-no-... options.

Hi,

please fix the first patch directly. And please also cc 
linux-kernel@vger.kernel.org.

Michal
>
> Signed-off-by: Radosław Smogura<mail@smogura.eu>
> ---
>   lib/Kconfig.debug.optim            |  156 +++++++++++++++++++++++++++--------
>   scripts/Makefile.optim.inc         |   24 ++++++
>   scripts/debug/make_config_optim.sh |   66 ++++++++--------
>   3 files changed, 178 insertions(+), 68 deletions(-)
>
> diff --git a/lib/Kconfig.debug.optim b/lib/Kconfig.debug.optim
> index 09b1012..99dcde0 100644
> --- a/lib/Kconfig.debug.optim
> +++ b/lib/Kconfig.debug.optim
> @@ -2,100 +2,184 @@
>   # Distributed under GPL v2 License
>
>   menuconfig HACK_OPTIM
> -	bool "Allows to override GCC optimization"
> +	bool "Allows overriding GCC optimizations"
>   	depends on DEBUG_KERNEL&&  EXPERIMENTAL
>   	help
>   	  If you say Y here you will be able to override
> -	  how GCC optimize kernel code. This will create
> -	  more debug friendly, but with not guarentee
> -	  about same runi, like production, kernel.
> +	  how GCC optimizes kernel code. This creates
> +	  more debug-friendly code, but does not guarantee
> +	  the same running code like a production kernel.
>
> -	  If you say Y here probably You will want say
> -	  for all suboptions
> +	  If you say Y here probably you will want to say
> +	  Y for all suboptions
>
>   if HACK_OPTIM
>
>   config HACK_OPTIM_FORCE_O1_LEVEL
>   	bool "Forces -O1 optimization level"
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
>   config HACK_OPTIM__fno_inline_functions_called_once
>   	bool "Adds -fno-inline-functions-called-once parameter to gcc invoke line."
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
>   config HACK_OPTIM__fno_combine_stack_adjustments
>   	bool "Adds -fno-combine-stack-adjustments parameter to gcc invoke line."
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
>   config HACK_OPTIM__fno_tree_dce
>   	bool "Adds -fno-tree-dce parameter to gcc invoke line."
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
>   config HACK_OPTIM__fno_tree_dominator_opts
>   	bool "Adds -fno-tree-dominator-opts parameter to gcc invoke line."
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
>   config HACK_OPTIM__fno_dse
>   	bool "Adds -fno-dse parameter to gcc invoke line."
>   	---help---
> -	  This will change how GCC optimize code. Code
> +	  This changes how GCC optimizes code. Code
>   	  may be slower and larger but will be more debug
>   	  "friendly".
>
> -	  In some cases there is low chance that kernel
> -	  will run different then normal, reporting or not
> -	  some bugs or errors. Refere to GCC manual for
> -	  more details.
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_dce
> +	bool "Adds -fno-dce parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_auto_inc_dec
> +	bool "Adds -fno-auto-inc-dec parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_inline_small_functions
> +	bool "Adds -fno-inline-small-functions parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_if_conversion
> +	bool "Adds -fno-if-conversion parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_if_conversion2
> +	bool "Adds -fno-if-conversion2 parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
> +
> +	  You SHOULD say N here.
> +
> +config HACK_OPTIM__fno_tree_fre
> +	bool "Adds -fno-tree-fre parameter to gcc invoke line."
> +	---help---
> +	  This changes how GCC optimizes code. Code
> +	  may be slower and larger but will be more debug
> +	  "friendly".
> +
> +	  In some cases there is a low chance that the kernel
> +	  will run differently than normal, reporting or not
> +	  reporting some bugs or errors.
> +	  Refer to GCC manual for more details.
>
>   	  You SHOULD say N here.
>
> diff --git a/scripts/Makefile.optim.inc b/scripts/Makefile.optim.inc
> index e78cc92..1bd219d 100644
> --- a/scripts/Makefile.optim.inc
> +++ b/scripts/Makefile.optim.inc
> @@ -21,3 +21,27 @@ ifdef CONFIG_HACK_OPTIM__fno_dse
>   	KBUILD_CFLAGS += -fno-dse
>   endif
>
> +ifdef CONFIG_HACK_OPTIM__fno_dce
> +	KBUILD_CFLAGS += -fno-dce
> +endif
> +
> +ifdef CONFIG_HACK_OPTIM__fno_auto_inc_dec
> +	KBUILD_CFLAGS += -fno-auto-inc-dec
> +endif
> +
> +ifdef CONFIG_HACK_OPTIM__fno_inline_small_functions
> +	KBUILD_CFLAGS += -fno-inline-small-functions
> +endif
> +
> +ifdef CONFIG_HACK_OPTIM__fno_if_conversion
> +	KBUILD_CFLAGS += -fno-if-conversion
> +endif
> +
> +ifdef CONFIG_HACK_OPTIM__fno_if_conversion2
> +	KBUILD_CFLAGS += -fno-if-conversion2
> +endif
> +
> +ifdef CONFIG_HACK_OPTIM__fno_tree_fre
> +	KBUILD_CFLAGS += -fno-tree-fre
> +endif
> +
> diff --git a/scripts/debug/make_config_optim.sh b/scripts/debug/make_config_optim.sh
> index 26865923..4db8419 100644
> --- a/scripts/debug/make_config_optim.sh
> +++ b/scripts/debug/make_config_optim.sh
> @@ -16,22 +16,42 @@ OPTIMIZATIONS_PARAMS="-fno-inline-functions-called-once \
>    -fno-combine-stack-adjustments \
>    -fno-tree-dce \
>    -fno-tree-dominator-opts \
> - -fno-dse "
> + -fno-dse \
> + -fno-dce \
> + -fno-auto-inc-dec \
> + -fno-inline-small-functions \
> + -fno-if-conversion \
> + -fno-if-conversion2 \
> + -fno-tree-fre
> +"
> +
> +function printStandardHelp() {
> +    echo -e "\t  This changes how GCC optimizes code. Code">>  $KCFG
> +    echo -e "\t  may be slower and larger but will be more debug">>  $KCFG
> +    echo -e "\t  \"friendly\".">>  $KCFG
> +    echo>>  $KCFG
> +    echo -e "\t  In some cases there is a low chance that the kernel">>  $KCFG
> +    echo -e "\t  will run differently than normal, reporting or not">>  $KCFG
> +    echo -e "\t  reporting some bugs or errors.">>  $KCFG
> +    echo -e "\t  Refer to GCC manual for more details.">>  $KCFG
> +    echo>>  $KCFG
> +    echo -e "\t  You SHOULD say N here.">>  $KCFG
> +}
>
>   echo "# This file was auto generated. It's utility configuration">  $KCFG
>   echo "# Distributed under GPL v2 License">>  $KCFG
>   echo>>  $KCFG
> -echo "menuconfig ${CFG_PREFIX}">>  $KCFG
> -echo -e "\tbool \"Allows to override GCC optimization\"">>  $KCFG
> -echo -e "\tdepends on DEBUG_KERNEL&&  EXPERIMENTAL">>  $KCFG
> -echo -e "\thelp">>  $KCFG
> -echo -e "\t  If you say Y here you will be able to override">>  $KCFG
> -echo -e "\t  how GCC optimize kernel code. This will create">>  $KCFG
> -echo -e "\t  more debug friendly, but with not guarentee">>  $KCFG
> -echo -e "\t  about same runi, like production, kernel.">>  $KCFG
> -echo>>  $KCFG
> -echo -e "\t  If you say Y here probably You will want say">>  $KCFG
> -echo -e "\t  for all suboptions">>  $KCFG
> +echo "menuconfig ${CFG_PREFIX}">>  $KCFG
> +echo -e "\tbool \"Allows overriding GCC optimizations\"">>  $KCFG
> +echo -e "\tdepends on DEBUG_KERNEL&&  EXPERIMENTAL">>  $KCFG
> +echo -e "\thelp">>  $KCFG
> +echo -e "\t  If you say Y here you will be able to override">>  $KCFG
> +echo -e "\t  how GCC optimizes kernel code. This creates">>  $KCFG
> +echo -e "\t  more debug-friendly code, but does not guarantee">>  $KCFG
> +echo -e "\t  the same running code like a production kernel.">>  $KCFG
> +echo>>  $KCFG
> +echo -e "\t  If you say Y here probably you will want to say">>  $KCFG
> +echo -e "\t  Y for all suboptions">>  $KCFG
>   echo>>  $KCFG
>   echo "if ${CFG_PREFIX}">>  $KCFG
>   echo>>  $KCFG
> @@ -47,16 +67,7 @@ echo>>  $MKFI
>   echo -e "config ${CFG_PREFIX}_FORCE_O1_LEVEL">>  $KCFG
>   echo -e "\tbool \"Forces -O1 optimization level\"">>  $KCFG
>   echo -e "\t---help---">>  $KCFG
> -echo -e "\t  This will change how GCC optimize code. Code">>  $KCFG
> -echo -e "\t  may be slower and larger but will be more debug">>  $KCFG
> -echo -e "\t  \"friendly\".">>  $KCFG
> -echo>>  $KCFG
> -echo -e "\t  In some cases there is low chance that kernel">>  $KCFG
> -echo -e "\t  will run different then normal, reporting or not">>  $KCFG
> -echo -e "\t  some bugs or errors. Refere to GCC manual for">>  $KCFG
> -echo -e "\t  more details.">>  $KCFG
> -echo>>  $KCFG
> -echo -e "\t  You SHOULD say N here.">>  $KCFG
> +printStandardHelp;
>   echo>>  $KCFG
>
>   for o in $OPTIMIZATIONS_PARAMS ; do
> @@ -67,16 +78,7 @@ for o in $OPTIMIZATIONS_PARAMS ; do
>   	echo -e "config ${cfg_o}">>  $KCFG
>   	echo -e "\tbool \"Adds $o parameter to gcc invoke line.\"">>  $KCFG
>   	echo -e "\t---help---">>  $KCFG
> -	echo -e "\t  This will change how GCC optimize code. Code">>  $KCFG
> -	echo -e "\t  may be slower and larger but will be more debug">>  $KCFG
> -	echo -e "\t  \"friendly\".">>  $KCFG
> -	echo>>  $KCFG
> -	echo -e "\t  In some cases there is low chance that kernel">>  $KCFG
> -	echo -e "\t  will run different then normal, reporting or not">>  $KCFG
> -	echo -e "\t  some bugs or errors. Refere to GCC manual for">>  $KCFG
> -	echo -e "\t  more details.">>  $KCFG
> -	echo>>  $KCFG
> -	echo -e "\t  You SHOULD say N here.">>  $KCFG
> +	printStandardHelp;
>   	echo>>  $KCFG
>
>   	#Generate Make for include

