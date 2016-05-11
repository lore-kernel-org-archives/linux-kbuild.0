Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37954 "EHLO
	mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751330AbcEKHsS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2016 03:48:18 -0400
Received: by mail-wm0-f46.google.com with SMTP id g17so66672191wme.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 May 2016 00:48:18 -0700 (PDT)
Date: Wed, 11 May 2016 08:48:28 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] kbuild: move -Wunused-const-variable to W=1 warning level
Message-ID: <20160511074828.GR19473@dell>
References: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, Olof Johansson <olof@lixom.net>, stable@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Josh Poimboeuf <jpoimboe@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

On Tue, 10 May 2016, Arnd Bergmann wrote:

> gcc-6 started warning by default about variables that are not
> used anywhere and that are marked 'const', generating many
> false positives in an allmodconfig build, e.g.:
> 
> arch/arm/mach-davinci/board-da830-evm.c:282:20: warning: 'da830_evm_emif25_pins' defined but not used [-Wunused-const-variable=]
> arch/arm/plat-omap/dmtimer.c:958:34: warning: 'omap_timer_match' defined but not used [-Wunused-const-variable=]
> drivers/bluetooth/hci_bcm.c:625:39: warning: 'acpi_bcm_default_gpios' defined but not used [-Wunused-const-variable=]
> drivers/char/hw_random/omap-rng.c:92:18: warning: 'reg_map_omap4' defined but not used [-Wunused-const-variable=]
> drivers/devfreq/exynos/exynos5_bus.c:381:32: warning: 'exynos5_busfreq_int_pm' defined but not used [-Wunused-const-variable=]
> drivers/dma/mv_xor.c:1139:34: warning: 'mv_xor_dt_ids' defined but not used [-Wunused-const-variable=]
> 
> This is similar to the existing -Wunused-but-set-variable warning
> that was added in an earlier release and that we disable by default
> now and only enable when W=1 is set, so it makes sense to do
> the same here. Once we have eliminated the majority of the
> warnings for both, we can put them back into the default list.
> 
> We probably want this in backport kernels as well, to allow building
> them with gcc-6 without introducing extra warnings.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: stable@vger.kernel.org
> ---
> I had originally started testing with gcc-6 a while ago and turned off
> this option in my build scripts because it was too noisy. I fixed all
> the other warnings I got and forgot about it until Olof mentioned it
> when he upgraded his build bot and the warnings started exploding.
> 
>  Makefile                   | 5 +++--
>  scripts/Makefile.extrawarn | 1 +
>  2 files changed, 4 insertions(+), 2 deletions(-)

Works for me:
  Acked-by: Lee Jones <lee.jones@linaro.org>

OOI, we described W=1 as "warnings that we'd like to see fixed
shortly, in order to obtain a clean W=1 build".  By demoting
'sign-compare' to W=2 we reduced warnings from 25k to 3k, which is a
more achievable target.  How does this change effect the W=1 warning
count?  Does it place a clean W=1 build back out of the realms of
possibility?

> diff --git a/Makefile b/Makefile
> index f7ccd8a40450..7934088c011b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -708,9 +708,10 @@ KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
>  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
>  else
>  
> -# This warning generated too much noise in a regular build.
> -# Use make W=1 to enable this warning (see scripts/Makefile.build)
> +# These warnings generated too much noise in a regular build.
> +# Use make W=1 to enable them (see scripts/Makefile.build)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  endif
>  
>  ifdef CONFIG_FRAME_POINTER
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index f9e47a70509c..53449a6ff6aa 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -24,6 +24,7 @@ warning-1 += $(call cc-option, -Wmissing-prototypes)
>  warning-1 += -Wold-style-definition
>  warning-1 += $(call cc-option, -Wmissing-include-dirs)
>  warning-1 += $(call cc-option, -Wunused-but-set-variable)
> +warning-1 += $(call cc-option, -Wunused-const-variable)
>  warning-1 += $(call cc-disable-warning, missing-field-initializers)
>  warning-1 += $(call cc-disable-warning, sign-compare)
>  

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
