Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from anchor-post-3.mail.demon.net ([195.173.77.134]:59727 "EHLO
	anchor-post-3.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752235AbZIJK0l (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Sep 2009 06:26:41 -0400
Subject: UWB Kconfig: cannot set UWB to N in gconfig
From: Richard Kennedy <richard@rsk.demon.co.uk>
Content-Type: text/plain
Date: Thu, 10 Sep 2009 11:05:54 +0100
Message-Id: <1252577154.2340.12.camel@castor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Vrabel <david.vrabel@csr.com>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-usb <linux-usb@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

I sometimes use 'make gconfig' and I noticed that I cannot disable the
UWB option -- it just won't let me set it to N.

AFAICT this is because the CONFIG USB_WUSB selects UWB which forces it
on.
applying this patch fixes the issue but I'm not sure if this is the
right way to go about it.

any thoughts?

regards
Richard

This is against 2.6.31


diff --git a/drivers/usb/wusbcore/Kconfig b/drivers/usb/wusbcore/Kconfig
index eb09a0a..cc97041 100644
--- a/drivers/usb/wusbcore/Kconfig
+++ b/drivers/usb/wusbcore/Kconfig
@@ -5,7 +5,7 @@ config USB_WUSB
 	tristate "Enable Wireless USB extensions (EXPERIMENTAL)"
 	depends on EXPERIMENTAL
 	depends on USB
-        select UWB
+        depends on UWB
         select CRYPTO
         select CRYPTO_BLKCIPHER
         select CRYPTO_CBC


