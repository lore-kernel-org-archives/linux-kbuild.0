Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta11.emeryville.ca.mail.comcast.net ([76.96.27.211]:40996
	"EHLO qmta11.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757860Ab1ANOTo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:19:44 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 25/27] rtc: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:48 -0800
Message-Id: <371c0331c71be41ddaba669cd793e1f6ecf0b622.1295006565.git.mfm@muteddisk.com>
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
 drivers/rtc/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 2afdaf3..5f6c383 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -2,9 +2,7 @@
 # Makefile for RTC class/drivers.
 #
 
-ifeq ($(CONFIG_RTC_DEBUG),y)
-	EXTRA_CFLAGS		+= -DDEBUG
-endif
+ccflags-$(CONFIG_RTC_DEBUG)	:= -DDEBUG
 
 obj-$(CONFIG_RTC_LIB)		+= rtc-lib.o
 obj-$(CONFIG_RTC_HCTOSYS)	+= hctosys.o
-- 
1.7.3.4

