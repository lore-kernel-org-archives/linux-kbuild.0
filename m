Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:36291 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808AbbDEHAU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Apr 2015 03:00:20 -0400
From: Diego Viola <diego.viola@gmail.com>
Subject: [PATCH] scripts/kconfig/Makefile: fix Qt spelling
Date: Sun,  5 Apr 2015 04:00:13 -0300
Message-Id: <1428217213-22225-1-git-send-email-diego.viola@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Diego Viola <diego.viola@gmail.com>

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 scripts/kconfig/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 9645c07..6da13d0 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -126,7 +126,7 @@ help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
 	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
-	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
+	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
@@ -160,7 +160,7 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
 # mconf:  Used for the menuconfig target
 #         Utilizes the lxdialog package
 # qconf:  Used for the xconfig target
-#         Based on QT which needs to be installed to compile it
+#         Based on Qt which needs to be installed to compile it
 # gconf:  Used for the gconfig target
 #         Based on GTK which needs to be installed to compile it
 # object files used by all kconfig flavours
@@ -219,11 +219,11 @@ ifeq ($(MAKECMDGOALS),xconfig)
 $(obj)/.tmp_qtcheck: $(src)/Makefile
 -include $(obj)/.tmp_qtcheck
 
-# QT needs some extra effort...
+# Qt needs some extra effort...
 $(obj)/.tmp_qtcheck:
 	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
 	if ! pkg-config --exists QtCore 2> /dev/null; then \
-	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
+	    echo "* Unable to find the Qt4 tool qmake. Trying to use Qt3"; \
 	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
 	    pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
 	    if [ -n "$$pkg" ]; then \
@@ -237,8 +237,8 @@ $(obj)/.tmp_qtcheck:
 	      done; \
 	      if [ -z "$$dir" ]; then \
 	        echo >&2 "*"; \
-	        echo >&2 "* Unable to find any QT installation. Please make sure that"; \
-	        echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
+	        echo >&2 "* Unable to find any Qt installation. Please make sure that"; \
+	        echo >&2 "* the Qt4 or Qt3 development package is correctly installed and"; \
 	        echo >&2 "* either qmake can be found or install pkg-config or set"; \
 	        echo >&2 "* the QTDIR environment variable to the correct location."; \
 	        echo >&2 "*"; \
-- 
2.3.5

