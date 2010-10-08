Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59236 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755967Ab0JHACf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:35 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 25/33] Staging: solo6x10: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:45 -0400
Message-Id: <1286496113-11897-25-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/solo6x10/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/solo6x10/Makefile b/drivers/staging/solo6x10/Makefile
index 7e70044..1616b55 100644
--- a/drivers/staging/solo6x10/Makefile
+++ b/drivers/staging/solo6x10/Makefile
@@ -1,4 +1,4 @@
-solo6x10-objs	:= solo6010-core.o solo6010-i2c.o solo6010-p2m.o \
+solo6x10-y	:= solo6010-core.o solo6010-i2c.o solo6010-p2m.o \
 		   solo6010-v4l2.o solo6010-tw28.o solo6010-gpio.o \
 		   solo6010-disp.o solo6010-enc.o solo6010-v4l2-enc.o \
 		   solo6010-g723.o
-- 
1.7.3.1.50.g1e633

