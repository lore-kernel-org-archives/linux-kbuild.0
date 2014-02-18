Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47208 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755915AbaBROZd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:25:33 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 2/6] kbuild: Put kallsyms into own section
Date: Tue, 18 Feb 2014 15:24:26 +0100
Message-Id: <1392733470-8228-3-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733470-8228-1-git-send-email-andi@firstfloor.org>
References: <1392733470-8228-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Put the kallsyms information into an own .kallsyms section.
This makes it easier to patch the kallsyms inside the executable.
Otherwise it shouldn't change anything.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 include/asm-generic/vmlinux.lds.h | 4 ++++
 scripts/kallsyms.c                | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bc2121f..6214f18 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -280,6 +280,10 @@
 									\
 	TRACEDATA							\
 									\
+	.kallsyms          : AT(ADDR(.kallsyms) - LOAD_OFFSET) {	\
+		*(.kallsyms)						\
+	}								\
+									\
 	/* Kernel symbol table: Normal symbols */			\
 	__ksymtab         : AT(ADDR(__ksymtab) - LOAD_OFFSET) {		\
 		VMLINUX_SYMBOL(__start___ksymtab) = .;			\
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 56f5986..ceef756 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -314,7 +314,7 @@ static void write_src(void)
 	printf("#define ALGN .align 4\n");
 	printf("#endif\n");
 
-	printf("\t.section .rodata, \"a\"\n");
+	printf("\t.section .kallsyms, \"a\"\n");
 
 	/* Provide proper symbols relocatability by their '_text'
 	 * relativeness.  The symbol names cannot be used to construct
-- 
1.8.5.2

