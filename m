Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756040Ab0JHACd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:33 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 23/33] Staging: sbe-2t3e3: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:43 -0400
Message-Id: <1286496113-11897-23-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/sbe-2t3e3/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/sbe-2t3e3/Makefile b/drivers/staging/sbe-2t3e3/Makefile
index 2c7b097..cce2a7a 100644
--- a/drivers/staging/sbe-2t3e3/Makefile
+++ b/drivers/staging/sbe-2t3e3/Makefile
@@ -1,4 +1,4 @@
 obj-$(CONFIG_SBE_2T3E3) += sbe-2t3e3.o
 
-sbe-2t3e3-objs := module.o netdev.o maps.o	\
+sbe-2t3e3-y := module.o netdev.o maps.o	\
 	main.o cpld.o intr.o ctrl.o io.o dc.o exar7250.o exar7300.o
-- 
1.7.3.1.50.g1e633

