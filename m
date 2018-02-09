Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbeBIQM5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Feb 2018 11:12:57 -0500
From: James Hogan <jhogan@kernel.org>
Subject: [PATCH 3/3] MIPS: Expand help text to list generic defconfigs
Date: Fri,  9 Feb 2018 16:11:58 +0000
Message-Id: <7a6cf6748383b693f5e50dbfe9f1660f0908da67.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-mips@linux-mips.org
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kbuild@vger.kernel.org

Expand the MIPS Makefile help text to list generic board names, generic
defconfigs, and legacy defconfigs which have been converted to generic
and are still usable.

Here's a snippet of the new "make ARCH=mips help" output:
  ...
  If you are targeting a system supported by generic kernels you may
  configure the kernel for a given architecture target like so:

  {micro32,32,64}{r1,r2,r6}{el,}_defconfig <BOARDS="list of boards">

  Where BOARDS is some subset of the following:
    boston
    ni169445
    ranchu
    sead-3
    xilfpga

  Specifically the following generic default configurations are
  supported:

  32r1_defconfig           - Build generic kernel for MIPS32 r1
  32r1el_defconfig         - Build generic kernel for MIPS32 r1 little endian
  32r2_defconfig           - Build generic kernel for MIPS32 r2
  32r2el_defconfig         - Build generic kernel for MIPS32 r2 little endian
  32r6_defconfig           - Build generic kernel for MIPS32 r6
  32r6el_defconfig         - Build generic kernel for MIPS32 r6 little endian
  64r1_defconfig           - Build generic kernel for MIPS64 r1
  64r1el_defconfig         - Build generic kernel for MIPS64 r1 little endian
  64r2_defconfig           - Build generic kernel for MIPS64 r2
  64r2el_defconfig         - Build generic kernel for MIPS64 r2 little endian
  64r6_defconfig           - Build generic kernel for MIPS64 r6
  64r6el_defconfig         - Build generic kernel for MIPS64 r6 little endian
  micro32r2_defconfig      - Build generic kernel for microMIPS32 r2
  micro32r2el_defconfig    - Build generic kernel for microMIPS32 r2 little endian

  The following legacy default configurations have been converted to
  generic and can still be used:

  sead3_defconfig          - Build 32r2el_defconfig BOARDS=sead-3
  sead3micro_defconfig     - Build micro32r2el_defconfig BOARDS=sead-3
  xilfpga_defconfig        - Build 32r2el_defconfig BOARDS=xilfpga
  ...

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org
---
 arch/mips/Makefile | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 9ba487c1c4d2..e7a9ec56aa51 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -476,6 +476,21 @@ define archhelp
 	echo
 	echo '  {micro32,32,64}{r1,r2,r6}{el,}_defconfig <BOARDS="list of boards">'
 	echo
+	echo '  Where BOARDS is some subset of the following:'
+	for board in $(sort $(BOARDS)); do echo "    $${board}"; done
+	echo
+	echo '  Specifically the following generic default configurations are'
+	echo '  supported:'
+	echo
+	$(foreach cfg,$(generic_defconfigs),
+	  printf "  %-24s - Build generic kernel for $(call describe_generic_defconfig,$(cfg))\n" $(cfg);)
+	echo
+	echo '  The following legacy default configurations have been converted to'
+	echo '  generic and can still be used:'
+	echo
+	$(foreach cfg,$(sort $(legacy_defconfigs)),
+	  printf "  %-24s - Build $($(cfg)-y)\n" $(cfg);)
+	echo
 	echo '  Otherwise, the following default configurations are available:'
 endef
 
@@ -510,6 +525,10 @@ endef
 $(eval $(call gen_generic_defconfigs,32 64,r1 r2 r6,eb el))
 $(eval $(call gen_generic_defconfigs,micro32,r2,eb el))
 
+define describe_generic_defconfig
+$(subst 32r,MIPS32 r,$(subst 64r,MIPS64 r,$(subst el, little endian,$(patsubst %_defconfig,%,$(1)))))
+endef
+
 .PHONY: $(generic_defconfigs)
 $(generic_defconfigs):
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-- 
git-series 0.9.1
