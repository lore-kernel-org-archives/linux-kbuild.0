Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:55788 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755457Ab0JHACY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Oct 2010 20:02:24 -0400
From: Tracey Dent <tdent48227@gmail.com>
Subject: [PATCH 18/33] Staging: rt2860: Makefile: replace the use of <module>-objs with <module>-y
Date: Thu,  7 Oct 2010 20:01:38 -0400
Message-Id: <1286496113-11897-18-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed <module>-objs to <module>-y in Makefile.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/rt2860/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/rt2860/Makefile b/drivers/staging/rt2860/Makefile
index d816ddb..6dd0aa5 100644
--- a/drivers/staging/rt2860/Makefile
+++ b/drivers/staging/rt2860/Makefile
@@ -6,7 +6,7 @@ ccflags-y += -DRTMP_MAC_PCI -DRTMP_PCI_SUPPORT -DRT2860
 ccflags-y += -DRTMP_RF_RW_SUPPORT -DRTMP_EFUSE_SUPPORT -DRT30xx -DRT3090
 ccflags-y += -DDBG
 
-rt2860sta-objs :=	\
+rt2860sta-y :=	\
 	common/crypt_md5.o	\
 	common/crypt_sha2.o	\
 	common/crypt_hmac.o	\
-- 
1.7.3.1.50.g1e633

