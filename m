Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:45464 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750846Ab1FHSPi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Jun 2011 14:15:38 -0400
Date: Wed, 8 Jun 2011 20:15:32 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC] of/dtb: Add missing pieces of the in-kernel dtb support
Message-ID: <20110608181532.GA23871@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Michal Marek <mmarek@suse.cz>, Dirk Brandewie <dirk.brandewie@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-kbuild@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

This are the remaining pieces of Dirk's in-kernel-dtb-support which did
not found their way upstream. Most of the support was merged via
different trees except this.
I still need this because I don't (yet) have a bootloader with dtb
support for my CE4100. Ralf has a similar on few of this boards and he
poked me.
I'm exporting of_flat_dt_find_compatible_dtb() within the kernel because
it may be required by others in case the kernel calls into firmware for
the name of the required blob. See [0].
initial_dtb is currently x86 specific. Do we want to keep it that way or
should be renamed?
Should this patch be splitted into thee smaller (x86, Makefile.lib, fdt)
or is okay?

[0] http://www.linux-mips.org/archives/linux-mips/2011-06/msg00059.html

Cc: Dirk Brandewie <dirk.brandewie@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/x86/platform/ce4100/Makefile |    4 +++
 drivers/of/fdt.c                  |   47 +++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h            |    5 ++++
 scripts/Makefile.lib              |    3 ++
 4 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/arch/x86/platform/ce4100/Makefile b/arch/x86/platform/ce4100/Makefile
index 91fc929..ee6e836 100644
--- a/arch/x86/platform/ce4100/Makefile
+++ b/arch/x86/platform/ce4100/Makefile
@@ -1 +1,5 @@
 obj-$(CONFIG_X86_INTEL_CE)	+= ce4100.o
+
+ifdef CONFIG_OF
+obj-$(CONFIG_X86_INTEL_CE) += falconfalls.dtb.o
+endif
diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 65200af..ea9e557 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -17,6 +17,8 @@
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
+#include <linux/io.h>
+#include <asm-generic/vmlinux.lds.h>
 
 #ifdef CONFIG_PPC
 #include <asm/machdep.h>
@@ -713,4 +715,49 @@ void __init unflatten_device_tree(void)
 		of_chosen = of_find_node_by_path("/chosen@0");
 }
 
+extern uint8_t __dtb_start[];
+extern uint8_t __dtb_end[];
+phys_addr_t __init of_flat_dt_find_compatible_dtb(char *name)
+{
+	void *rc = NULL;
+	unsigned long root, size;
+	struct boot_param_header  *orig_initial_boot_params;
+	uint8_t *blob;
+
+	orig_initial_boot_params = initial_boot_params;
+	blob = __dtb_start;
+	initial_boot_params = (struct boot_param_header *)blob;
+
+	while (blob < __dtb_end &&
+		(be32_to_cpu(initial_boot_params->magic) == OF_DT_HEADER)) {
+		root = of_get_flat_dt_root();
+		if (of_flat_dt_is_compatible(root, name) > 0) {
+			rc = blob;
+			printk(KERN_INFO "Found dtb for '%s'\n", name);
+			break;
+		}
+
+		size =  be32_to_cpu(initial_boot_params->totalsize);
+		blob =  PTR_ALIGN(blob + size, STRUCT_ALIGNMENT);
+		initial_boot_params = (struct boot_param_header *)blob;
+	}
+
+	initial_boot_params = orig_initial_boot_params;
+
+	if (rc == NULL)
+		return 0;
+	return virt_to_phys(rc);
+}
+
+static int __init of_flat_dtb_compat_setup(char *line)
+{
+	if (initial_dtb) {
+		printk(KERN_ERR "Using bootloader's dtb instead of cmd line\n");
+		return 0;
+	}
+	initial_dtb = of_flat_dt_find_compatible_dtb(line);
+	return 0;
+}
+early_param("dtb_compat", of_flat_dtb_compat_setup);
+
 #endif /* CONFIG_OF_EARLY_FLATTREE */
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index c84d900..58d7e3a 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -117,8 +117,13 @@ extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 /* Other Prototypes */
 extern void unflatten_device_tree(void);
 extern void early_init_devtree(void *);
+extern phys_addr_t of_flat_dt_find_compatible_dtb(char *name);
 #else /* CONFIG_OF_FLATTREE */
 static inline void unflatten_device_tree(void) {}
+static inline phys_addr_t of_flat_dt_find_compatible_dtb(char *name)
+{
+	return 0;
+}
 #endif /* CONFIG_OF_FLATTREE */
 
 #endif /* __ASSEMBLY__ */
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 93b2b59..150b9ba 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -224,6 +224,9 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) $<
 
+$(obj)/%.dtb: $(obj)/%.dts
+	$(call if_changed,dtc)
+
 # Bzip2
 # ---------------------------------------------------------------------------
 
-- 
1.7.4.4

