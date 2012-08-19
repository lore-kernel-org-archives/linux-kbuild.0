Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:14941 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753509Ab2HSC5i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:38 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 05/74] sections: Add __visible to m68k sections
Date: Sat, 18 Aug 2012 19:56:01 -0700
Message-Id: <1345345030-22211-6-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 arch/m68k/include/asm/module.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/module.h b/arch/m68k/include/asm/module.h
index edffe66..15cb110 100644
--- a/arch/m68k/include/asm/module.h
+++ b/arch/m68k/include/asm/module.h
@@ -30,7 +30,7 @@ struct mod_arch_specific {
 
 #endif /* CONFIG_MMU */
 
-extern struct m68k_fixup_info __start_fixup[], __stop_fixup[];
+extern __visible struct m68k_fixup_info __start_fixup[], __stop_fixup[];
 
 struct module;
 extern void module_fixup(struct module *mod, struct m68k_fixup_info *start,
-- 
1.7.7.6

