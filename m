Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:48291 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756288AbaE2Fdg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 May 2014 01:33:36 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s4T5XU91028408
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:33:30 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili17) with ESMTP id s4T5XU331840
	for <linux-kbuild@vger.kernel.org>; Thu, 29 May 2014 14:33:30 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 2/2] kbuild: create include/config directory in scripts/kconfig/Makefile
Date: Thu, 29 May 2014 14:33:03 +0900
Message-Id: <1401341583-308-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401341583-308-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1401341583-308-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

The directory include/config is used only for
silentoldconfig, localmodconfig, localyesconfig.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Makefile                 | 2 --
 scripts/kconfig/Makefile | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e3c88f3..2c8db44 100644
--- a/Makefile
+++ b/Makefile
@@ -523,11 +523,9 @@ include $(srctree)/arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG
 
 config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 %config: scripts_basic outputmakefile FORCE
-	$(Q)mkdir -p include/config
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 else
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index e57478aa..9c4d241 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -33,11 +33,11 @@ oldconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
 silentoldconfig: $(obj)/conf
-	$(Q)mkdir -p include/generated
+	$(Q)mkdir -p include/config include/generated
 	$< --$@ $(Kconfig)
 
 localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
-	$(Q)mkdir -p include/generated
+	$(Q)mkdir -p include/config include/generated
 	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
-- 
1.9.1

