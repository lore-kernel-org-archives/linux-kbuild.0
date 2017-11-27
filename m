Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:14694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752759AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 08/21] x86/idt: Make const __initconst
Date: Mon, 27 Nov 2017 13:34:10 -0800
Message-Id: <20171127213423.27218-9-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

const variables must use __initconst, not __initdata. Fix this up
for the new IDT tables recently added, which got it consistently wrong.

Fixes a whole range of commits between
16bc18d895ce x86/idt: Move 32-bit idt_descr to C code
and
dc20b2d52653 x86/idt: Move interrupt gate initialization to IDT code

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/kernel/idt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
index d985cef3984f..56d99be3706a 100644
--- a/arch/x86/kernel/idt.c
+++ b/arch/x86/kernel/idt.c
@@ -56,7 +56,7 @@ struct idt_data {
  * Early traps running on the DEFAULT_STACK because the other interrupt
  * stacks work only after cpu_init().
  */
-static const __initdata struct idt_data early_idts[] = {
+static const __initconst struct idt_data early_idts[] = {
 	INTG(X86_TRAP_DB,		debug),
 	SYSG(X86_TRAP_BP,		int3),
 #ifdef CONFIG_X86_32
@@ -70,7 +70,7 @@ static const __initdata struct idt_data early_idts[] = {
  * the traps which use them are reinitialized with IST after cpu_init() has
  * set up TSS.
  */
-static const __initdata struct idt_data def_idts[] = {
+static const __initconst struct idt_data def_idts[] = {
 	INTG(X86_TRAP_DE,		divide_error),
 	INTG(X86_TRAP_NMI,		nmi),
 	INTG(X86_TRAP_BR,		bounds),
@@ -108,7 +108,7 @@ static const __initdata struct idt_data def_idts[] = {
 /*
  * The APIC and SMP idt entries
  */
-static const __initdata struct idt_data apic_idts[] = {
+static const __initconst struct idt_data apic_idts[] = {
 #ifdef CONFIG_SMP
 	INTG(RESCHEDULE_VECTOR,		reschedule_interrupt),
 	INTG(CALL_FUNCTION_VECTOR,	call_function_interrupt),
@@ -150,7 +150,7 @@ static const __initdata struct idt_data apic_idts[] = {
  * Early traps running on the DEFAULT_STACK because the other interrupt
  * stacks work only after cpu_init().
  */
-static const __initdata struct idt_data early_pf_idts[] = {
+static const __initconst struct idt_data early_pf_idts[] = {
 	INTG(X86_TRAP_PF,		page_fault),
 };
 
@@ -158,7 +158,7 @@ static const __initdata struct idt_data early_pf_idts[] = {
  * Override for the debug_idt. Same as the default, but with interrupt
  * stack set to DEFAULT_STACK (0). Required for NMI trap handling.
  */
-static const __initdata struct idt_data dbg_idts[] = {
+static const __initconst struct idt_data dbg_idts[] = {
 	INTG(X86_TRAP_DB,	debug),
 	INTG(X86_TRAP_BP,	int3),
 };
@@ -180,7 +180,7 @@ gate_desc debug_idt_table[IDT_ENTRIES] __page_aligned_bss;
  * The exceptions which use Interrupt stacks. They are setup after
  * cpu_init() when the TSS has been initialized.
  */
-static const __initdata struct idt_data ist_idts[] = {
+static const __initconst struct idt_data ist_idts[] = {
 	ISTG(X86_TRAP_DB,	debug,		DEBUG_STACK),
 	ISTG(X86_TRAP_NMI,	nmi,		NMI_STACK),
 	SISTG(X86_TRAP_BP,	int3,		DEBUG_STACK),
-- 
2.13.6

