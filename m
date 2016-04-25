Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:57707 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754813AbcDYPgP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 11:36:15 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 5/5] gcov: disable -Wmaybe-uninitialized warning
Date: Mon, 25 Apr 2016 17:35:31 +0200
Message-Id: <1461598531-2190169-6-git-send-email-arnd@arndb.de>
In-Reply-To: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
References: <1461598531-2190169-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

When gcov profiling is enabled, we see a lot of spurious warnings about
possibly uninitialized variables being used:

arch/arm/mm/dma-mapping.c: In function 'arm_coherent_iommu_map_page':
arch/arm/mm/dma-mapping.c:1085:16: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/clk/st/clk-flexgen.c: In function 'st_of_flexgen_setup':
drivers/clk/st/clk-flexgen.c:323:9: warning: 'num_parents' may be used uninitialized in this function [-Wmaybe-uninitialized]
kernel/cgroup.c: In function 'cgroup_mount':
kernel/cgroup.c:2119:11: warning: 'root' may be used uninitialized in this function [-Wmaybe-uninitialized]

All of these are false positives, so it seems better to just disable
the warnings whenever GCOV is enabled. Most users don't enable GCOV,
and based on a prior patch, it is now also disabled for 'allmodconfig'
builds, so there should be no downsides of doing this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Peter Oberparleiter <oberpar@linux.vnet.ibm.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d74b38e70d6f..b5c67617a98d 100644
--- a/Makefile
+++ b/Makefile
@@ -364,7 +364,7 @@ AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
 AFLAGS_KERNEL	=
-CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im
+CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
 CFLAGS_KCOV	= -fsanitize-coverage=trace-pc
 
 
-- 
2.7.0

