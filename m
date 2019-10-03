Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:59223 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbfJCH7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 3/6] module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol conflict
Date: Thu,  3 Oct 2019 16:58:23 +0900
Message-Id: <20191003075826.7478-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shaun Ruffell <sruffell@sruffell.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

The module namespace produces __strtab_ns_<sym> symbols to store
namespace strings, but it does not guarantee the name uniqueness.
This is a potential problem because we have exported symbols starting
with "ns_".

For example, kernel/capability.c exports the following symbols:

  EXPORT_SYMBOL(ns_capable);
  EXPORT_SYMBOL(capable);

Assume a situation where those are converted as follows:

  EXPORT_SYMBOL_NS(ns_capable, some_namespace);
  EXPORT_SYMBOL_NS(capable, some_namespace);

The former expands to "__kstrtab_ns_capable" and "__kstrtab_ns_ns_capable",
and the latter to "__kstrtab_capable" and "__kstrtab_ns_capable".
Then, we have the duplicated "__kstrtab_ns_capable".

To ensure the uniqueness, rename "__kstrtab_ns_*" to "__kstrtabns_*".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2: None

 include/linux/export.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 0695d4e847d9..621158ecd2e2 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -55,7 +55,7 @@ extern struct module __this_module;
 	    "__ksymtab_" #ns NS_SEPARATOR #sym ":		\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
-	    "	.long	__kstrtab_ns_" #sym "- .		\n"	\
+	    "	.long	__kstrtabns_" #sym "- .			\n"	\
 	    "	.previous					\n")
 
 #define __KSYMTAB_ENTRY(sym, sec)					\
@@ -79,7 +79,7 @@ struct kernel_symbol {
 	asm("__ksymtab_" #ns NS_SEPARATOR #sym)				\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
 	__aligned(sizeof(void *))					\
-	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtab_ns_##sym }
+	= { (unsigned long)&sym, __kstrtab_##sym, __kstrtabns_##sym }
 
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	static const struct kernel_symbol __ksymtab_##sym		\
@@ -112,7 +112,7 @@ struct kernel_symbol {
 /* For every exported symbol, place a struct in the __ksymtab section */
 #define ___EXPORT_SYMBOL_NS(sym, sec, ns)				\
 	___export_symbol_common(sym, sec);				\
-	static const char __kstrtab_ns_##sym[]				\
+	static const char __kstrtabns_##sym[]				\
 	__attribute__((section("__ksymtab_strings"), used, aligned(1)))	\
 	= #ns;								\
 	__KSYMTAB_ENTRY_NS(sym, sec, ns)
-- 
2.17.1
