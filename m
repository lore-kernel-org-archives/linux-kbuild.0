Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:65529 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752729AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 07/21] x86: Make exception handler functions visible
Date: Mon, 27 Nov 2017 13:34:09 -0800
Message-Id: <20171127213423.27218-8-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Make the C exception handler functions that are directly called through
exception tables visible. LTO needs to know they are accessed from assembler.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/mm/extable.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/mm/extable.c b/arch/x86/mm/extable.c
index 3321b446b66c..abe60607e8b9 100644
--- a/arch/x86/mm/extable.c
+++ b/arch/x86/mm/extable.c
@@ -20,7 +20,7 @@ ex_fixup_handler(const struct exception_table_entry *x)
 	return (ex_handler_t)((unsigned long)&x->handler + x->handler);
 }
 
-bool ex_handler_default(const struct exception_table_entry *fixup,
+__visible bool ex_handler_default(const struct exception_table_entry *fixup,
 		       struct pt_regs *regs, int trapnr)
 {
 	regs->ip = ex_fixup_addr(fixup);
@@ -28,7 +28,7 @@ bool ex_handler_default(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL(ex_handler_default);
 
-bool ex_handler_fault(const struct exception_table_entry *fixup,
+__visible bool ex_handler_fault(const struct exception_table_entry *fixup,
 		     struct pt_regs *regs, int trapnr)
 {
 	regs->ip = ex_fixup_addr(fixup);
@@ -41,7 +41,7 @@ EXPORT_SYMBOL_GPL(ex_handler_fault);
  * Handler for UD0 exception following a failed test against the
  * result of a refcount inc/dec/add/sub.
  */
-bool ex_handler_refcount(const struct exception_table_entry *fixup,
+__visible bool ex_handler_refcount(const struct exception_table_entry *fixup,
 			 struct pt_regs *regs, int trapnr)
 {
 	/* First unconditionally saturate the refcount. */
@@ -94,6 +94,7 @@ EXPORT_SYMBOL_GPL(ex_handler_refcount);
  * of vulnerability by restoring from the initial state (essentially, zeroing
  * out all the FPU registers) if we can't restore from the task's FPU state.
  */
+__visible
 bool ex_handler_fprestore(const struct exception_table_entry *fixup,
 			  struct pt_regs *regs, int trapnr)
 {
@@ -107,7 +108,7 @@ bool ex_handler_fprestore(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL_GPL(ex_handler_fprestore);
 
-bool ex_handler_ext(const struct exception_table_entry *fixup,
+__visible bool ex_handler_ext(const struct exception_table_entry *fixup,
 		   struct pt_regs *regs, int trapnr)
 {
 	/* Special hack for uaccess_err */
@@ -117,7 +118,7 @@ bool ex_handler_ext(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL(ex_handler_ext);
 
-bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
+__visible bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
 			     struct pt_regs *regs, int trapnr)
 {
 	if (pr_warn_once("unchecked MSR access error: RDMSR from 0x%x at rIP: 0x%lx (%pF)\n",
@@ -132,7 +133,7 @@ bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL(ex_handler_rdmsr_unsafe);
 
-bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *fixup,
+__visible bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *fixup,
 			     struct pt_regs *regs, int trapnr)
 {
 	if (pr_warn_once("unchecked MSR access error: WRMSR to 0x%x (tried to write 0x%08x%08x) at rIP: 0x%lx (%pF)\n",
@@ -146,7 +147,7 @@ bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL(ex_handler_wrmsr_unsafe);
 
-bool ex_handler_clear_fs(const struct exception_table_entry *fixup,
+__visible bool ex_handler_clear_fs(const struct exception_table_entry *fixup,
 			 struct pt_regs *regs, int trapnr)
 {
 	if (static_cpu_has(X86_BUG_NULL_SEG))
@@ -156,7 +157,7 @@ bool ex_handler_clear_fs(const struct exception_table_entry *fixup,
 }
 EXPORT_SYMBOL(ex_handler_clear_fs);
 
-bool ex_has_fault_handler(unsigned long ip)
+__visible bool ex_has_fault_handler(unsigned long ip)
 {
 	const struct exception_table_entry *e;
 	ex_handler_t handler;
-- 
2.13.6

