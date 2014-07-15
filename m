Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.vm.bytemark.co.uk ([212.110.190.137]:35941 "EHLO
	benson.vm.bytemark.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752949AbaGOHiR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jul 2014 03:38:17 -0400
From: Ian Campbell <ijc@hellion.org.uk>
Subject: [PATCH] arm64: Align the kbuild output for VDSOL and VDSOA
Date: Tue, 15 Jul 2014 08:38:08 +0100
Message-Id: <1405409888-791-1-git-send-email-ijc@hellion.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@vger.kernel.org
Cc: Ian Campbell <ijc@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <mmarek@suse.cz>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kbuild@vger.kernel.org
---
 arch/arm64/kernel/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 6d20b7d..84b9426 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -47,9 +47,9 @@ $(obj-vdso): %.o: %.S
 	$(call if_changed_dep,vdsoas)
 
 # Actual build commands
-quiet_cmd_vdsold = VDSOL $@
+quiet_cmd_vdsold = VDSOL   $@
       cmd_vdsold = $(CC) $(c_flags) -Wl,-n -Wl,-T $^ -o $@
-quiet_cmd_vdsoas = VDSOA $@
+quiet_cmd_vdsoas = VDSOA   $@
       cmd_vdsoas = $(CC) $(a_flags) -c -o $@ $<
 
 # Install commands for the unstripped file
-- 
2.0.1

