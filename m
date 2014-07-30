Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:28837 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752501AbaG3Sve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Jul 2014 14:51:34 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 2/2] Kbuild: Add a option to enable dwarf4 v2
Date: Wed, 30 Jul 2014 20:50:19 +0200
Message-Id: <1406746219-15427-2-git-send-email-andi@firstfloor.org>
In-Reply-To: <1406746219-15427-1-git-send-email-andi@firstfloor.org>
References: <1406746219-15427-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

I found that a lot of unresolvable variables when using gdb on the kernel
become resolvable when dwarf4 is enabled. So add a Kconfig flag to enable it.

It definitely increases the debug information size, but on the other
hand this isn't so bad when debug fusion is used.

v2: Use cc-option
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 Makefile          | 3 +++
 lib/Kconfig.debug | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/Makefile b/Makefile
index 6a717cd..fd76983 100644
--- a/Makefile
+++ b/Makefile
@@ -696,6 +696,9 @@ KBUILD_CFLAGS	+= -g
 endif
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
+ifdef CONFIG_DEBUG_INFO_DWARF4
+KBUILD_CFLAGS	+= $(call cc-option, -gdwarf-4,)
+endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
 KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0360468..a2dcf97 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -158,6 +158,15 @@ config DEBUG_INFO_SPLIT
 	  to know about the .dwo files and include them.
 	  Incompatible with older versions of ccache.
 
+config DEBUG_INFO_DWARF4
+	bool "Generate dwarf4 debuginfo"
+	depends on DEBUG_INFO
+	help
+	  Generate dwarf4 debug info. This requires recent versions
+	  of gcc and gdb. It makes the debug information larger.
+	  But it significantly improves the success of resolving
+	  variables in gdb on optimized code.
+
 config ENABLE_WARN_DEPRECATED
 	bool "Enable __deprecated logic"
 	default y
-- 
1.8.5.2

