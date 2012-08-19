Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:30968 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753025Ab2HSC51 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:27 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 20/74] x86, lto: Change dotraplinkage into __visible on 32bit
Date: Sat, 18 Aug 2012 19:56:16 -0700
Message-Id: <1345345030-22211-21-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Mark 32bit dotraplinkage functions as __visible for LTO.
64bit already is using asmlinkage which includes it.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/include/asm/traps.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/traps.h b/arch/x86/include/asm/traps.h
index 88eae2a..cc67b3f 100644
--- a/arch/x86/include/asm/traps.h
+++ b/arch/x86/include/asm/traps.h
@@ -7,7 +7,7 @@
 #include <asm/siginfo.h>			/* TRAP_TRACE, ... */
 
 #ifdef CONFIG_X86_32
-#define dotraplinkage
+#define dotraplinkage __visible
 #else
 #define dotraplinkage asmlinkage
 #endif
-- 
1.7.7.6

