Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755457Ab0JHACU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:20 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 15/33] Staging: keucr: Makefile: Makefile clean up
Date: Thu,  7 Oct 2010 20:01:35 -0400
Message-Id: <1286496113-11897-15-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.
Also, Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/keucr/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/keucr/Makefile b/drivers/staging/keucr/Makefile
index 2a4200f..5c19b7b 100644
--- a/drivers/staging/keucr/Makefile
+++ b/drivers/staging/keucr/Makefile
@@ -1,8 +1,8 @@
-EXTRA_CFLAGS += -Idrivers/scsi
+ccflags-y := -Idrivers/scsi
 
 obj-$(CONFIG_USB_ENESTORAGE)	+= keucr.o
 
-keucr-objs :=			\
+keucr-y :=			\
 		usb.o		\
 		scsiglue.o	\
 		transport.o	\
-- 
1.7.3.1.50.g1e633

