Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:50406 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1755558AbZKHWqX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Nov 2009 17:46:23 -0500
Date: Sun, 8 Nov 2009 23:46:24 +0100 (CET)
From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH/RFC] fb: put framebuffer drivers back under the "frame buffer
 devices" menu
Message-ID: <Pine.LNX.4.64.0911082339090.24656@axis700.grange>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-fbdev-devel@lists.sourceforge.net
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

The config FB_PRE_INIT_FB entry in drivers/video/Kconfig pushes all entries
below it out of the menuconfig selection. Fix this.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---

This is _most_ _probably_ not a right fix, but rather an observation, that 
the patch below fixes the problem, whereby all entires below 
FB_PRE_INIT_FB get displaced from the "frame buffer devices" menu. A bug 
in kconfig? The additional dependency on FB in this patch is certainly 
redundant.

 drivers/video/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 9bbb285..188e1ba 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -2121,7 +2121,7 @@ config FB_EP93XX
 
 config FB_PRE_INIT_FB
 	bool "Don't reinitialize, use bootloader's GDC/Display configuration"
-	depends on FB_MB862XX_LIME
+	depends on FB && FB_MB862XX_LIME
 	---help---
 	  Select this option if display contents should be inherited as set by
 	  the bootloader.
-- 
1.6.2.4

