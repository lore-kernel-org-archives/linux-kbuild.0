Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:36560 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753957AbbHJJKJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Aug 2015 05:10:09 -0400
Received: by wicja10 with SMTP id ja10so28955421wic.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Aug 2015 02:10:08 -0700 (PDT)
Date: Mon, 10 Aug 2015 10:10:04 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: unmet direct dependencies in -next
Message-ID: <20150810091004.GC3249@x1>
References: <55C71FF5.1020902@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55C71FF5.1020902@nod.at>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-next@vger.kernel.org, sameo@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, yann.morin.1998@free.fr, linux-kbuild <linux-kbuild@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, user-mode-linux-devel <user-mode-linux-devel@lists.sourceforge.net>

On Sun, 09 Aug 2015, Richard Weinberger wrote:

> Hi!
> 
> -next faces some build issues on UML because of unmet direct dependencies.
> Mostly due to HAS_IOMEM and I2C.
> 
> warning: (MEDIA_SUBDRV_AUTOSELECT && VIDEO_CX231XX && INV_MPU6050_IIO) selects I2C_MUX which has unmet direct dependencies (I2C && HAS_IOMEM)
> warning: (ST_IRQCHIP && HIP04_ETH && STMMAC_PLATFORM && DWMAC_IPQ806X && DWMAC_LPC18XX && DWMAC_ROCKCHIP && DWMAC_SOCFPGA && DWMAC_STI && TI_CPSW && PINCTRL_ROCKCHIP &&
> PINCTRL_DOVE && POWER_RESET_KEYSTONE && POWER_RESET_SYSCON && POWER_RESET_SYSCON_POWEROFF && S3C2410_WATCHDOG && VIDEO_OMAP3 && VIDEO_S5P_FIMC && RTC_DRV_AT91SAM9 && VIDEO_OMAP4 &&
> HWSPINLOCK_QCOM && ATMEL_ST && QCOM_GSBI) selects MFD_SYSCON which has unmet direct dependencies (HAS_IOMEM)
> warning: (MEDIA_SUBDRV_AUTOSELECT && VIDEO_CX231XX && INV_MPU6050_IIO) selects I2C_MUX which has unmet direct dependencies (I2C && HAS_IOMEM)
> warning: (ST_IRQCHIP && HIP04_ETH && STMMAC_PLATFORM && DWMAC_IPQ806X && DWMAC_LPC18XX && DWMAC_ROCKCHIP && DWMAC_SOCFPGA && DWMAC_STI && TI_CPSW && PINCTRL_ROCKCHIP &&
> PINCTRL_DOVE && POWER_RESET_KEYSTONE && POWER_RESET_SYSCON && POWER_RESET_SYSCON_POWEROFF && S3C2410_WATCHDOG && VIDEO_OMAP3 && VIDEO_S5P_FIMC && RTC_DRV_AT91SAM9 && VIDEO_OMAP4 &&
> HWSPINLOCK_QCOM && ATMEL_ST && QCOM_GSBI) selects MFD_SYSCON which has unmet direct dependencies (HAS_IOMEM)
> 
> For example MFD_SYSCON cannot build on UML as it depends on HAS_IOMEM.
> While the symbol MFD_SYSCON has correct dependencies some users of MFD_SYSCON
> just issue a "select MFD_SYSCON" and bypass the HAS_IOMEM dependency and causing the build to fail.
> 
> This brings me to a question on kconfig itself, wouldn't it be better to just disable a symbol if it has
> unmet direct dependencies?

If this is a question about "kconfig itself", you should probably have
included the correct ML and Maintainer:

KCONFIG
M:      Michal Marek <mmarek@suse.cz>
L:      linux-kbuild@vger.kernel.org
S:      Odd Fixes
F:      Documentation/kbuild/kconfig-language.txt
F:      scripts/kconfig/

There are also quite a few interested parties on LKML who might be
inclined to submit a fix for you.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
