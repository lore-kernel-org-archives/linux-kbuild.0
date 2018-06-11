Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25553 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753780AbeFKCiQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jun 2018 22:38:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] linux/linkage.h: replace VMLINUX_SYMBOL_STR() with __stringify()
Date: Mon, 11 Jun 2018 11:35:26 +0900
Message-Id: <1528684526-17114-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Will Deacon <will.deacon@arm.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>

With the special case handling for Blackfin and Metag was removed by
commit 94e58e0ac312 ("export.h: remove code for prefixing symbols with
underscore"), VMLINUX_SYMBOL_STR() is now equivalent to __stringify().

Replace some remaining usages in <linux/linkage.h> to prepare for the
entire removal of VMLINUX_SYMBOL_STR().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/linkage.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index f68db9e..d7618c4 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -24,16 +24,16 @@
 
 #ifndef cond_syscall
 #define cond_syscall(x)	asm(				\
-	".weak " VMLINUX_SYMBOL_STR(x) "\n\t"		\
-	".set  " VMLINUX_SYMBOL_STR(x) ","		\
-		 VMLINUX_SYMBOL_STR(sys_ni_syscall))
+	".weak " __stringify(x) "\n\t"			\
+	".set  " __stringify(x) ","			\
+		 __stringify(sys_ni_syscall))
 #endif
 
 #ifndef SYSCALL_ALIAS
 #define SYSCALL_ALIAS(alias, name) asm(			\
-	".globl " VMLINUX_SYMBOL_STR(alias) "\n\t"	\
-	".set   " VMLINUX_SYMBOL_STR(alias) ","		\
-		  VMLINUX_SYMBOL_STR(name))
+	".globl " __stringify(alias) "\n\t"		\
+	".set   " __stringify(alias) ","		\
+		  __stringify(name))
 #endif
 
 #define __page_aligned_data	__section(.data..page_aligned) __aligned(PAGE_SIZE)
-- 
2.7.4

