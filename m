Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:1635 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753395Ab2HSC5h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:37 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 34/74] x86, lto, lguest: Fix C functions used by inline assembler
Date: Sat, 18 Aug 2012 19:56:30 -0700
Message-Id: <1345345030-22211-35-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, rusty@rustcorp.com.au

From: Andi Kleen <ak@linux.intel.com>

- Make the C code used by the paravirt stubs visible
- Since they have to be global now, give them a more unique
name.

Cc: rusty@rustcorp.com.au
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/lguest/boot.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/lguest/boot.c b/arch/x86/lguest/boot.c
index 642d880..dd167d2 100644
--- a/arch/x86/lguest/boot.c
+++ b/arch/x86/lguest/boot.c
@@ -234,13 +234,13 @@ static void lguest_end_context_switch(struct task_struct *next)
  * flags word contains all kind of stuff, but in practice Linux only cares
  * about the interrupt flag.  Our "save_flags()" just returns that.
  */
-static unsigned long save_fl(void)
+asmlinkage unsigned long lguest_save_fl(void)
 {
 	return lguest_data.irq_enabled;
 }
 
 /* Interrupts go off... */
-static void irq_disable(void)
+asmlinkage void lguest_irq_disable(void)
 {
 	lguest_data.irq_enabled = 0;
 }
@@ -254,8 +254,8 @@ static void irq_disable(void)
  * PV_CALLEE_SAVE_REGS_THUNK(), which pushes %eax onto the stack, calls the
  * C function, then restores it.
  */
-PV_CALLEE_SAVE_REGS_THUNK(save_fl);
-PV_CALLEE_SAVE_REGS_THUNK(irq_disable);
+PV_CALLEE_SAVE_REGS_THUNK(lguest_save_fl);
+PV_CALLEE_SAVE_REGS_THUNK(lguest_irq_disable);
 /*:*/
 
 /* These are in i386_head.S */
@@ -1285,9 +1285,9 @@ __init void lguest_init(void)
 	 */
 
 	/* Interrupt-related operations */
-	pv_irq_ops.save_fl = PV_CALLEE_SAVE(save_fl);
+	pv_irq_ops.save_fl = PV_CALLEE_SAVE(lguest_save_fl);
 	pv_irq_ops.restore_fl = __PV_IS_CALLEE_SAVE(lg_restore_fl);
-	pv_irq_ops.irq_disable = PV_CALLEE_SAVE(irq_disable);
+	pv_irq_ops.irq_disable = PV_CALLEE_SAVE(lguest_irq_disable);
 	pv_irq_ops.irq_enable = __PV_IS_CALLEE_SAVE(lg_irq_enable);
 	pv_irq_ops.safe_halt = lguest_safe_halt;
 
-- 
1.7.7.6

