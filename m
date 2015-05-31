Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vn0-f48.google.com ([209.85.216.48]:38870 "EHLO
	mail-vn0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755433AbbEaRgO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 May 2015 13:36:14 -0400
From: Diego Viola <diego.viola@gmail.com>
Subject: [PATCH TRIVIAL] scripts/kconfig/Makefile: Cosmetic fixes
Date: Sun, 31 May 2015 14:35:51 -0300
Message-Id: <1433093751-8149-1-git-send-email-diego.viola@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Diego Viola <diego.viola@gmail.com>

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 scripts/kconfig/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 3b48f7a..9e0be1c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -86,7 +86,7 @@ $(simple-targets): $(obj)/conf
 PHONY += oldnoconfig savedefconfig defconfig
 
 # oldnoconfig is an alias of olddefconfig, because people already are dependent
-# on its behavior(sets new symbols to their default value but not 'n') with the
+# on its behavior (sets new symbols to their default value but not 'n') with the
 # counter-intuitive name.
 oldnoconfig: olddefconfig
 
@@ -125,7 +125,7 @@ help:
 	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
-	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
+	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
 	@echo  '  localyesconfig  - Update current config converting local mods to core'
@@ -160,7 +160,7 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
 # qconf:  Used for the xconfig target
 #         Based on Qt which needs to be installed to compile it
 # gconf:  Used for the gconfig target
-#         Based on GTK which needs to be installed to compile it
+#         Based on GTK+ which needs to be installed to compile it
 # object files used by all kconfig flavours
 
 lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
@@ -273,7 +273,7 @@ $(obj)/gconf.o: $(obj)/.tmp_gtkcheck
 ifeq ($(MAKECMDGOALS),gconfig)
 -include $(obj)/.tmp_gtkcheck
 
-# GTK needs some extra effort, too...
+# GTK+ needs some extra effort, too...
 $(obj)/.tmp_gtkcheck:
 	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
 		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
@@ -304,7 +304,7 @@ quiet_cmd_moc = MOC     $@
 $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
 	$(call cmd,moc)
 
-# Extract gconf menu items for I18N support
+# Extract gconf menu items for i18n support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
 	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
 	$(obj)/gconf.glade
-- 
2.4.2

