Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:51077 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752657AbaD1Hct (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Apr 2014 03:32:49 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile11) with ESMTP id s3S7WiiW013215
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2014 16:32:44 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili11) with ESMTP id s3S7WiR13917
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2014 16:32:44 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: trivial - fix comment block indent
Date: Mon, 28 Apr 2014 16:32:43 +0900
Message-Id: <1398670363-30879-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Makefile | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 2c4612b..1ae5023 100644
--- a/Makefile
+++ b/Makefile
@@ -255,18 +255,18 @@ endif
 KBUILD_MODULES :=
 KBUILD_BUILTIN := 1
 
-#	If we have only "make modules", don't compile built-in objects.
-#	When we're building modules with modversions, we need to consider
-#	the built-in objects during the descend as well, in order to
-#	make sure the checksums are up to date before we record them.
+# If we have only "make modules", don't compile built-in objects.
+# When we're building modules with modversions, we need to consider
+# the built-in objects during the descend as well, in order to
+# make sure the checksums are up to date before we record them.
 
 ifeq ($(MAKECMDGOALS),modules)
   KBUILD_BUILTIN := $(if $(CONFIG_MODVERSIONS),1)
 endif
 
-#	If we have "make <whatever> modules", compile modules
-#	in addition to whatever we do anyway.
-#	Just "make" or "make all" shall build modules as well
+# If we have "make <whatever> modules", compile modules
+# in addition to whatever we do anyway.
+# Just "make" or "make all" shall build modules as well
 
 ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
@@ -342,7 +342,6 @@ $(srctree)/scripts/Kbuild.include: ;
 include $(srctree)/scripts/Kbuild.include
 
 # Make variables (CC, etc...)
-
 AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
 CC		= $(CROSS_COMPILE)gcc
@@ -781,10 +780,10 @@ MODLIB	= $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
 export MODLIB
 
 #
-#  INSTALL_MOD_STRIP, if defined, will cause modules to be
-#  stripped after they are installed.  If INSTALL_MOD_STRIP is '1', then
-#  the default option --strip-debug will be used.  Otherwise,
-#  INSTALL_MOD_STRIP value will be used as the options to the strip command.
+# INSTALL_MOD_STRIP, if defined, will cause modules to be
+# stripped after they are installed.  If INSTALL_MOD_STRIP is '1', then
+# the default option --strip-debug will be used.  Otherwise,
+# INSTALL_MOD_STRIP value will be used as the options to the strip command.
 
 ifdef INSTALL_MOD_STRIP
 ifeq ($(INSTALL_MOD_STRIP),1)
@@ -1027,11 +1026,11 @@ ifdef CONFIG_MODULES
 
 all: modules
 
-#	Build modules
+# Build modules
 #
-#	A module can be listed more than once in obj-m resulting in
-#	duplicate lines in modules.order files.  Those are removed
-#	using awk while concatenating to the final file.
+# A module can be listed more than once in obj-m resulting in
+# duplicate lines in modules.order files.  Those are removed
+# using awk while concatenating to the final file.
 
 PHONY += modules
 modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
@@ -1110,7 +1109,7 @@ CLEAN_DIRS  += $(MODVERDIR)
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_DIRS  += include/config usr/include include/generated          \
-                  arch/*/include/generated .tmp_objdiff
+		  arch/*/include/generated .tmp_objdiff
 MRPROPER_FILES += .config .config.old .version .old_version $(version_h) \
 		  Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \
 		  signing_key.priv signing_key.x509 x509.genkey		\
-- 
1.8.3.2

