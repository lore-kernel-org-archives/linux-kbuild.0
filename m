Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33099 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752087AbdDIJmD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Apr 2017 05:42:03 -0400
Received: by mail-wm0-f65.google.com with SMTP id o81so4905152wmb.0
        for <linux-kbuild@vger.kernel.org>; Sun, 09 Apr 2017 02:42:03 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH] Make PPS a menuconfig to ease disabling it all
Date: Sun,  9 Apr 2017 11:41:52 +0200
Message-Id: <20170409094152.22268-2-vincent.legoll@gmail.com>
In-Reply-To: <20170409094152.22268-1-vincent.legoll@gmail.com>
References: <20170409094152.22268-1-vincent.legoll@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Vincent Legoll <vincent.legoll@gmail.com>

No need to get into the submenu to disable all PPS-related config entries

The BROKEN PPS_GENERATOR_PARPORT now also depends on PPS

Signed-off-by: Vincent Legoll <vincent.legoll@gmail.com>
---
 drivers/pps/Kconfig            | 12 +++---------
 drivers/pps/clients/Kconfig    |  6 ++----
 drivers/pps/generators/Kconfig |  3 ++-
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/pps/Kconfig b/drivers/pps/Kconfig
index 564a51a..4b29a71 100644
--- a/drivers/pps/Kconfig
+++ b/drivers/pps/Kconfig
@@ -2,9 +2,7 @@
 # PPS support configuration
 #
 
-menu "PPS support"
-
-config PPS
+menuconfig PPS
 	tristate "PPS support"
 	---help---
 	  PPS (Pulse Per Second) is a special pulse provided by some GPS
@@ -20,10 +18,10 @@ config PPS
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pps_core.ko.
-if PPS
 
 config PPS_DEBUG
 	bool "PPS debugging messages"
+	depends on PPS
 	help
 	  Say Y here if you want the PPS support to produce a bunch of debug
 	  messages to the system log.  Select this if you are having a
@@ -31,17 +29,13 @@ config PPS_DEBUG
 
 config NTP_PPS
 	bool "PPS kernel consumer support"
-	depends on !NO_HZ_COMMON
+	depends on PPS && !NO_HZ_COMMON
 	help
 	  This option adds support for direct in-kernel time
 	  synchronization using an external PPS signal.
 
 	  It doesn't work on tickless systems at the moment.
 
-endif
-
 source drivers/pps/clients/Kconfig
 
 source drivers/pps/generators/Kconfig
-
-endmenu
diff --git a/drivers/pps/clients/Kconfig b/drivers/pps/clients/Kconfig
index 0c9f280..efec021 100644
--- a/drivers/pps/clients/Kconfig
+++ b/drivers/pps/clients/Kconfig
@@ -2,12 +2,12 @@
 # PPS clients configuration
 #
 
-if PPS
-
 comment "PPS clients support"
+	depends on PPS
 
 config PPS_CLIENT_KTIMER
 	tristate "Kernel timer client (Testing client, use for debug)"
+	depends on PPS
 	help
 	  If you say yes here you get support for a PPS debugging client
 	  which uses a kernel timer to generate the PPS signal.
@@ -37,5 +37,3 @@ config PPS_CLIENT_GPIO
 	  GPIO. To be useful you must also register a platform device
 	  specifying the GPIO pin and other options, usually in your board
 	  setup.
-
-endif
diff --git a/drivers/pps/generators/Kconfig b/drivers/pps/generators/Kconfig
index e4c4f3d..86b5937 100644
--- a/drivers/pps/generators/Kconfig
+++ b/drivers/pps/generators/Kconfig
@@ -3,10 +3,11 @@
 #
 
 comment "PPS generators support"
+	depends on PPS
 
 config PPS_GENERATOR_PARPORT
 	tristate "Parallel port PPS signal generator"
-	depends on PARPORT && BROKEN
+	depends on PPS && PARPORT && BROKEN
 	help
 	  If you say yes here you get support for a PPS signal generator which
 	  utilizes STROBE pin of a parallel port to send PPS signals. It uses
-- 
2.9.3

