Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36894 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753560Ab2HSC5j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:39 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 08/74] sections: Add __visible to tile sections
Date: Sat, 18 Aug 2012 19:56:04 -0700
Message-Id: <1345345030-22211-9-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/tile/include/asm/sections.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/tile/include/asm/sections.h b/arch/tile/include/asm/sections.h
index d062d46..edee549 100644
--- a/arch/tile/include/asm/sections.h
+++ b/arch/tile/include/asm/sections.h
@@ -27,11 +27,11 @@ extern char __w1data_begin[], __w1data_end[];
 
 
 /* Not exactly sections, but PC comparison points in the code. */
-extern char __rt_sigreturn[], __rt_sigreturn_end[];
+extern __visible char __rt_sigreturn[], __rt_sigreturn_end[];
 #ifndef __tilegx__
-extern char sys_cmpxchg[], __sys_cmpxchg_end[];
-extern char __sys_cmpxchg_grab_lock[];
-extern char __start_atomic_asm_code[], __end_atomic_asm_code[];
+extern __visible char sys_cmpxchg[], __sys_cmpxchg_end[];
+extern __visible char __sys_cmpxchg_grab_lock[];
+extern __visible char __start_atomic_asm_code[], __end_atomic_asm_code[];
 #endif
 
 /* Handle the discontiguity between _sdata and _stext. */
-- 
1.7.7.6

