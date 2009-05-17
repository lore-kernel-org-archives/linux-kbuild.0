Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.wp.pl ([212.77.101.5]:31440 "EHLO mx1.wp.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751903AbZEQPuK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 May 2009 11:50:10 -0400
Received: from 93-181-133-4.as.kn.pl (HELO krzysio.net) (krzysztof.h1@[93.181.133.4])
          (envelope-sender <krzysztof.h1@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with SMTP
          for <linux-kbuild@vger.kernel.org>; 17 May 2009 17:50:09 +0200
Date: Sun, 17 May 2009 17:56:17 +0200
From: Krzysztof Helt <krzysztof.h1@wp.pl>
Subject: Kconfig: fix problem in HID menu
Message-Id: <20090517175617.81323cc1.krzysztof.h1@wp.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: LKLM <linux-kernel@vger.kernel.org>

From: Krzysztof Helt <krzysztof.h1@wp.pl>

Following syntax does not work properly if there is an options FOO2 depending on the FOO:

config FOO
	tristate "Foo" if EMBEDDED
	depends on FUD
	default !EMBEDDED

config FOO2
	bool "Foo2"
	depends on FOO

If the EMBEDDED is not selected the FOO option is selected
and it cannot be unselected.

The change of the FOO definition:

config FOO
	tristate "Foo" 
	depends on EMBEDDED && FUD
	default !EMBEDDED

fixes the issue.

This is likely a bug in Kconfig tool.

Signed-off-by: Krzysztof Helt <krzysztof.h1@wp.pl>
---

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 7e67dcb..c52204d 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -153,8 +153,8 @@ config HID_KENSINGTON
 	Support for Kensington Slimblade Trackball.
 
 config HID_LOGITECH
-	tristate "Logitech" if EMBEDDED
-	depends on USB_HID
+	tristate "Logitech"
+	depends on EMBEDDED && USB_HID
 	default !EMBEDDED
 	---help---
 	Support for Logitech devices that are not fully compliant with HID standard.
@@ -205,8 +205,8 @@ config HID_NTRIG
 	Support for N-Trig touch screen.
 
 config HID_PANTHERLORD
-	tristate "Pantherlord devices support" if EMBEDDED
-	depends on USB_HID
+	tristate "Pantherlord devices support"
+	depends on EMBEDDED && USB_HID
 	default !EMBEDDED
 	---help---
 	Support for PantherLord/GreenAsia based device support.
