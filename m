Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:35074 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751199AbaBHICG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 03:02:06 -0500
From: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH 05/17] lto: Handle LTO common symbols in module loader
Date: Sat,  8 Feb 2014 09:01:09 +0100
Message-Id: <1391846481-31491-5-git-send-email-ak@linux.intel.com>
In-Reply-To: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
References: <1391846481-31491-1-git-send-email-ak@linux.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, Joe Mario <jmario@redhat.com>, rusty@rustcorp.com.au, Andi Kleen <ak@linux.intel.com>

From: Joe Mario <jmario@redhat.com>

Here is the workaround I made for having the kernel not reject modules
built with -flto.  The clean solution would be to get the compiler to not
emit the symbol.  Or if it has to emit the symbol, then emit it as
initialized data but put it into a comdat/linkonce section.

Minor tweaks by AK over Joe's patch.

Cc: rusty@rustcorp.com.au
Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 kernel/module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/module.c b/kernel/module.c
index d24fcf2..b99e801 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1948,6 +1948,10 @@ static int simplify_symbols(struct module *mod, const struct load_info *info)
 
 		switch (sym[i].st_shndx) {
 		case SHN_COMMON:
+			/* Ignore common symbols */
+			if (!strncmp(name, "__gnu_lto", 9))
+				break;
+
 			/* We compiled with -fno-common.  These are not
 			   supposed to happen.  */
 			pr_debug("Common symbol: %s\n", name);
-- 
1.8.5.2

