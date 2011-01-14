Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qmta04.emeryville.ca.mail.comcast.net ([76.96.30.40]:54765 "EHLO
	qmta04.emeryville.ca.mail.comcast.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757571Ab1ANONk (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Jan 2011 09:13:40 -0500
From: matt mooney <mfm@muteddisk.com>
Subject: [RESEND PATCH 20/27] message: change to new flag variable
Date: Fri, 14 Jan 2011 06:12:43 -0800
Message-Id: <7efa382f1b4068535fb1941f71d1460b955e49d2.1295006565.git.mfm@muteddisk.com>
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
 drivers/message/fusion/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/message/fusion/Makefile b/drivers/message/fusion/Makefile
index 95c9532..d182a24 100644
--- a/drivers/message/fusion/Makefile
+++ b/drivers/message/fusion/Makefile
@@ -2,7 +2,7 @@
 
 # enable verbose logging
 # CONFIG_FUSION_LOGGING needs to be enabled in Kconfig
-#EXTRA_CFLAGS += -DMPT_DEBUG_VERBOSE
+#ccflags-y := -DMPT_DEBUG_VERBOSE
 
 
 #=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-} LSI_LOGIC
-- 
1.7.3.4

