Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751601Ab0JHACC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:02 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 01/33] Staging: autofs: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:21 -0400
Message-Id: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed Makefile <module>-objs to <module>-y lines.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/autofs/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/autofs/Makefile b/drivers/staging/autofs/Makefile
index 453a60f..f48781c 100644
--- a/drivers/staging/autofs/Makefile
+++ b/drivers/staging/autofs/Makefile
@@ -4,4 +4,4 @@
 
 obj-$(CONFIG_AUTOFS_FS) += autofs.o
 
-autofs-objs := dirhash.o init.o inode.o root.o symlink.o waitq.o
+autofs-y := dirhash.o init.o inode.o root.o symlink.o waitq.o
-- 
1.7.3.1.50.g1e633

