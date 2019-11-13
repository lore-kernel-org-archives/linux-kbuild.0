Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:42493 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726155AbfKMJzq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Nov 2019 04:55:46 -0500
From: Shile Zhang <shile.zhang@linux.alibaba.com>
Subject: [PATCH] mm/vmalloc: Fix regression caused by needless vmalloc_sync_all()
Date: Wed, 13 Nov 2019 17:55:30 +0800
Message-Id: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Joerg Roedel <jroedel@suse.de>
Cc: linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

vmalloc_sync_all() was put in the common path in
__purge_vmap_area_lazy(), for one sync issue only happened on X86_32
with PTI enabled. It is needless for X86_64, which caused a big regression
in UnixBench Shell8 testing on X86_64.
Similar regression also reported by 0-day kernel test robot in reaim
benchmarking:
https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/4D3JPPHBNOSPFK2KEPC6KGKS6J25AIDB/

Fix it by adding more conditions.

Fixes: 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in __purge_vmap_area_lazy()")

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 mm/vmalloc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a3c70e275f4e..7b9fc7966da6 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1255,11 +1255,17 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
 	if (unlikely(valist == NULL))
 		return false;
 
+#if defined(CONFIG_X86_32) && defined(CONFIG_X86_PAE)
 	/*
 	 * First make sure the mappings are removed from all page-tables
 	 * before they are freed.
+	 *
+	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is
+	 * the case on a PAE kernel with PTI enabled.
 	 */
-	vmalloc_sync_all();
+	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
+		vmalloc_sync_all();
+#endif
 
 	/*
 	 * TODO: to calculate a flush range without looping.
-- 
2.24.0.rc2
