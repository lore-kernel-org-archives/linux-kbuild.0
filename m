Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:59594 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751734AbaBHICL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 03:02:11 -0500
From: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH 17/17] lto, module: Warn about modules that are not fully LTOed
Date: Sat,  8 Feb 2014 09:01:21 +0100
Message-Id: <1391846481-31491-17-git-send-email-ak@linux.intel.com>
In-Reply-To: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, Andi Kleen <ak@linux.intel.com>, rusty@rustcorp.com.au

When __gnu_lto_* is present that means that the module hasn't run with
LTO yet.

Cc: rusty@rustcorp.com.au
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/module.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/module.c b/kernel/module.c
index b99e801..2052155 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1949,8 +1949,11 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
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
1.8.5.2

