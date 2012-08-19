Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:45201 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753119Ab2HSC52 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:28 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 50/74] x86, lto: Make empty_zero_page __visible for LTO
Date: Sat, 18 Aug 2012 19:56:46 -0700
Message-Id: <1345345030-22211-51-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/include/asm/pgtable.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 49afb3f..72b24ab 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -22,7 +22,8 @@
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
+extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
+	__visible;
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
 extern spinlock_t pgd_lock;
-- 
1.7.7.6

