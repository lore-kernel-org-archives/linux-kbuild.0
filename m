Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33781 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752476AbeBEBZK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Feb 2018 20:25:10 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 15/20] phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB
Date: Mon,  5 Feb 2018 02:21:27 +0100
Message-Id: <20180205012146.23981-16-ulfalizer@gmail.com>
In-Reply-To: <20180205012146.23981-1-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, tfiga@chromium.org, paul.burton@mips.com, m.szyprowski@samsung.com, egtvedt@samfundet.no, linus.walleij@linaro.org, vgupta@synopsys.com, mgorman@techsingularity.net, hch@lst.de, mina86@mina86.com, robh@kernel.org, sboyd@codeaurora.org, paulus@ozlabs.org, will.deacon@arm.com, tony@atomide.com, npiggin@gmail.com, yamada.masahiro@socionext.com, Ulf Magnusson <ulfalizer@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Heiko Stuebner <heiko@sntech.de>, Vivek Gautam <vivek.gautam@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>

Exynos4212 support was removed by commit bca9085e0ae9 ("ARM: dts:
exynos: remove Exynos4212 support (dead code)").

Remove the SOC_EXYNOS4212 dependency from PHY_EXYNOS4X12_USB.

Discovered with the
https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
script.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/phy/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index b7e0645a7bd9..2a5d33cb0e7e 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -49,7 +49,7 @@ config PHY_EXYNOS4210_USB2
 config PHY_EXYNOS4X12_USB2
 	bool
 	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS3250 || SOC_EXYNOS4212 || SOC_EXYNOS4412
+	default SOC_EXYNOS3250 || SOC_EXYNOS4412
 
 config PHY_EXYNOS5250_USB2
 	bool
-- 
2.14.1

