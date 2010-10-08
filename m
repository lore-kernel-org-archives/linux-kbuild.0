Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55788 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755096Ab0JHACK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:10 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 08/33] Staging: easycap: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:28 -0400
Message-Id: <1286496113-11897-8-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/easycap/Makefile |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/easycap/Makefile b/drivers/staging/easycap/Makefile
index 680f370..8a3d911 100644
--- a/drivers/staging/easycap/Makefile
+++ b/drivers/staging/easycap/Makefile
@@ -1,9 +1,9 @@
 
 obj-$(CONFIG_EASYCAP)	+= easycap.o
 
-easycap-objs	:= easycap_main.o easycap_low.o easycap_sound.o
-easycap-objs	+= easycap_ioctl.o easycap_settings.o
-easycap-objs	+= easycap_testcard.o
+easycap-y	:= easycap_main.o easycap_low.o easycap_sound.o
+easycap-y	+= easycap_ioctl.o easycap_settings.o
+easycap-y	+= easycap_testcard.o
 
 ccflags-y := -Wall
 # Impose all or none of the following:
-- 
1.7.3.1.50.g1e633

