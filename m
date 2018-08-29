Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:38184 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728451AbeH2PcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Aug 2018 11:32:04 -0400
Received: by mail-wm0-f65.google.com with SMTP id t25-v6so5153628wmi.3
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Aug 2018 04:35:35 -0700 (PDT)
From: Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v6 04/18] khwasan, arm64: adjust shadow size for CONFIG_KASAN_HW
Date: Wed, 29 Aug 2018 13:35:08 +0200
Message-Id: <b4ba65afa55f2fdfd2856fb03c5aba99c7a8bdd7.1535462971.git.andreyknvl@google.com>
In-Reply-To: <cover.1535462971.git.andreyknvl@google.com>
References: <cover.1535462971.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Cc: Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, Chintan Pandya <cpandya@codeaurora.org>, Vishwath Mohan <vishwath@google.com>, Andrey Konovalov <andreyknvl@google.com>

KWHASAN uses 1 shadow byte for 16 bytes of kernel memory, so it requires
1/16th of the kernel virtual address space for the shadow memory.

This commit sets KASAN_SHADOW_SCALE_SHIFT to 4 when KHWASAN is enabled.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/Makefile             |  2 +-
 arch/arm64/include/asm/memory.h | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 106039d25e2f..17047b8ab984 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -94,7 +94,7 @@ endif
 # KASAN_SHADOW_OFFSET = VA_START + (1 << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #				 - (1 << (64 - KASAN_SHADOW_SCALE_SHIFT))
 # in 32-bit arithmetic
-KASAN_SHADOW_SCALE_SHIFT := 3
+KASAN_SHADOW_SCALE_SHIFT := $(if $(CONFIG_KASAN_HW), 4, 3)
 KASAN_SHADOW_OFFSET := $(shell printf "0x%08x00000000\n" $$(( \
 	(0xffffffff & (-1 << ($(CONFIG_ARM64_VA_BITS) - 32))) \
 	+ (1 << ($(CONFIG_ARM64_VA_BITS) - 32 - $(KASAN_SHADOW_SCALE_SHIFT))) \
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index b96442960aea..f5e262ee76c1 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -74,12 +74,17 @@
 #define KERNEL_END        _end
 
 /*
- * KASAN requires 1/8th of the kernel virtual address space for the shadow
- * region. KASAN can bloat the stack significantly, so double the (minimum)
- * stack size when KASAN is in use.
+ * KASAN and KHWASAN require 1/8th and 1/16th of the kernel virtual address
+ * space for the shadow region respectively. They can bloat the stack
+ * significantly, so double the (minimum) stack size when they are in use.
  */
-#ifdef CONFIG_KASAN
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_SCALE_SHIFT 3
+#endif
+#ifdef CONFIG_KASAN_HW
+#define KASAN_SHADOW_SCALE_SHIFT 4
+#endif
+#ifdef CONFIG_KASAN
 #define KASAN_SHADOW_SIZE	(UL(1) << (VA_BITS - KASAN_SHADOW_SCALE_SHIFT))
 #define KASAN_THREAD_SHIFT	1
 #else
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog
