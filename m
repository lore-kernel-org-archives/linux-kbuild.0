Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:44069 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753454Ab2HSC5h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:37 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 30/74] x86, lto: Fix AMD K6 indirect call check
Date: Sat, 18 Aug 2012 19:56:26 -0700
Message-Id: <1345345030-22211-31-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

The AMD K6 errata check relies on timing a indirect call.
But the way it was written it could be optimized to a direct call.
Force gcc to actually do a indirect call and not just
constant resolve the target address.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/x86/kernel/cpu/amd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 2c02d92..cb72014 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -116,7 +116,7 @@ static void __cpuinit init_amd_k6(struct cpuinfo_x86 *c)
 		 */
 
 		n = K6_BUG_LOOP;
-		f_vide = vide;
+		asm("" : "=r" (f_vide) : "0" (vide));
 		rdtscl(d);
 		while (n--)
 			f_vide();
-- 
1.7.7.6

