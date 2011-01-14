Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta07.emeryville.ca.mail.comcast.net ([76.96.30.64]:50025 "EHLO
	qmta07.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757413Ab1ANOT3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:19:29 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 21/27] misc: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:44 -0800
Message-Id: <a9b05db21707b67d629c9d200ff558063ad84cb1.1295006565.git.mfm@muteddisk.com>
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
 drivers/misc/cb710/Makefile   |    4 +---
 drivers/misc/sgi-gru/Makefile |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/cb710/Makefile b/drivers/misc/cb710/Makefile
index 7b80cbf..467c8e9 100644
--- a/drivers/misc/cb710/Makefile
+++ b/drivers/misc/cb710/Makefile
@@ -1,6 +1,4 @@
-ifeq ($(CONFIG_CB710_DEBUG),y)
-	EXTRA_CFLAGS		+= -DDEBUG
-endif
+ccflags-$(CONFIG_CB710_DEBUG)	:= -DDEBUG
 
 obj-$(CONFIG_CB710_CORE)	+= cb710.o
 
diff --git a/drivers/misc/sgi-gru/Makefile b/drivers/misc/sgi-gru/Makefile
index 7c4c306..0003a1d 100644
--- a/drivers/misc/sgi-gru/Makefile
+++ b/drivers/misc/sgi-gru/Makefile
@@ -1,6 +1,4 @@
-ifdef CONFIG_SGI_GRU_DEBUG
-  EXTRA_CFLAGS	+= -DDEBUG
-endif
+ccflags-$(CONFIG_SGI_GRU_DEBUG)	:= -DDEBUG
 
 obj-$(CONFIG_SGI_GRU) := gru.o
 gru-y := grufile.o grumain.o grufault.o grutlbpurge.o gruprocfs.o grukservices.o gruhandles.o grukdump.o
-- 
1.7.3.4

