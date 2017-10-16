Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:56942 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753048AbdJPNY5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 09:24:57 -0400
From: Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/4] arm64: prevent instrumentation of LL/SC atomics
Date: Mon, 16 Oct 2017 14:24:38 +0100
Message-Id: <20171016132440.38098-3-mark.rutland@arm.com>
In-Reply-To: <20171016132440.38098-1-mark.rutland@arm.com>
References: <20171016132440.38098-1-mark.rutland@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, mark.rutland@arm.com, mark.zyngier@arm.com, mmarek@suse.com, will.deacon@arm.com, yamada.masahiro@socionext.com

While we build the LL/SC atomics as a C object file, this does not
follow the AAPCS. This does not interoperate with other C code, and can
only be called from special wrapper assembly.

Bulding a kernel with CONFIG_KCOV and CONFIG_ARM64_LSE_ATOMICS results
in the cmopiler inserting calls to __sanitizer_cov_trace_pc within the
LL/SC atomics. As __sanitizer_cov_trace_pc is built per the AAPCS, these
calls corrupt register values, resulting in failures at boot time.

Avoid this (and other similar issues) by opting out of all compiler
instrumentation. We can opt-in to specific instrumentation in future if
we want to.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
---
 arch/arm64/lib/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index a0abc142c92b..af77516f71b2 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -17,5 +17,6 @@ CFLAGS_atomic_ll_sc.o	:= -fcall-used-x0 -ffixed-x1 -ffixed-x2		\
 		   -fcall-saved-x10 -fcall-saved-x11 -fcall-saved-x12	\
 		   -fcall-saved-x13 -fcall-saved-x14 -fcall-saved-x15	\
 		   -fcall-saved-x18
+CC_INSTRUMENT_atomic_ll_sc.o := n
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
-- 
2.11.0

