Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zimbra.vipri.net ([89.207.250.15]:40984 "EHLO zimbra.vipri.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752065AbaGAQMu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Jul 2014 12:12:50 -0400
From: Phil Sutter <phil.sutter@viprinet.com>
Subject: [PATCH] drivers/Makefile: always enter hid/ subdirectory
Date: Tue,  1 Jul 2014 18:04:59 +0200
Message-Id: <1404230699-22037-1-git-send-email-phil.sutter@viprinet.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-input@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Depending the subdir traversal on CONFIG_HID does not suffice for USB
boot protocol drivers residing in drivers/hid/usbhid/ and being
independent of the full HID system.

Signed-off-by: Phil Sutter <phil.sutter@viprinet.com>
---
 drivers/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/Makefile b/drivers/Makefile
index f98b50d..9f12999 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -126,7 +126,7 @@ ifndef CONFIG_ARCH_USES_GETTIMEOFFSET
 obj-y				+= clocksource/
 endif
 obj-$(CONFIG_DCA)		+= dca/
-obj-$(CONFIG_HID)		+= hid/
+obj-y				+= hid/
 obj-$(CONFIG_PPC_PS3)		+= ps3/
 obj-$(CONFIG_OF)		+= of/
 obj-$(CONFIG_SSB)		+= ssb/
-- 
1.8.5.5

