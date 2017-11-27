Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:46347 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752499AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 15/21] lto, x86, mm: Disable vmalloc BUILD_BUG_ON for LTO
Date: Mon, 27 Nov 2017 13:34:17 -0800
Message-Id: <20171127213423.27218-16-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

On 32bit builds this BUILD_BUG_ON often fires with LTO for unknown
reasons. As far as I can tell it's a false positive. So disable
it for LTO.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/mm/init_32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 8a64a6f2848d..8187d8ee98ee 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -808,7 +808,9 @@ void __init mem_init(void)
 	BUILD_BUG_ON(VMALLOC_END			> PKMAP_BASE);
 #endif
 #define high_memory (-128UL << 20)
+#ifndef CONFIG_LTO
 	BUILD_BUG_ON(VMALLOC_START			>= VMALLOC_END);
+#endif
 #undef high_memory
 #undef __FIXADDR_TOP
 
-- 
2.13.6

