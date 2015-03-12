Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:42600 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750909AbbCLFdl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 01:33:41 -0400
Message-ID: <55012531.8040608@gmail.com>
Date: Wed, 11 Mar 2015 22:33:37 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: [Patch 1/3] dt: OF_UNITTEST make dependency broken, framework fixes
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.cz>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

This 3 patch series is not bisectable.  If CONFIG_OF_UNITTEST=y then the kernel
will not build with just patch 1 or just patches 1 and 2 applied.

If CONFIG_OF_UNITTEST=y then a kernel image make will always cause .version to
be incremented, even if there are not source changes.  This is caused by
a lack of dependency tracking and checking for
drivers/of/unittest-data/testcases.dtb.o.  Fixing the problem was made more
complicated by the fact that testcases.dtb.o was linked into ../of_unittest.o.

Patch 1 modifies makefiles to move of_unittest.c into unittest-data/ and
creates missing dependency tracking for testcases.dtb.o.

Patch 2 will move of_unittest.c into unittest-data/

Patch 3 will fix an of_unittest.c include path to account for the move.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

---
 drivers/of/Makefile               |    4 ++--
 drivers/of/unittest-data/Makefile |    9 +++++++++
 scripts/Makefile.lib              |    5 +++--
 3 files changed, 14 insertions(+), 4 deletions(-)

Index: b/drivers/of/Makefile
===================================================================
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -6,8 +6,6 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
 obj-$(CONFIG_OF_ADDRESS)  += address.o
 obj-$(CONFIG_OF_IRQ)    += irq.o
 obj-$(CONFIG_OF_NET)	+= of_net.o
-obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
-of_unittest-objs := unittest.o unittest-data/testcases.dtb.o
 obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
 obj-$(CONFIG_OF_PCI)	+= of_pci.o
 obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
@@ -16,5 +14,7 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_rese
 obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 
+obj-$(CONFIG_OF_UNITTEST) += unittest-data/
+
 CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
 CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
Index: b/scripts/Makefile.lib
===================================================================
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -276,10 +276,11 @@ cmd_dt_S_dtb=						\
 	echo '__dtb_$(*F)_end:';			\
 	echo '.global __dtb_$(*F)_end';			\
 	echo '.balign STRUCT_ALIGNMENT'; 		\
-) > $@
+) > $@ ;                                                \
+	touch $(depfile)
 
 $(obj)/%.dtb.S: $(obj)/%.dtb
-	$(call cmd,dt_S_dtb)
+	$(call if_changed_dep,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(CPP) $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
Index: b/drivers/of/unittest-data/Makefile
===================================================================
--- /dev/null
+++ b/drivers/of/unittest-data/Makefile
@@ -0,0 +1,9 @@
+
+obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
+of_unittest-objs := unittest.o testcases.dtb.o
+
+targets += testcases.dtb testcases.dtb.S
+
+.SECONDARY: \
+	$(obj)/testcases.dtb.S \
+	$(obj)/testcases.dtb
