Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52091 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935484AbeFZNPt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 09:15:49 -0400
Received: by mail-wm0-f66.google.com with SMTP id w137-v6so1907452wmw.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jun 2018 06:15:49 -0700 (PDT)
From: Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v4 08/17] khwasan, arm64: fix up fault handling logic
Date: Tue, 26 Jun 2018 15:15:18 +0200
Message-Id: <9f3e30f8144682c989bbf9fdac081501258a0b06.1530018818.git.andreyknvl@google.com>
In-Reply-To: <cover.1530018818.git.andreyknvl@google.com>
References: <cover.1530018818.git.andreyknvl@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Nick Desaulniers <ndesaulniers@google.com>, Marc Zyngier <marc.zyngier@arm.com>, Dave Martin <dave.martin@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Ingo Molnar <mingo@kernel.org>, Paul Lawrence <paullawrence@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sparse@vger.kernel.org, linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Cc: Kostya Serebryany <kcc@google.com>, Evgeniy Stepanov <eugenis@google.com>, Lee Smith <Lee.Smith@arm.com>, Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Jacob Bramley <Jacob.Bramley@arm.com>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Jann Horn <jannh@google.com>, Mark Brand <markbrand@google.com>, Chintan Pandya <cpandya@codeaurora.org>, Andrey Konovalov <andreyknvl@google.com>

show_pte in arm64 fault handling relies on the fact that the top byte of
a kernel pointer is 0xff, which isn't always the case with KHWASAN enabled.
Reset the top byte.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b8eecc7b9531..b7b152783d54 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -32,6 +32,7 @@
 #include <linux/perf_event.h>
 #include <linux/preempt.h>
 #include <linux/hugetlb.h>
+#include <linux/kasan.h>
 
 #include <asm/bug.h>
 #include <asm/cmpxchg.h>
@@ -134,6 +135,8 @@ void show_pte(unsigned long addr)
 	pgd_t *pgdp;
 	pgd_t pgd;
 
+	addr = (unsigned long)khwasan_reset_tag((void *)addr);
+
 	if (addr < TASK_SIZE) {
 		/* TTBR0 */
 		mm = current->active_mm;
-- 
2.18.0.rc2.346.g013aa6912e-goog

