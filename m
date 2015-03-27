Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:36455 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752739AbbC0Rvc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Mar 2015 13:51:32 -0400
Received: by padcy3 with SMTP id cy3so102028969pad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2015 10:51:32 -0700 (PDT)
From: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Subject: [PATCH v2 kbuild for-next 1/2] makefiles: add config option to force all cc warnings to errors
Date: Fri, 27 Mar 2015 10:51:10 -0700
Message-Id: <1427478671-16379-1-git-send-email-jtoppins@cumulusnetworks.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Add a Kconfig option to force cc warnings to errors. For new
development it is recommended this setting be enabled as warnings
in the code will be quite obvious.

v2: * remove DOTs from Kconfig entries
    * reworded Kconfig to not imply suppressing cc warnings was
      acceptable
    * default option to 'n'

Signed-off-by: Jonathan Toppins <jtoppins@cumulusnetworks.com>
---
 Makefile          |    4 ++++
 lib/Kconfig.debug |   10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/Makefile b/Makefile
index dc2d91a..a69562a 100644
--- a/Makefile
+++ b/Makefile
@@ -764,6 +764,10 @@ ifdef CONFIG_DEBUG_SECTION_MISMATCH
 KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif
 
+ifdef CONFIG_DEBUG_FORCE_CC_WARNINGS_TO_ERRORS
+KBUILD_CFLAGS += $(call cc-option, -Werror)
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3e0289e..bbe2eed 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -347,6 +347,16 @@ config DEBUG_FORCE_WEAK_PER_CPU
 	  To ensure that generic code follows the above rules, this
 	  option forces all percpu variables to be defined as weak.
 
+config DEBUG_FORCE_CC_WARNINGS_TO_ERRORS
+	bool "Force cc warnings to errors"
+	help
+	  Simply enables the gcc compiler option -Werror for the entire
+	  build. This option is intended to be more in the developer's
+	  face and encourage effort of some kind to remove the
+	  compilation warning.
+
+	  If doing new development recommend setting to y.
+
 endmenu # "Compiler options"
 
 config MAGIC_SYSRQ
-- 
1.7.10.4

