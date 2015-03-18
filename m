Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:37402 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755590AbbCRMjR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Mar 2015 08:39:17 -0400
Received: by wixw10 with SMTP id w10so38625455wix.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2015 05:39:16 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2] kbuild: Create directory for target DTB
Date: Wed, 18 Mar 2015 13:39:07 +0100
Message-Id: <c09612262f2758e70dd4d700f2d32692601f8287.1426682342.git.michal.simek@xilinx.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, catalin.marinas@arm.com, will.deacon@arm.com, Nathan Rossi <nathan.rossi@xilinx.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

From: Nathan Rossi <nathan.rossi@xilinx.com>

When building specific DTBs out of the kernel tree the vendor subdirs
(boot/dts/<vendor>) are not created, ensure that they are before
building the DTB.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

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

