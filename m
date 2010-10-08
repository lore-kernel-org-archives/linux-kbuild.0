Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753194Ab0JHACE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:04 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 03/33] Staging: bcm: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:23 -0400
Message-Id: <1286496113-11897-3-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/bcm/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/bcm/Makefile b/drivers/staging/bcm/Makefile
index 3fdec2e..c3ae25a 100644
--- a/drivers/staging/bcm/Makefile
+++ b/drivers/staging/bcm/Makefile
@@ -4,7 +4,7 @@
 
 obj-$(CONFIG_BCM_WIMAX) +=	bcm_wimax.o
 
-bcm_wimax-objs :=  InterfaceDld.o InterfaceIdleMode.o InterfaceInit.o InterfaceRx.o \
+bcm_wimax-y :=  InterfaceDld.o InterfaceIdleMode.o InterfaceInit.o InterfaceRx.o \
 		InterfaceIsr.o InterfaceMisc.o InterfaceTx.o \
 		Arp.o CmHost.o Debug.o IPv6Protocol.o Qos.o Transmit.o\
 		Bcmnet.o DDRInit.o HandleControlPacket.o\
-- 
1.7.3.1.50.g1e633

