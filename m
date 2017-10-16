Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:56948 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753066AbdJPNZB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 09:25:01 -0400
From: Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 3/4] kvm/arm64: simplify CC instrumentation opt-out
Date: Mon, 16 Oct 2017 14:24:39 +0100
Message-Id: <20171016132440.38098-4-mark.rutland@arm.com>
In-Reply-To: <20171016132440.38098-1-mark.rutland@arm.com>
References: <20171016132440.38098-1-mark.rutland@arm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adech.fo@gmail.com, aryabinin@virtuozzo.com, catalin.marinas@arm.com, christoffer.dall@linaro.org, dvyukov@google.com, linux-kbuild@vger.kernel.org, mark.rutland@arm.com, mark.zyngier@arm.com, mmarek@suse.com, will.deacon@arm.com, yamada.masahiro@socionext.com

Now that we can opt out of all instrumentation with a single option,
make use of this in the KVM hyp code. Hopefully, this will also avoid
fragility as new options are introduced.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christoffer Dall <christoffer.dall@linaro.org>
Cc: Marc Zyngier <mark.zyngier@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
---
 arch/arm64/kvm/hyp/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index 14c4e3b14bcb..a8a212eb66f1 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -22,7 +22,4 @@ obj-$(CONFIG_KVM_ARM_HOST) += s2-setup.o
 # KVM code is run at a different exception code with a different map, so
 # compiler instrumentation that inserts callbacks or checks into the code may
 # cause crashes. Just disable it.
-GCOV_PROFILE	:= n
-KASAN_SANITIZE	:= n
-UBSAN_SANITIZE	:= n
-KCOV_INSTRUMENT	:= n
+CC_INSTRUMENT	:= n
-- 
2.11.0

