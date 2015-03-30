Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:38469 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752705AbbC3MjQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 08:39:16 -0400
Received: by wibgn9 with SMTP id gn9so127850619wib.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 05:39:15 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v3] kbuild: Create directory for target DTB
Date: Mon, 30 Mar 2015 14:39:08 +0200
Message-Id: <9fdc43b280f2ad2e8887b63b341686254107f87d.1427719132.git.michal.simek@xilinx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: arm@kernel.org
Cc: Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, catalin.marinas@arm.com, will.deacon@arm.com, Nathan Rossi <nathan.rossi@xilinx.com>, linux-kernel@vger.kernel.org, monstr@monstr.eu, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Nathan Rossi <nathan.rossi@xilinx.com>

When building specific DTBs out of the kernel tree the vendor subdirs
(boot/dts/<vendor>) are not created, ensure that they are before
building the DTB.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Acked-by: Will Deacon <will.deacon@arm.com>
---

Changes in v3:
- Add Will's ACK

Changes in v2:
- Use $(dir ${dtc-tmp}) instead of `dirname ${dtc-tmp}`
  Reported-by: Will Deacon <will.deacon@arm.com>

Problem is visible with arm64 for out of tree builds.
make O=/tmp/kkk/ defconfig
make O=/tmp/kkk/ cavium/thunder-88xx.dtb

  DTC     arch/arm64/boot/dts/cavium/thunder-88xx.dtb
cc1: fatal error: opening output file
arch/arm64/boot/dts/cavium/.thunder-88xx.dtb.dts.tmp: No such file or
directory
compilation terminated.
make[2]: *** [arch/arm64/boot/dts/cavium/thunder-88xx.dtb] Error 1
make[1]: *** [cavium/thunder-88xx.dtb] Error 2

Building specific dtb target on arm32 is working fine
make O=/tmp/kkk4/ multi_v7_defconfig
make O=/tmp/kkk4/ zynq-zc702.dtb

This is the way how Yocto is building dtb for specific target.
---
 scripts/Makefile.lib |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 044eb4f..79e8661 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -282,7 +282,8 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 	$(call cmd,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
+	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
1.7.2.3

