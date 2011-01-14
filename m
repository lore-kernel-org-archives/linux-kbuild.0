Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta08.emeryville.ca.mail.comcast.net ([76.96.30.80]:40766 "EHLO
	qmta08.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757657Ab1ANONt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:49 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 27/27] video: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:50 -0800
Message-Id: <60f4debdf046e6dfb4981671373b9d94c81c341b.1295006565.git.mfm@muteddisk.com>
In-Reply-To: <cover.1295006561.git.mfm@muteddisk.com>
References: <cover.1295006561.git.mfm@muteddisk.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
---
 drivers/video/intelfb/Makefile |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/drivers/video/intelfb/Makefile b/drivers/video/intelfb/Makefile
index 6c782d3..f7d631e 100644
--- a/drivers/video/intelfb/Makefile
+++ b/drivers/video/intelfb/Makefile
@@ -4,7 +4,4 @@ intelfb-y := intelfbdrv.o intelfbhw.o
 intelfb-$(CONFIG_FB_INTEL_I2C) += intelfb_i2c.o
 intelfb-objs := $(intelfb-y)
 
-ifdef CONFIG_FB_INTEL_DEBUG
-#EXTRA_CFLAGS += -DDEBUG -DVERBOSE -DREGDUMP
-EXTRA_CFLAGS += -DDEBUG -DREGDUMP
-endif
+ccflags-$(CONFIG_FB_INTEL_DEBUG) := -DDEBUG -DREGDUMP
-- 
1.7.3.4

