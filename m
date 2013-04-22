Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:62392 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751771Ab3DVKr5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Apr 2013 06:47:57 -0400
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH 1/1] Makefile.lib: align DTB quiet_cmd
Date: Mon, 22 Apr 2013 11:47:31 +0100
Message-ID: <1366627651-19845-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: James Hogan <james.hogan@imgtec.com>, Michal Marek <mmarek@suse.cz>, Dirk Brandewie <dirk.brandewie@gmail.com>, Grant Likely <grant.likely@secretlab.ca>

The unaligned dtb.S filename in make output started to irritate me:
  DTC     arch/metag/boot/dts/skeleton.dtb
  DTB    arch/metag/boot/dts/skeleton.dtb.S
  AS      arch/metag/boot/dts/skeleton.dtb.o
  LD      arch/metag/boot/dts/built-in.o

Add an extra space to quiet_cmd_dt_S_dtb so the dtb.S filename aligns
with all the others.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 07125e6..e13fff1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -251,7 +251,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
 # ---------------------------------------------------------------------------
 
 # Generate an assembly file to wrap the output of the device tree compiler
-quiet_cmd_dt_S_dtb= DTB    $@
+quiet_cmd_dt_S_dtb= DTB     $@
 cmd_dt_S_dtb=						\
 (							\
 	echo '\#include <asm-generic/vmlinux.lds.h>'; 	\
-- 
1.8.1.2


