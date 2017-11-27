Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:34272 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751977AbdK0Vea (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:30 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 01/21] x86/xen: Mark pv stub assembler symbol visible
Date: Mon, 27 Nov 2017 13:34:03 -0800
Message-Id: <20171127213423.27218-2-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

With LTO any external assembler symbol has to be marked __visible.
Mark the generated asm PV stubs __visible to prevent a linker error.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/include/asm/paravirt.h | 3 ++-
 drivers/xen/time.c              | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 283efcaac8af..cf2861aa4df0 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -745,7 +745,8 @@ static __always_inline bool pv_vcpu_is_preempted(long cpu)
  */
 #define PV_THUNK_NAME(func) "__raw_callee_save_" #func
 #define PV_CALLEE_SAVE_REGS_THUNK(func)					\
-	extern typeof(func) __raw_callee_save_##func;			\
+	extern __visible typeof(func) __raw_callee_save_##func;		\
+	extern __visible typeof(func) func;				\
 									\
 	asm(".pushsection .text;"					\
 	    ".globl " PV_THUNK_NAME(func) ";"				\
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 3e741cd1409c..708a00c337d7 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -144,7 +144,7 @@ void xen_get_runstate_snapshot(struct vcpu_runstate_info *res)
 }
 
 /* return true when a vcpu could run but has no real cpu to run on */
-bool xen_vcpu_stolen(int vcpu)
+__visible bool xen_vcpu_stolen(int vcpu)
 {
 	return per_cpu(xen_runstate, vcpu).state == RUNSTATE_runnable;
 }
-- 
2.13.6

