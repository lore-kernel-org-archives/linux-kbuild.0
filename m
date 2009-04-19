Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fmmailgate02.web.de ([217.72.192.227]:32804 "EHLO
	fmmailgate02.web.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758111AbZDSNlU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Apr 2009 09:41:20 -0400
From: Markus Heidelberg <markus.heidelberg@web.de>
Subject: [PATCH 01/10] kconfig: fix typo "mconfig" to "menuconfig" in a comment
Date: Sun, 19 Apr 2009 15:41:18 +0200
Message-Id: <1240148487-27584-2-git-send-email-markus.heidelberg@web.de>
In-Reply-To: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
References: <1240148487-27584-1-git-send-email-markus.heidelberg@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Heidelberg <markus.heidelberg@web.de>


Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 scripts/kconfig/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fa8c2dd..47e3f2e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -104,7 +104,7 @@ HOST_EXTRACFLAGS += -DLOCALE
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
 # conf:	  Used for defconfig, oldconfig and related targets
-# mconf:  Used for the mconfig target.
+# mconf:  Used for the menuconfig target
 #         Utilizes the lxdialog package
 # qconf:  Used for the xconfig target
 #         Based on QT which needs to be installed to compile it
-- 
1.6.3.rc1.24.g467d50

