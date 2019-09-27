Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36695 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfI0Rmq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 13:42:46 -0400
Date: Fri, 27 Sep 2019 19:42:32 +0200
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] drm/tiny: Kconfig: Remove always-y THERMAL dep. from
 TINYDRM_REPAPER
Message-ID: <20190927174218.GA32085@huvuddator>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com
Cc: airlied@linux.ie, daniel@ffwll.ch, noralf@tronnes.org, sam@ravnborg.org, david@lechnology.com, hdegoede@redhat.com, eric@anholt.net, tglx@linutronix.de, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Commit 554b3529fe01 ("thermal/drivers/core: Remove the module Kconfig's
option") changed the type of THERMAL from tristate to bool, so
THERMAL || !THERMAL is now always y. Remove the redundant dependency.

Discovered through Kconfiglib detecting a dependency loop. The C tools
simplify the expression to y before running dependency loop detection,
and so don't see it. Changing the type of THERMAL back to tristate makes
the C tools detect the same loop.

Not sure if running dep. loop detection after simplification can be
called a bug. Fixing this nit unbreaks Kconfiglib on the kernel at
least.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 drivers/gpu/drm/tiny/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 504763423d46..a46ac284dd5e 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -63,7 +63,6 @@ config TINYDRM_REPAPER
 	depends on DRM && SPI
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-	depends on THERMAL || !THERMAL
 	help
 	  DRM driver for the following Pervasive Displays panels:
 	  1.44" TFT EPD Panel (E1144CS021)
-- 
2.20.1
