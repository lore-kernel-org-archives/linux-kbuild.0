Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:47111 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752882AbaBNVWu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:22:50 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 12/19] Kbuild, lto: Disable LTO for asm-offsets.c
Date: Fri, 14 Feb 2014 22:21:36 +0100
Message-Id: <1392412903-25733-13-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
References: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

The asm-offset.c technique to fish data out of the assembler file
does not work with LTO. Just disable for the asm-offset.c build.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d5d859c..9f0ee22 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -198,7 +198,7 @@ $(multi-objs-y:.o=.s)   : modname = $(modname-multi)
 $(multi-objs-y:.o=.lst) : modname = $(modname-multi)
 
 quiet_cmd_cc_s_c = CC $(quiet_modtag)  $@
-cmd_cc_s_c       = $(CC) $(c_flags) -fverbose-asm -S -o $@ $<
+cmd_cc_s_c       = $(CC) $(c_flags) $(DISABLE_LTO) -fverbose-asm -S -o $@ $<
 
 $(obj)/%.s: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_s_c)
-- 
1.8.5.2

