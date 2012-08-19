Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:14941 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753349Ab2HSC5e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:34 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 03/74] sections: Make external kallsyms tables __visible
Date: Sat, 18 Aug 2012 19:55:59 -0700
Message-Id: <1345345030-22211-4-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/kallsyms.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 2169fee..1b40cb7 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -36,20 +36,20 @@
  * These will be re-linked against their real values
  * during the second link stage.
  */
-extern const unsigned long kallsyms_addresses[] __attribute__((weak));
-extern const u8 kallsyms_names[] __attribute__((weak));
+extern __visible const unsigned long kallsyms_addresses[] __attribute__((weak));
+extern __visible const u8 kallsyms_names[] __attribute__((weak));
 
 /*
  * Tell the compiler that the count isn't in the small data section if the arch
  * has one (eg: FRV).
  */
-extern const unsigned long kallsyms_num_syms
+extern __visible const unsigned long kallsyms_num_syms
 __attribute__((weak, section(".rodata")));
 
-extern const u8 kallsyms_token_table[] __attribute__((weak));
-extern const u16 kallsyms_token_index[] __attribute__((weak));
+extern __visible const u8 kallsyms_token_table[] __attribute__((weak));
+extern __visible const u16 kallsyms_token_index[] __attribute__((weak));
 
-extern const unsigned long kallsyms_markers[] __attribute__((weak));
+extern __visible const unsigned long kallsyms_markers[] __attribute__((weak));
 
 static inline int is_kernel_inittext(unsigned long addr)
 {
-- 
1.7.7.6

