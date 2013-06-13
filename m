Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from multi.imgtec.com ([194.200.65.239]:19862 "EHLO multi.imgtec.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754697Ab3FMKx5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Jun 2013 06:53:57 -0400
From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH RESEND] Makefile.lib: align DTB quiet_cmd
Date: Thu, 13 Jun 2013 11:53:09 +0100
Message-ID: <1371120789-18342-1-git-send-email-james.hogan@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, James Hogan <james.hogan@imgtec.com>, Dirk Brandewie <dirk.brandewie@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, trivial@kernel.org

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
Cc: trivial@kernel.org
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8337663..281f82a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -244,7 +244,7 @@ cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -n -f -9 > $@) || \
 # ---------------------------------------------------------------------------
 
 # Generate an assembly file to wrap the output of the device tree compiler
-quiet_cmd_dt_S_dtb= DTB    $@
+quiet_cmd_dt_S_dtb= DTB     $@
 cmd_dt_S_dtb=						\
 (							\
 	echo '\#include <asm-generic/vmlinux.lds.h>'; 	\
-- 
1.8.1.2


