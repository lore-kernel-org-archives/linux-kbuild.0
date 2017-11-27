Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:30248 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752621AbdK0Vec (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Nov 2017 16:34:32 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 03/21] x86/timer: Don't inline __const_udelay
Date: Mon, 27 Nov 2017 13:34:05 -0800
Message-Id: <20171127213423.27218-4-andi@firstfloor.org>
In-Reply-To: <20171127213423.27218-1-andi@firstfloor.org>
References: <20171127213423.27218-1-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, samitolvanen@google.com, alxmtvv@gmail.com, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

__const_udelay is marked inline, and LTO will happily inline it everywhere
Dropping the inline saves ~44k text in a LTO build.

13999560        1740864 1499136 17239560        1070e08 vmlinux-with-udelay-inline
13954764        1736768 1499136 17190668        1064f0c vmlinux-wo-udelay-inline

Even without LTO I believe marking it noinline documents it correctly.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/lib/delay.c b/arch/x86/lib/delay.c
index 553f8fd23cc4..09c83b2f80d2 100644
--- a/arch/x86/lib/delay.c
+++ b/arch/x86/lib/delay.c
@@ -162,7 +162,7 @@ void __delay(unsigned long loops)
 }
 EXPORT_SYMBOL(__delay);
 
-inline void __const_udelay(unsigned long xloops)
+void __const_udelay(unsigned long xloops)
 {
 	unsigned long lpj = this_cpu_read(cpu_info.loops_per_jiffy) ? : loops_per_jiffy;
 	int d0;
-- 
2.13.6

