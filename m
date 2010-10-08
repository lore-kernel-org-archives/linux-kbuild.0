Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756609Ab0JHACq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:46 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 32/33] Staging: xgifb: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:52 -0400
Message-Id: <1286496113-11897-32-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/xgifb/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/xgifb/Makefile b/drivers/staging/xgifb/Makefile
index 2a31770..f2ca6b1 100644
--- a/drivers/staging/xgifb/Makefile
+++ b/drivers/staging/xgifb/Makefile
@@ -1,4 +1,4 @@
 obj-$(CONFIG_FB_XGI)  += xgifb.o
 
-xgifb-objs := XGI_main_26.o XGI_accel.o vb_init.o vb_setmode.o vb_util.o vb_ext.o
+xgifb-y := XGI_main_26.o XGI_accel.o vb_init.o vb_setmode.o vb_util.o vb_ext.o
 
-- 
1.7.3.1.50.g1e633

