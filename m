Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36894 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753937Ab2HSC5p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:45 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 49/74] x86, lto, paravirt: Add __visible/asmlinkage to xen paravirt ops
Date: Sat, 18 Aug 2012 19:56:45 -0700
Message-Id: <1345345030-22211-50-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, jeremy@goop.org

From: Andi Kleen <ak@linux.intel.com>

Cc: jeremy@goop.org
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/include/asm/paravirt_types.h |    3 ++-
 arch/x86/xen/xen-ops.h                |   16 ++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 142236e..4f262bc 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -386,7 +386,8 @@ extern struct pv_lock_ops pv_lock_ops;
 
 /* Simple instruction patching code. */
 #define DEF_NATIVE(ops, name, code) 					\
-	extern const char start_##ops##_##name[], end_##ops##_##name[];	\
+	extern const char start_##ops##_##name[] __visible, 		\
+			  end_##ops##_##name[] __visible;		\
 	asm("start_" #ops "_" #name ": " code "; end_" #ops "_" #name ":")
 
 unsigned paravirt_patch_nop(void);
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 1e4329e..1c4c94e 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -105,9 +105,9 @@ static inline void __init xen_init_apic(void)
 /* Declare an asm function, along with symbols needed to make it
    inlineable */
 #define DECL_ASM(ret, name, ...)		\
-	ret name(__VA_ARGS__);			\
-	extern char name##_end[];		\
-	extern char name##_reloc[]		\
+	asmlinkage ret name(__VA_ARGS__);	\
+	extern char name##_end[] __visible;	\
+	extern char name##_reloc[] __visible
 
 DECL_ASM(void, xen_irq_enable_direct, void);
 DECL_ASM(void, xen_irq_disable_direct, void);
@@ -115,11 +115,11 @@ DECL_ASM(unsigned long, xen_save_fl_direct, void);
 DECL_ASM(void, xen_restore_fl_direct, unsigned long);
 
 /* These are not functions, and cannot be called normally */
-void xen_iret(void);
-void xen_sysexit(void);
-void xen_sysret32(void);
-void xen_sysret64(void);
-void xen_adjust_exception_frame(void);
+asmlinkage void xen_iret(void);
+asmlinkage void xen_sysexit(void);
+asmlinkage void xen_sysret32(void);
+asmlinkage void xen_sysret64(void);
+asmlinkage void xen_adjust_exception_frame(void);
 
 extern int xen_panic_handler_init(void);
 
-- 
1.7.7.6

