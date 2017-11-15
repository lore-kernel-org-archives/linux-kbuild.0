Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:37314 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759217AbdKOVfC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Nov 2017 16:35:02 -0500
Received: by mail-io0-f194.google.com with SMTP id v21so3097460ioi.4
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Nov 2017 13:35:02 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 11/18] arm64: make mrs_s and msr_s macros work with LTO
Date: Wed, 15 Nov 2017 13:34:21 -0800
Message-Id: <20171115213428.22559-12-samitolvanen@google.com>
In-Reply-To: <20171115213428.22559-1-samitolvanen@google.com>
References: <20171115213428.22559-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

From: Alex Matveev <alxmtvv@gmail.com>

Use UNDEFINE_MRS_S and UNDEFINE_MSR_S to define corresponding macros
in-place and workaround gcc and clang limitations on redefining macros
across different assembler blocks.

Signed-off-by: Alex Matveev <alxmtvv@gmail.com>
Signed-off-by: Yury Norov <ynorov@caviumnetworks.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/arm64/include/asm/kvm_hyp.h |  8 ++++--
 arch/arm64/include/asm/sysreg.h  | 55 +++++++++++++++++++++++++++-------------
 2 files changed, 43 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index 4572a9b560fa..20bfb8e676e0 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -29,7 +29,9 @@
 	({								\
 		u64 reg;						\
 		asm volatile(ALTERNATIVE("mrs %0, " __stringify(r##nvh),\
-					 "mrs_s %0, " __stringify(r##vh),\
+					 DEFINE_MRS_S			\
+					 "mrs_s %0, " __stringify(r##vh) "\n"\
+					 UNDEFINE_MRS_S,		\
 					 ARM64_HAS_VIRT_HOST_EXTN)	\
 			     : "=r" (reg));				\
 		reg;							\
@@ -39,7 +41,9 @@
 	do {								\
 		u64 __val = (u64)(v);					\
 		asm volatile(ALTERNATIVE("msr " __stringify(r##nvh) ", %x0",\
-					 "msr_s " __stringify(r##vh) ", %x0",\
+					 DEFINE_MSR_S			\
+					 "msr_s " __stringify(r##vh) ", %x0\n"\
+					 UNDEFINE_MSR_S,		\
 					 ARM64_HAS_VIRT_HOST_EXTN)	\
 					 : : "rZ" (__val));		\
 	} while (0)
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 08cc88574659..3ae147c7e160 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -584,20 +584,39 @@
 
 #include <linux/types.h>
 
-asm(
-"	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n"
-"	.equ	.L__reg_num_x\\num, \\num\n"
-"	.endr\n"
+#define __DEFINE_MRS_MSR_S_REGNUM				\
+"	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30\n" \
+"	.equ	.L__reg_num_x\\num, \\num\n"			\
+"	.endr\n"						\
 "	.equ	.L__reg_num_xzr, 31\n"
-"\n"
-"	.macro	mrs_s, rt, sreg\n"
-	__emit_inst(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))
+
+#define DEFINE_MRS_S						\
+	__DEFINE_MRS_MSR_S_REGNUM				\
+"	.macro	mrs_s, rt, sreg\n"				\
+	__emit_inst(0xd5200000|(\\sreg)|(.L__reg_num_\\rt))	\
 "	.endm\n"
-"\n"
-"	.macro	msr_s, sreg, rt\n"
-	__emit_inst(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))
+
+#define DEFINE_MSR_S						\
+	__DEFINE_MRS_MSR_S_REGNUM				\
+"	.macro	msr_s, sreg, rt\n"				\
+	__emit_inst(0xd5000000|(\\sreg)|(.L__reg_num_\\rt))	\
 "	.endm\n"
-);
+
+#define UNDEFINE_MRS_S						\
+"	.purgem	mrs_s\n"
+
+#define UNDEFINE_MSR_S						\
+"	.purgem	msr_s\n"
+
+#define __mrs_s(r, v)						\
+	DEFINE_MRS_S						\
+"	mrs_s %0, " __stringify(r) "\n"				\
+	UNDEFINE_MRS_S : "=r" (v)
+
+#define __msr_s(r, v)						\
+	DEFINE_MSR_S						\
+"	msr_s " __stringify(r) ", %x0\n"			\
+	UNDEFINE_MSR_S : : "rZ" (v)
 
 /*
  * Unlike read_cpuid, calls to read_sysreg are never expected to be
@@ -623,15 +642,15 @@ asm(
  * For registers without architectural names, or simply unsupported by
  * GAS.
  */
-#define read_sysreg_s(r) ({						\
-	u64 __val;							\
-	asm volatile("mrs_s %0, " __stringify(r) : "=r" (__val));	\
-	__val;								\
+#define read_sysreg_s(r) ({					\
+	u64 __val;						\
+	asm volatile(__mrs_s(r, __val));			\
+	__val;							\
 })
 
-#define write_sysreg_s(v, r) do {					\
-	u64 __val = (u64)(v);						\
-	asm volatile("msr_s " __stringify(r) ", %x0" : : "rZ" (__val));	\
+#define write_sysreg_s(v, r) do {				\
+	u64 __val = (u64)(v);					\
+	asm volatile(__msr_s(r, __val));			\
 } while (0)
 
 static inline void config_sctlr_el1(u32 clear, u32 set)
-- 
2.15.0.448.gf294e3d99a-goog

