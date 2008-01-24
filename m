Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42808 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758852AbYAXWDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:51 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 28/77] FRV: Drop 'TOPDIR' from Makefiles
Date: Thu, 24 Jan 2008 23:03:09 +0100
Message-Id: <1201212238-4369-28-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: WANG Cong <xiyou.wangcong@gmail.com>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>

From: WANG Cong <xiyou.wangcong@gmail.com>

This patch drops TOPDIR from frv Makefiles.

Cc: David Howells <dhowells@redhat.com>
Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/frv/boot/Makefile |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/frv/boot/Makefile b/arch/frv/boot/Makefile
index dc6f038..6ae3254 100644
--- a/arch/frv/boot/Makefile
+++ b/arch/frv/boot/Makefile
@@ -10,7 +10,7 @@
 
 targets := Image zImage bootpImage
 
-SYSTEM	=$(TOPDIR)/$(LINUX)
+SYSTEM	=$(LINUX)
 
 ZTEXTADDR	 = 0x02080000
 PARAMS_PHYS	 = 0x0207c000
@@ -45,7 +45,7 @@ zImage:	$(CONFIGURE) compressed/$(LINUX)
 bootpImage: bootp/bootp
 	$(OBJCOPY) -O binary -R .note -R .comment -S bootp/bootp $@
 
-compressed/$(LINUX): $(TOPDIR)/$(LINUX) dep
+compressed/$(LINUX): $(LINUX) dep
 	@$(MAKE) -C compressed $(LINUX)
 
 bootp/bootp: zImage initrd
@@ -59,10 +59,10 @@ initrd:
 # installation
 #
 install: $(CONFIGURE) Image
-	sh ./install.sh $(KERNELRELEASE) Image $(TOPDIR)/System.map "$(INSTALL_PATH)"
+	sh ./install.sh $(KERNELRELEASE) Image System.map "$(INSTALL_PATH)"
 
 zinstall: $(CONFIGURE) zImage
-	sh ./install.sh $(KERNELRELEASE) zImage $(TOPDIR)/System.map "$(INSTALL_PATH)"
+	sh ./install.sh $(KERNELRELEASE) zImage System.map "$(INSTALL_PATH)"
 
 #
 # miscellany
-- 
1.5.4.rc3.14.g44397

