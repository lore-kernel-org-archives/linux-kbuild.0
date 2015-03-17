Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33492 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752081AbbCQWhv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 18:37:51 -0400
Received: by pabxg6 with SMTP id xg6so9459026pab.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2015 15:37:50 -0700 (PDT)
From: Jonathan Toppins <jtoppins@cumulusnetworks.com>
Subject: [PATCH v1 kbuild for-next 1/2] makefiles: add config option to force all cc warnings to errors
Date: Tue, 17 Mar 2015 15:37:41 -0700
Message-Id: <1426631862-19563-1-git-send-email-jtoppins@cumulusnetworks.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Add a Kconfig option to force cc warnings to errors. Also, to promote
better code hygiene enable the configuration option by default to force
authors to take some action. If for some reason a compilation unit
cannot get rid of the error the author has the option to suppress the
warning for that compile unit or module, see
Documentation/kbuild/makefiles.txt for details.

Signed-off-by: Jonathan Toppins <jtoppins@cumulusnetworks.com>
---
 Makefile          |    4 ++++
 lib/Kconfig.debug |   14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Makefile b/Makefile
index abf7bb1..eb47733 100644
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
index 3e0289e..0b288db 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -347,6 +347,20 @@ config DEBUG_FORCE_WEAK_PER_CPU
 	  To ensure that generic code follows the above rules, this
 	  option forces all percpu variables to be defined as weak.
 
+config DEBUG_FORCE_CC_WARNINGS_TO_ERRORS
+	bool "Force cc warnings to errors"
+	default y
+	help
+	  Simply enables the gcc compiler option -Werror for the entire
+	  build. If a compilation unit cannot handle -Werror by fixing the
+	  warning then that unit must suppress the cc warning using
+	  cc-disable-warning for that compilation unit in the unit's makefile.
+	  .
+	  This option is intended to be more in the developer's face and
+	  encourage effort of some kind to remove the compilation warning.
+	  .
+	  If unsure say y.
+
 endmenu # "Compiler options"
 
 config MAGIC_SYSRQ
-- 
1.7.10.4

