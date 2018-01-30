Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:39051 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752562AbeA3TYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jan 2018 14:24:40 -0500
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH v2 03/10] mmc: kconfig: Remove empty help text
Date: Tue, 30 Jan 2018 20:22:58 +0100
Message-Id: <20180130192349.8420-4-ulfalizer@gmail.com>
In-Reply-To: <20180130192349.8420-1-ulfalizer@gmail.com>
References: <20180130192349.8420-1-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, mcgrof@kernel.org, Ulf Magnusson <ulfalizer@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, Jan Glauber <jglauber@cavium.com>, Simon Horman <horms+renesas@verge.net.au>, Shawn Lin <shawn.lin@rock-chips.com>, Eric Anholt <eric@anholt.net>, Carlo Caione <carlo@endlessm.com>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rui Feng <rui_feng@realsil.com.cn>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mmc@vger.kernel.org

In preparation for adding a warning ("kconfig: Warn if help text is
blank"): https://lkml.org/lkml/2018/1/30/516

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/mmc/host/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 67bd3344dd03..24dee8eb5270 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -874,7 +874,6 @@ config MMC_CQHCI
 config MMC_TOSHIBA_PCI
 	tristate "Toshiba Type A SD/MMC Card Interface Driver"
 	depends on PCI
-	help
 
 config MMC_BCM2835
 	tristate "Broadcom BCM2835 SDHOST MMC Controller support"
-- 
2.14.1

