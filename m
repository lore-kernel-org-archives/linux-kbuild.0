Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:51768 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752954Ab2HSC51 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:27 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 27/74] lto: Mark EXPORT_SYMBOL symbols __visible
Date: Sat, 18 Aug 2012 19:56:23 -0700
Message-Id: <1345345030-22211-28-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/linux/export.h |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 696c0f4..784617e 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -47,7 +47,7 @@ extern struct module __this_module;
 
 /* For every exported symbol, place a struct in the __ksymtab section */
 #define __EXPORT_SYMBOL(sym, sec)				\
-	extern typeof(sym) sym;					\
+	extern typeof(sym) sym __visible;			\
 	__CRC_SYMBOL(sym, sec)					\
 	static const char __kstrtab_##sym[]			\
 	__attribute__((section("__ksymtab_strings"), aligned(1))) \
@@ -78,11 +78,13 @@ extern struct module __this_module;
 
 #else /* !CONFIG_MODULES... */
 
-#define EXPORT_SYMBOL(sym)
-#define EXPORT_SYMBOL_GPL(sym)
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)
-#define EXPORT_UNUSED_SYMBOL(sym)
-#define EXPORT_UNUSED_SYMBOL_GPL(sym)
+/* Even without modules keep the __visible side effect */
+
+#define EXPORT_SYMBOL(sym) extern typeof(sym) sym __visible
+#define EXPORT_SYMBOL_GPL(sym) extern typeof(sym) sym __visible
+#define EXPORT_SYMBOL_GPL_FUTURE(sym) extern typeof(sym) sym __visible
+#define EXPORT_UNUSED_SYMBOL(sym) extern typeof(sym) sym __visible
+#define EXPORT_UNUSED_SYMBOL_GPL(sym) extern typeof(sym) sym __visible
 
 #endif /* CONFIG_MODULES */
 
-- 
1.7.7.6

