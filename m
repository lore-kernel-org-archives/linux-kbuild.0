Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37448 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758011AbYAXWEP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:15 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id 1317B801D98
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 65/77] compiler.h: introduce __section()
Date: Thu, 24 Jan 2008 23:03:46 +0100
Message-Id: <1201212238-4369-65-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Add a new helper: __section() that makes a section definition
much shorter and more readable.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 include/linux/compiler.h |    5 +++++
 include/linux/init.h     |   26 +++++++++++++-------------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index c68b67b..e0114a6 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -175,4 +175,9 @@ extern void __chk_io_ptr(const volatile void __iomem *);
 #define __cold
 #endif
 
+/* Simple shorthand for a section definition */
+#ifndef __section
+# define __section(S) __attribute__ ((__section__(#S)))
+#endif
+
 #endif /* __LINUX_COMPILER_H */
diff --git a/include/linux/init.h b/include/linux/init.h
index 5141381..9980768 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -40,10 +40,10 @@
 
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
-#define __init		__attribute__ ((__section__ (".init.text"))) __cold
-#define __initdata	__attribute__ ((__section__ (".init.data")))
-#define __exitdata	__attribute__ ((__section__(".exit.data")))
-#define __exit_call	__attribute_used__ __attribute__ ((__section__ (".exitcall.exit")))
+#define __init		__section(.init.text) __cold
+#define __initdata	__section(.init.data)
+#define __exitdata	__section(.exit.data)
+#define __exit_call	__attribute_used__ __section(.exitcall.exit)
 
 /* modpost check for section mismatches during the kernel build.
  * A section mismatch happens when there are references from a
@@ -55,14 +55,14 @@
  * the init/exit section (code or data) is valid and will teach modpost
  * not to issue a warning.
  * The markers follow same syntax rules as __init / __initdata. */
-#define __init_refok     noinline __attribute__ ((__section__ (".text.init.refok")))
-#define __initdata_refok          __attribute__ ((__section__ (".data.init.refok")))
-#define __exit_refok     noinline __attribute__ ((__section__ (".exit.text.refok")))
+#define __init_refok     noinline __section(.text.init.refok)
+#define __initdata_refok          __section(.data.init.refok)
+#define __exit_refok     noinline __section(.exit.text.refok)
 
 #ifdef MODULE
-#define __exit		__attribute__ ((__section__(".exit.text"))) __cold
+#define __exit		__section(.exit.text) __cold
 #else
-#define __exit		__attribute_used__ __attribute__ ((__section__(".exit.text"))) __cold
+#define __exit		__attribute_used__ __section(.exit.text) __cold
 #endif
 
 /* For assembly routines */
@@ -142,11 +142,11 @@ void prepare_namespace(void);
 
 #define console_initcall(fn) \
 	static initcall_t __initcall_##fn \
-	__attribute_used__ __attribute__((__section__(".con_initcall.init")))=fn
+	__attribute_used__ __section(.con_initcall.init)=fn
 
 #define security_initcall(fn) \
 	static initcall_t __initcall_##fn \
-	__attribute_used__ __attribute__((__section__(".security_initcall.init"))) = fn
+	__attribute_used__ __section(.security_initcall.init) = fn
 
 struct obs_kernel_param {
 	const char *str;
@@ -164,7 +164,7 @@ struct obs_kernel_param {
 	static char __setup_str_##unique_id[] __initdata __aligned(1) = str; \
 	static struct obs_kernel_param __setup_##unique_id	\
 		__attribute_used__				\
-		__attribute__((__section__(".init.setup")))	\
+		__section(.init.setup)				\
 		__attribute__((aligned((sizeof(long)))))	\
 		= { __setup_str_##unique_id, fn, early }
 
@@ -242,7 +242,7 @@ void __init parse_early_param(void);
 #endif
 
 /* Data marked not to be saved by software suspend */
-#define __nosavedata __attribute__ ((__section__ (".data.nosave")))
+#define __nosavedata __section(.data.nosave)
 
 /* This means "can be init if no module support, otherwise module load
    may call it." */
-- 
1.5.4.rc3.14.g44397

