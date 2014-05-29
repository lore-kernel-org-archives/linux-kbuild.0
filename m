Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:48177 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932953AbaE2FdL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 May 2014 01:33:11 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s4T5X9Va028071
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:33:09 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili12) with ESMTP id s4T5XAo20639
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:33:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 1/2] kbuild: do not create include/linux directory
Date: Thu, 29 May 2014 14:33:02 +0900
Message-Id: <1401341583-308-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

There are no generated files under include/linux directory.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c7a49f2..e3c88f3 100644
--- a/Makefile
+++ b/Makefile
@@ -523,11 +523,11 @@ include $(srctree)/arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG
 
 config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/linux include/config
+	$(Q)mkdir -p include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 %config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/linux include/config
+	$(Q)mkdir -p include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 else
-- 
1.9.1

