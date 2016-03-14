Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt32.smtp-out.videotron.ca ([24.53.0.21]:2743 "EHLO
	alt32.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754254AbcCNCnE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Mar 2016 22:43:04 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v6 2/8] allow for per-symbol configurable EXPORT_SYMBOL()
Date: Sun, 13 Mar 2016 22:42:10 -0400
Message-Id: <1457923336-2732-3-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Similar to include/generated/autoconf.h, include/generated/autoksyms.h
will contain a list of defines for each EXPORT_SYMBOL() that we want
active. The format is:

  #define __KSYM_<symbol_name> 1

This list will be auto-generated with another patch.  For now we only
include the preprocessor magic to automatically create or omit the
corresponding struct kernel_symbol declaration.

Given the content of include/generated/autoksyms.h may not be known in
advance, an empty file is created early on to let the build proceed.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 Makefile               |  2 ++
 include/linux/export.h | 22 ++++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6c1a3c2479..e916428cf7 100644
--- a/Makefile
+++ b/Makefile
@@ -986,6 +986,8 @@ prepare2: prepare3 outputmakefile asm-generic
 prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
                    include/config/auto.conf
 	$(cmd_crmodverdir)
+	$(Q)test -e include/generated/autoksyms.h || \
+	    touch   include/generated/autoksyms.h
 
 archprepare: archheaders archscripts prepare1 scripts_basic
 
diff --git a/include/linux/export.h b/include/linux/export.h
index 96e45ea463..77afdb2a25 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -38,7 +38,7 @@ extern struct module __this_module;
 
 #ifdef CONFIG_MODULES
 
-#ifndef __GENKSYMS__
+#if defined(__KERNEL__) && !defined(__GENKSYMS__)
 #ifdef CONFIG_MODVERSIONS
 /* Mark the CRC weak since genksyms apparently decides not to
  * generate a checksums for some symbols */
@@ -53,7 +53,7 @@ extern struct module __this_module;
 #endif
 
 /* For every exported symbol, place a struct in the __ksymtab section */
-#define __EXPORT_SYMBOL(sym, sec)				\
+#define ___EXPORT_SYMBOL(sym, sec)				\
 	extern typeof(sym) sym;					\
 	__CRC_SYMBOL(sym, sec)					\
 	static const char __kstrtab_##sym[]			\
@@ -65,6 +65,24 @@ extern struct module __this_module;
 	__attribute__((section("___ksymtab" sec "+" #sym), unused))	\
 	= { (unsigned long)&sym, __kstrtab_##sym }
 
+#ifdef CONFIG_TRIM_UNUSED_KSYMS
+
+#include <linux/kconfig.h>
+#include <generated/autoksyms.h>
+
+#define __EXPORT_SYMBOL(sym, sec)				\
+	__cond_export_sym(sym, sec, config_enabled(__KSYM_##sym))
+#define __cond_export_sym(sym, sec, conf)			\
+	___cond_export_sym(sym, sec, conf)
+#define ___cond_export_sym(sym, sec, enabled)			\
+	__cond_export_sym_##enabled(sym, sec)
+#define __cond_export_sym_1(sym, sec) ___EXPORT_SYMBOL(sym, sec)
+#define __cond_export_sym_0(sym, sec) /* nothing */
+
+#else
+#define __EXPORT_SYMBOL ___EXPORT_SYMBOL
+#endif
+
 #define EXPORT_SYMBOL(sym)					\
 	__EXPORT_SYMBOL(sym, "")
 
-- 
2.5.0

