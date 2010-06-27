Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from webhosting01.bon.m2soft.com ([195.38.20.32]:52383 "EHLO
	webhosting01.bon.m2soft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754916Ab0F0PbT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Jun 2010 11:31:19 -0400
Date: Sun, 27 Jun 2010 17:27:51 +0200
From: Nicolas Kaiser <nikai@nikai.net>
Subject: [PATCH] drivers/usb/Makefile: conditionally descend to 'early'
Message-ID: <20100627172751.32deb6aa@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Don't descend to the EARLY_PRINTK_DBGP directory
unless it is actually used.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 drivers/usb/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 80b4008..239f050 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_USB_MICROTEK)	+= image/
 obj-$(CONFIG_USB_SERIAL)	+= serial/
 
 obj-$(CONFIG_USB)		+= misc/
-obj-y				+= early/
+obj-$(CONFIG_EARLY_PRINTK_DBGP)	+= early/
 
 obj-$(CONFIG_USB_ATM)		+= atm/
 obj-$(CONFIG_USB_SPEEDTOUCH)	+= atm/
-- 
1.7.1
