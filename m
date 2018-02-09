Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbeBIQMx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Feb 2018 11:12:53 -0500
From: James Hogan <jhogan@kernel.org>
Subject: [PATCH 1/3] MIPS: Refactor legacy defconfigs
Date: Fri,  9 Feb 2018 16:11:56 +0000
Message-Id: <28c78dcb9527b7a841d49370936124b202434efe.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-mips@linux-mips.org
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kbuild@vger.kernel.org

Define legacy defconfigs which have been converted to the generic
platform more programatically, so that they can be listed in the
Makefile help text and as a separate Makefile target without
duplication.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org
---
 arch/mips/Makefile | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index d1ca839c3981..6f368b5cdf29 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -543,14 +543,15 @@ generic_defconfig:
 # now that the boards have been converted to use the generic kernel they are
 # wrappers around the generic rules above.
 #
-.PHONY: sead3_defconfig
-sead3_defconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile 32r2el_defconfig BOARDS=sead-3
+legacy_defconfigs		+= sead3_defconfig
+sead3_defconfig-y		:= 32r2el_defconfig BOARDS=sead-3
 
-.PHONY: sead3micro_defconfig
-sead3micro_defconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile micro32r2el_defconfig BOARDS=sead-3
+legacy_defconfigs		+= sead3micro_defconfig
+sead3micro_defconfig-y		:= micro32r2el_defconfig BOARDS=sead-3
 
-.PHONY: xilfpga_defconfig
-xilfpga_defconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile 32r2el_defconfig BOARDS=xilfpga
+legacy_defconfigs		+= xilfpga_defconfig
+xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=xilfpga
+
+.PHONY: $(legacy_defconfigs)
+$(legacy_defconfigs):
+	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
-- 
git-series 0.9.1
