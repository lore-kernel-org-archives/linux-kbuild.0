Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:61322 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755892AbcBHUnq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:43:46 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 2/6] allow for per-symbol configurable EXPORT_SYMBOL()
Date: Mon, 08 Feb 2016 15:28:31 -0500
Message-id: <1454963315-20468-3-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

Similar to include/generated/autoconf.h, include/generated/expsyms.h will
contain a list of defines for each EXPORT_SYMBOL() that we want active.
The format is:

  #define __EXPSYM_<symbol_name> 1

This list will be auto-generated with another patch.  For now we only
include the preprocessor magic to automatically create or omit the
corresponding struct kernel_symbol declaration.

Given the content of include/generated/expsyms.h may not be known in
advance, an empty file is created early on to let the build proceed.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
---
 Makefile               |  1 +
 include/linux/export.h | 22 ++++++++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6c1a3c2479..3a264129f8 100644
--- a/Makefile
+++ b/Makefile
@@ -986,6 +986,7 @@ prepare2: prepare3 outputmakefile asm-generic
 prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
                    include/config/auto.conf
 	$(cmd_crmodverdir)
+	$(Q)touch include/generated/expsyms.h
 
 archprepare: archheaders archscripts prepare1 scripts_basic
 
diff --git a/include/linux/export.h b/include/linux/export.h
index 96e45ea463..f8e4d9da35 100644
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
 
+#ifdef CONFIG_TRIM_UNUSED_EXPSYMS
+
+#include <linux/kconfig.h>
+#include <generated/expsyms.h>
+
+#define __EXPORT_SYMBOL(sym, sec)				\
+	__cond_export_sym(sym, sec, config_enabled(__EXPSYM_##sym))
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

