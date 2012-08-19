Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:42537 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753390Ab2HSC5g (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Aug 2012 22:57:36 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 73/74] lto, module: Warn about modules that are not fully LTOed
Date: Sat, 18 Aug 2012 19:57:09 -0700
Message-Id: <1345345030-22211-74-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org, Andi Kleen <ak@linux.intel.com>, rusty@rustcorp.com.au

From: Andi Kleen <ak@linux.intel.com>

When __gnu_lto_* is present that means that the module hasn't run with
LTO yet.

Cc: rusty@rustcorp.com.au
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/module.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 2cbbae3..a8a29c4 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1905,8 +1905,11 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
 		switch (sym[i].st_shndx) {
 		case SHN_COMMON:
 			/* Ignore common symbols */
-			if (!strncmp(name, "__gnu_lto", 9))
+			if (!strncmp(name, "__gnu_lto", 9)) {
+				printk("%s: module not link time optimized\n",
+				       mod->name);
 				break;
+			}
 
 			/* We compiled with -fno-common.  These are not
 			   supposed to happen.  */
-- 
1.7.7.6

