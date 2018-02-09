Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751151AbeBIQMz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Feb 2018 11:12:55 -0500
From: James Hogan <jhogan@kernel.org>
Subject: [PATCH 2/3] MIPS: Add generic list_* Makefile targets
Date: Fri,  9 Feb 2018 16:11:57 +0000
Message-Id: <04370c02b170604b3edde66cdf087bc82710a07f.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
In-Reply-To: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
References: <cover.e6abe4a455cad25b6663ceb7da02aee67a3be269.1518192692.git-series.jhogan@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-mips@linux-mips.org
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Paul Burton <paul.burton@mips.com>, Matt Redfearn <matt.redfearn@mips.com>, linux-kbuild@vger.kernel.org

Add MIPS specific Makefile targets for listing generic defconfigs
(list_generic_defconfigs), generic board types (list_generic_boards),
and legacy defconfigs which have been converted to generic
(list_legacy_defconfigs).

This is useful for quick reference and for buildbots to be able to
automatically build all supported default configurations without parsing
of the generic_defconfig error output.

In order for these to work without .config being updated or
CROSS_COMPILE being needed, list_%s is added to no-dot-config-targets in
the main Makefile.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Matt Redfearn <matt.redfearn@mips.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kbuild@vger.kernel.org
---
 Makefile           |  2 +-
 arch/mips/Makefile | 51 ++++++++++++++++++++++++++++++-----------------
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 3f4d157add54..635015848a2c 100644
--- a/Makefile
+++ b/Makefile
@@ -223,7 +223,7 @@ old_version_h := include/linux/version.h
 no-dot-config-targets := clean mrproper distclean \
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers_% archheaders archscripts \
-			 kernelversion %src-pkg
+			 kernelversion %src-pkg list_%s
 
 config-targets := 0
 mixed-targets  := 0
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 6f368b5cdf29..9ba487c1c4d2 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -447,24 +447,27 @@ archclean:
 	$(Q)$(MAKE) $(clean)=arch/mips/lasat
 
 define archhelp
-	echo '  install              - install kernel into $(INSTALL_PATH)'
-	echo '  vmlinux.ecoff        - ECOFF boot image'
-	echo '  vmlinux.bin          - Raw binary boot image'
-	echo '  vmlinux.srec         - SREC boot image'
-	echo '  vmlinux.32           - 64-bit boot image wrapped in 32bits (IP22/IP32)'
-	echo '  vmlinuz              - Compressed boot(zboot) image'
-	echo '  vmlinuz.ecoff        - ECOFF zboot image'
-	echo '  vmlinuz.bin          - Raw binary zboot image'
-	echo '  vmlinuz.srec         - SREC zboot image'
-	echo '  uImage               - U-Boot image'
-	echo '  uImage.bin           - U-Boot image (uncompressed)'
-	echo '  uImage.bz2           - U-Boot image (bz2)'
-	echo '  uImage.gz            - U-Boot image (gzip)'
-	echo '  uImage.lzma          - U-Boot image (lzma)'
-	echo '  uImage.lzo           - U-Boot image (lzo)'
-	echo '  uzImage.bin          - U-Boot image (self-extracting)'
-	echo '  dtbs                 - Device-tree blobs for enabled boards'
-	echo '  dtbs_install         - Install dtbs to $(INSTALL_DTBS_PATH)'
+	echo '  install                 - install kernel into $(INSTALL_PATH)'
+	echo '  vmlinux.ecoff           - ECOFF boot image'
+	echo '  vmlinux.bin             - Raw binary boot image'
+	echo '  vmlinux.srec            - SREC boot image'
+	echo '  vmlinux.32              - 64-bit boot image wrapped in 32bits (IP22/IP32)'
+	echo '  vmlinuz                 - Compressed boot(zboot) image'
+	echo '  vmlinuz.ecoff           - ECOFF zboot image'
+	echo '  vmlinuz.bin             - Raw binary zboot image'
+	echo '  vmlinuz.srec            - SREC zboot image'
+	echo '  uImage                  - U-Boot image'
+	echo '  uImage.bin              - U-Boot image (uncompressed)'
+	echo '  uImage.bz2              - U-Boot image (bz2)'
+	echo '  uImage.gz               - U-Boot image (gzip)'
+	echo '  uImage.lzma             - U-Boot image (lzma)'
+	echo '  uImage.lzo              - U-Boot image (lzo)'
+	echo '  uzImage.bin             - U-Boot image (self-extracting)'
+	echo '  dtbs                    - Device-tree blobs for enabled boards'
+	echo '  dtbs_install            - Install dtbs to $(INSTALL_DTBS_PATH)'
+	echo '  list_generic_defconfigs - List available generic defconfigs'
+	echo '  list_generic_boards     - List available generic boards'
+	echo '  list_legacy_defconfigs  - List available legacy defconfigs'
 	echo
 	echo '  These will be default as appropriate for a configured platform.'
 	echo
@@ -538,6 +541,14 @@ generic_defconfig:
 	$(Q)echo
 	$(Q)false
 
+.PHONY: list_generic_defconfigs
+list_generic_defconfigs:
+	$(Q)for cfg in $(generic_defconfigs); do echo "$${cfg}"; done
+
+.PHONY: list_generic_boards
+list_generic_boards:
+	$(Q)for board in $(sort $(BOARDS)); do echo "$${board}"; done
+
 #
 # Legacy defconfig compatibility - these targets used to be real defconfigs but
 # now that the boards have been converted to use the generic kernel they are
@@ -555,3 +566,7 @@ xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=xilfpga
 .PHONY: $(legacy_defconfigs)
 $(legacy_defconfigs):
 	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
+
+.PHONY: list_legacy_defconfigs
+list_legacy_defconfigs:
+	$(Q)for cfg in $(sort $(legacy_defconfigs)); do echo "$${cfg}"; done
-- 
git-series 0.9.1
