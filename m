Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:63010 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387400AbgCDDUv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 22:20:51 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] kbuild: avoid concurrency issue in parallel building dtbs and dtbs_check
Date: Wed,  4 Mar 2020 12:20:36 +0900
Message-Id: <20200304032038.14424-2-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-1-masahiroy@kernel.org>
References: <20200304032038.14424-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

'make dtbs_check' checks the shecma in addition to building *.dtb files,
in other words, 'make dtbs_check' is a super-set of 'make dtbs'.
So, you do not have to do 'make dtbs dtbs_check', but I want to keep
the build system robust in any use.

Currently, 'dtbs' and 'dtbs_check' are independent of each other.
In parallel building, two threads descend into arch/*/boot/dts/,
one for dtbs and the other for dtbs_check, then end up with building
the same DTB simultaneously.

This commit fixes the concurrency issue. Otherwise, I see build errors
like follows:

$ make ARCH=arm64 defconfig
$ make -j16 ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/psci.yaml dtbs dtbs_check
  <snip>
  DTC     arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
  DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtb
  DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb
  DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
  DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb
  DTC     arch/arm64/boot/dts/zte/zx296718-pcbox.dtb
  DTC     arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
  DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dtb
  DTC     arch/arm64/boot/dts/xilinx/zynqmp-zc1254-revA.dtb
  DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb
  DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb
  DTC     arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb
  CHECK   arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dt.yaml
fixdep: error opening file: arch/arm64/boot/dts/allwinner/.sun50i-h6-orangepi-lite2.dtb.d: No such file or directory
make[2]: *** [scripts/Makefile.lib:296: arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb] Error 2
make[2]: *** Deleting file 'arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb'
make[2]: *** Waiting for unfinished jobs....
  DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb
  DTC     arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p231.dtb
  DTC     arch/arm64/boot/dts/xilinx/zynqmp-zc1275-revA.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
fixdep: parse error; no targets found
make[2]: *** [scripts/Makefile.lib:296: arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb] Error 1
make[2]: *** Deleting file 'arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb'
make[1]: *** [scripts/Makefile.build:505: arch/arm64/boot/dts/allwinner] Error 2
make[1]: *** Waiting for unfinished jobs....
  DTC     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1a1a0d271697..e94d4fe3ef77 100644
--- a/Makefile
+++ b/Makefile
@@ -1240,11 +1240,15 @@ ifneq ($(dtstree),)
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dtbs_check
-dtbs dtbs_check: include/config/kernel.release scripts_dtc
+dtbs: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
+ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
+dtbs: dt_binding_check
+endif
+
 dtbs_check: export CHECK_DTBS=1
-dtbs_check: dt_binding_check
+dtbs_check: dtbs
 
 dtbs_install:
 	$(Q)$(MAKE) $(dtbinst)=$(dtstree)
-- 
2.17.1
