Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:31859 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726038AbgF1Ikp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 04:40:45 -0400
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
Subject: [PATCH] arm, kbuild: Add new 'xipinstall' target
Date: Sun, 28 Jun 2020 16:24:28 +0800
Message-ID: <20200628082428.647002-1-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, Xiao Yang <yangx.jy@cn.fujitsu.com>, kernel test robot <lkp@intel.com>

Only xipImage is available when CONFIG_XIP_KERNEL is set but no target can
be used to install xipImage currently, so add a new 'xipinstall' target.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 arch/arm/Makefile      | 3 ++-
 arch/arm/boot/Makefile | 6 +++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 59fde2d598d8..063f973b77bf 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -332,7 +332,7 @@ archprepare:
 bzImage: zImage
 
 BOOT_TARGETS	= zImage Image xipImage bootpImage uImage
-INSTALL_TARGETS	= zinstall uinstall install
+INSTALL_TARGETS	= zinstall uinstall install xipinstall
 
 PHONY += bzImage $(BOOT_TARGETS) $(INSTALL_TARGETS)
 
@@ -369,6 +369,7 @@ define archhelp
   echo  '                  (supply initrd image via make variable INITRD=<path>)'
   echo  '  install       - Install uncompressed kernel'
   echo  '  zinstall      - Install compressed kernel'
+  echo  '  xipinstall    - Install XIP kernel image'
   echo  '  uinstall      - Install U-Boot wrapped compressed kernel'
   echo  '                  Install using (your) ~/bin/$(INSTALLKERNEL) or'
   echo  '                  (distribution) /sbin/$(INSTALLKERNEL) or'
diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index 0b3cd7a33a26..c02b4961ff0a 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -96,7 +96,7 @@ $(obj)/bootp/bootp: $(obj)/zImage initrd FORCE
 $(obj)/bootpImage: $(obj)/bootp/bootp FORCE
 	$(call if_changed,objcopy)
 
-PHONY += initrd install zinstall uinstall
+PHONY += initrd install zinstall xipinstall uinstall
 initrd:
 	@test "$(INITRD_PHYS)" != "" || \
 	(echo This machine does not support INITRD; exit -1)
@@ -111,6 +111,10 @@ zinstall:
 	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/zImage System.map "$(INSTALL_PATH)"
 
+xipinstall:
+	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
+	$(obj)/xipImage System.map "$(INSTALL_PATH)"
+
 uinstall:
 	$(CONFIG_SHELL) $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" \
 	$(obj)/uImage System.map "$(INSTALL_PATH)"
-- 
2.25.1
