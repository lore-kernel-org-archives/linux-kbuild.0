Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:34703 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab0JHACs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:48 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 33/33] Staging: zram: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:53 -0400
Message-Id: <1286496113-11897-33-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/zram/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/zram/Makefile b/drivers/staging/zram/Makefile
index c01160a..b1709c5 100644
--- a/drivers/staging/zram/Makefile
+++ b/drivers/staging/zram/Makefile
@@ -1,3 +1,3 @@
-zram-objs	:=	zram_drv.o zram_sysfs.o xvmalloc.o
+zram-y	:=	zram_drv.o zram_sysfs.o xvmalloc.o
 
 obj-$(CONFIG_ZRAM)	+=	zram.o
-- 
1.7.3.1.50.g1e633

