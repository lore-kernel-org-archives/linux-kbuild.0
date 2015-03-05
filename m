Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:39055 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753435AbbCENiu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Mar 2015 08:38:50 -0500
Received: by pdbft15 with SMTP id ft15so5967363pdb.6
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2015 05:38:50 -0800 (PST)
From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] kbuild: Create directory for target DTB
Date: Thu,  5 Mar 2015 14:38:41 +0100
Message-Id: <eeaee5ea1dc1082db84c91567a9fe6260138512e.1425562715.git.michal.simek@xilinx.com>
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
 scripts/Makefile.lib | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 044eb4f89a91..6e3356005ec4 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -282,7 +282,8 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 	$(call cmd,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = mkdir -p `dirname ${dtc-tmp}` ; \
+	$(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 \
 		-i $(dir $<) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
1.8.2.3

