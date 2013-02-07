Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:52856 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030217Ab3BGV6u (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Feb 2013 16:58:50 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Kbuild: Disable var tracking with CONFIG_DEBUG_INFO_REDUCED
Date: Thu,  7 Feb 2013 13:58:40 -0800
Message-Id: <1360274320-26833-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Newer gcc enables the var-tracking pass with -g to keep track which
registers contain which variables. This is one of the slower passes in gcc.

With reduced debug info (aimed at objdump -S, but not using a full debugger)
we don't need this fine grained tracking. But it was still enabled
because -g was enabled. Disable it explicitely for DEBUG_INFO_REDUCED.

On my 8T workstation this gives me about a 12 second gain in building
a reasonable kernel config (2min16 vs 2min28) with DEBUG_INFO_REDUCED.
With full DEBUG_INFO it takes 2min46

The actual improvement in user time taken by the compiler is much higher
(all CPU combined user time 15min5s vs 16m30 before)
but the usual amdahl bottleneck on the linker prevents more speedup.
It still saves some more energy and keeps cycles for other things.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 Makefile |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 54dfde5..7e423df 100644
--- a/Makefile
+++ b/Makefile
@@ -619,7 +619,8 @@ KBUILD_AFLAGS	+= -gdwarf-2
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
-KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly)
+KBUILD_CFLAGS 	+= $(call cc-option, -femit-struct-debug-baseonly) \
+		   $(call cc-option,-fno-var-tracking)
 endif
 
 ifdef CONFIG_FUNCTION_TRACER
-- 
1.7.7.6

