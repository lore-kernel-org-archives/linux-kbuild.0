Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta06.emeryville.ca.mail.comcast.net ([76.96.30.56]:49971 "EHLO
	qmta06.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757537Ab1ANONe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:34 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 15/27] hwmon: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:38 -0800
Message-Id: <a6d2dc99cb27e76cdb4f1f4440f8cc5f4cf19f94.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
Acked-by: Guenter Roeck <guenter.roeck@ericsson.com>
---
 drivers/hwmon/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index dde02d9..974f9cc 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -112,7 +112,5 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 
-ifeq ($(CONFIG_HWMON_DEBUG_CHIP),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
 
-- 
1.7.3.4

