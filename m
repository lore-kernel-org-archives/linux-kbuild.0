Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta07.emeryville.ca.mail.comcast.net ([76.96.30.64]:51382 "EHLO
	qmta07.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932248Ab0JFHsw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Oct 2010 03:48:52 -0400
From: matt mooney <mfm@muteddisk.com>
Subject: [PATCH] power: makefile cleanup
Date: Wed,  6 Oct 2010 00:46:27 -0700
Message-Id: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Vorontsov <cbouatmailru@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y; remove if-statements and replace
with lists using the kbuild idiom.

None of the dependencies are modified.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/power/Makefile |   16 ++++------------
 1 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 10143aa..430243e 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -1,16 +1,8 @@
-power_supply-objs := power_supply_core.o
+ccflags-$(CONFIG_POWER_SUPPLY_DEBUG) := -DDEBUG
 
-ifeq ($(CONFIG_SYSFS),y)
-power_supply-objs += power_supply_sysfs.o
-endif
-
-ifeq ($(CONFIG_LEDS_TRIGGERS),y)
-power_supply-objs += power_supply_leds.o
-endif
-
-ifeq ($(CONFIG_POWER_SUPPLY_DEBUG),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+power_supply-y				:= power_supply_core.o
+power_supply-$(CONFIG_SYSFS)		+= power_supply_sysfs.o
+power_supply-$(CONFIG_LEDS_TRIGGERS)	+= power_supply_leds.o
 
 obj-$(CONFIG_POWER_SUPPLY)	+= power_supply.o
 
-- 
1.7.2.3

