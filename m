Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45352 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753736Ab2I0ILB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Sep 2012 04:11:01 -0400
Received: by weyt9 with SMTP id t9so457017wey.19
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Sep 2012 01:11:00 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
Subject: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Date: Thu, 27 Sep 2012 10:10:41 +0200
Message-Id: <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <504DFBBF.5010202@free-electrons.com>
References: <504DFBBF.5010202@free-electrons.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>

[add Grant Likely and Rob Herring in To: since this is maybe more OF
related than ARM related]

This rules are useful for appended device tree conforming to the
CONFIG_ARM_APPENDED_DTB kernel option.

The rule dtbImage.<dt> is actually just a:
cat zImage <dt>.dtb > dtbImage.<dt>

The dtbuImage.<dt> makes an uImage out of the dtbImage.<dt> file.

KernelVersion: v3.6-rc5

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 arch/arm/Makefile      |   30 ++++++++++++++++--------------
 arch/arm/boot/Makefile |   11 +++++++++++
 scripts/Makefile.lib   |    6 ++++++
 3 files changed, 33 insertions(+), 14 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 30eae87..c5f2673 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -278,7 +278,7 @@ archprepare:
 # Convert bzImage to zImage
 bzImage: zImage
 
-zImage Image xipImage bootpImage uImage: vmlinux
+zImage Image xipImage bootpImage uImage dtbImage.% dtbuImage.% : vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $(boot)/$@
 
 zinstall uinstall install: vmlinux
@@ -300,17 +300,19 @@ i zi:;	$(Q)$(MAKE) $(build)=$(boot) MACHINE=$(MACHINE) $@
 
 
 define archhelp
-  echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
-  echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
-  echo  '* xipImage      - XIP kernel image, if configured (arch/$(ARCH)/boot/xipImage)'
-  echo  '  uImage        - U-Boot wrapped zImage'
-  echo  '  bootpImage    - Combined zImage and initial RAM disk' 
-  echo  '                  (supply initrd image via make variable INITRD=<path>)'
-  echo  '  dtbs          - Build device tree blobs for enabled boards'
-  echo  '  install       - Install uncompressed kernel'
-  echo  '  zinstall      - Install compressed kernel'
-  echo  '  uinstall      - Install U-Boot wrapped compressed kernel'
-  echo  '                  Install using (your) ~/bin/$(INSTALLKERNEL) or'
-  echo  '                  (distribution) /sbin/$(INSTALLKERNEL) or'
-  echo  '                  install to $$(INSTALL_PATH) and run lilo'
+  echo  '* zImage         - Compressed kernel image (arch/$(ARCH)/boot/zImage)'
+  echo  '  Image          - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
+  echo  '* xipImage       - XIP kernel image, if configured (arch/$(ARCH)/boot/xipImage)'
+  echo  '  uImage         - U-Boot wrapped zImage'
+  echo  '  bootpImage     - Combined zImage and initial RAM disk'
+  echo  '                   (supply initrd image via make variable INITRD=<path>)'
+  echo  '  dtbs           - Build device tree blobs for enabled boards'
+  echo  '  dtbImage.<dt>  - zImage with an appended device tree blob'
+  echo  '  dtbuImage.<dt> - uImage with an embedded device tree blob'
+  echo  '  install        - Install uncompressed kernel'
+  echo  '  zinstall       - Install compressed kernel'
+  echo  '  uinstall       - Install U-Boot wrapped compressed kernel'
+  echo  '                   Install using (your) ~/bin/$(INSTALLKERNEL) or'
+  echo  '                   (distribution) /sbin/$(INSTALLKERNEL) or'
+  echo  '                   install to $$(INSTALL_PATH) and run lilo'
 endef
diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index c877087..35c01a8 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -98,6 +98,17 @@ $(obj)/bootpImage: $(obj)/bootp/bootp FORCE
 	$(call if_changed,objcopy)
 	@echo '  Kernel: $@ is ready'
 
+# dtbImage.% - a dtbImage is a zImage with an appended device tree blob
+$(obj)/dtbImage.%: $(obj)/zImage $(obj)/%.dtb FORCE
+	$(call if_changed,cat)
+	@echo '  Kernel: $@ is ready'
+
+# dtbuImage.% - a dtbuImage is a uImage with an embedded device tree blob
+$(obj)/dtbuImage.%: $(obj)/dtbImage.% FORCE
+	@$(check_for_multiple_loadaddr)
+	$(call if_changed,uimage)
+	@echo '  Image $@ is ready'
+
 PHONY += initrd FORCE
 initrd:
 	@test "$(INITRD_PHYS)" != "" || \
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0be6f11..8550466 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -235,6 +235,12 @@ cmd_ld = $(LD) $(LDFLAGS) $(ldflags-y) $(LDFLAGS_$(@F)) \
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
+# Cat
+# ---------------------------------------------------------------------------
+
+quiet_cmd_cat = CAT     $@
+cmd_cat = (cat $(filter-out FORCE,$^) > $@) || (rm -f $@ ; false)
+
 # Gzip
 # ---------------------------------------------------------------------------
 
-- 
1.7.2.5

