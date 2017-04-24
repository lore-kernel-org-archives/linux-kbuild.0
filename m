Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34520 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164747AbdDXFoG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 01:44:06 -0400
From: frowand.list@gmail.com
Subject: [PATCH 2/2] of: Add unit tests for applying overlays.
Date: Sun, 23 Apr 2017 22:43:15 -0700
Message-Id: <1493012595-696-3-git-send-email-frowand.list@gmail.com>
In-Reply-To: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
References: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Existing overlay unit tests examine individual pieces of the overlay
code.  The new tests target the entire process of applying an overlay.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

There are checkpatch warnings.  I have reviewed them and feel they
can be ignored.

 drivers/of/fdt.c                            |  45 +++++
 drivers/of/of_private.h                     |   2 +
 drivers/of/unittest-data/Makefile           |  17 +-
 drivers/of/unittest-data/ot.dts             |  53 ++++++
 drivers/of/unittest-data/ot_bad_phandle.dts |  20 +++
 drivers/of/unittest-data/ot_base.dts        |  71 ++++++++
 drivers/of/unittest.c                       | 264 ++++++++++++++++++++++++++++
 7 files changed, 469 insertions(+), 3 deletions(-)
 create mode 100644 drivers/of/unittest-data/ot.dts
 create mode 100644 drivers/of/unittest-data/ot_bad_phandle.dts
 create mode 100644 drivers/of/unittest-data/ot_base.dts

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index e5ce4b59e162..54120ab8f322 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -31,6 +31,8 @@
 #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
 #include <asm/page.h>
 
+#include "of_private.h"
+
 /*
  * of_fdt_limit_memory - limit the number of regions in the /memory node
  * @limit: maximum entries
@@ -1256,11 +1258,54 @@ bool __init early_init_dt_scan(void *params)
  */
 void __init unflatten_device_tree(void)
 {
+#ifdef CONFIG_OF_UNITTEST
+	extern uint8_t __dtb_ot_base_begin[];
+	extern uint8_t __dtb_ot_base_end[];
+	struct device_node *ot_base_root;
+	void *ot_base;
+	u32 data_size;
+	u32 size;
+#endif
+
 	__unflatten_device_tree(initial_boot_params, NULL, &of_root,
 				early_init_dt_alloc_memory_arch, false);
 
 	/* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
 	of_alias_scan(early_init_dt_alloc_memory_arch);
+
+#ifdef CONFIG_OF_UNITTEST
+	/*
+	 * Base device tree for the overlay unittest.
+	 * Do as much as possible the same way as done for the normal FDT.
+	 * Have to stop before resolving phandles, because that uses kmalloc.
+	 */
+
+	data_size = __dtb_ot_base_end - __dtb_ot_base_begin;
+	if (!data_size) {
+		pr_err("No __dtb_ot_base_begin to attach\n");
+		return;
+	}
+
+	size = fdt_totalsize(__dtb_ot_base_begin);
+	if (size != data_size) {
+		pr_err("__dtb_ot_base_begin header totalsize != actual size");
+		return;
+	}
+
+	ot_base = early_init_dt_alloc_memory_arch(size,
+					     roundup_pow_of_two(FDT_V17_SIZE));
+	if (!ot_base) {
+		pr_err("alloc of ot_base failed");
+		return;
+	}
+
+	memcpy(ot_base, __dtb_ot_base_begin, size);
+
+	__unflatten_device_tree(ot_base, NULL, &ot_base_root,
+				early_init_dt_alloc_memory_arch, true);
+
+	unittest_set_ot_base_root(ot_base_root);
+#endif
 }
 
 /**
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index f4f6793d2f04..02d54da078ac 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -55,6 +55,8 @@ static inline int of_property_notify(int action, struct device_node *np,
 }
 #endif /* CONFIG_OF_DYNAMIC */
 
+extern void unittest_set_ot_base_root(struct device_node *dn);
+
 /**
  * General utilities for working with live trees.
  *
diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 1ac5cc01d627..6879befe29d2 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,7 +1,18 @@
 obj-y += testcases.dtb.o
+obj-y += ot.dtb.o
+obj-y += ot_bad_phandle.dtb.o
+obj-y += ot_base.dtb.o
 
 targets += testcases.dtb testcases.dtb.S
+targets += ot.dtb ot.dtb.S
+targets += ot_bad_phandle.dtb ot_bad_phandle.dtb.S
+targets += ot_base.dtb ot_base.dtb.S
 
-.SECONDARY: \
-	$(obj)/testcases.dtb.S \
-	$(obj)/testcases.dtb
+.PRECIOUS: \
+	$(obj)/%.dtb.S \
+	$(obj)/%.dtb
+
+# enable creation of __symbols__ node
+DTC_FLAGS_ot := -@
+DTC_FLAGS_ot_base := -@
+DTC_FLAGS_ot_bad_phandle := -@
diff --git a/drivers/of/unittest-data/ot.dts b/drivers/of/unittest-data/ot.dts
new file mode 100644
index 000000000000..37e105622b7a
--- /dev/null
+++ b/drivers/of/unittest-data/ot.dts
@@ -0,0 +1,53 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+
+	fragment@0 {
+		target = <&electric_1>;
+
+		__overlay__ {
+			status = "ok";
+
+			hvac_2: hvac_large_1 {
+				compatible = "ot,hvac-large";
+				heat-range = < 40 75 >;
+				cool-range = < 65 80 >;
+			};
+		};
+	};
+
+	fragment@1 {
+		target = <&rides_1>;
+
+		__overlay__ {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "ok";
+
+			ride@200 {
+				compatible = "ot,ferris-wheel";
+				reg = < 0x00000200 0x100 >;
+				hvac-provider = < &hvac_2 >;
+				hvac-thermostat = < 27 32 > ;
+				hvac-zones = < 12 5 >;
+				hvac-zone-names = "operator", "snack-bar";
+				spin-controller = < &spin_ctrl_1 3 >;
+				spin-rph = < 30 >;
+				gondolas = < 16 >;
+				gondola-capacity = < 6 >;
+			};
+		};
+	};
+
+	fragment@2 {
+		target = <&lights_2>;
+
+		__overlay__ {
+			status = "ok";
+			color = "purple", "white", "red", "green";
+			rate = < 3 256 >;
+		};
+	};
+
+};
diff --git a/drivers/of/unittest-data/ot_bad_phandle.dts b/drivers/of/unittest-data/ot_bad_phandle.dts
new file mode 100644
index 000000000000..234d5f1dcfe4
--- /dev/null
+++ b/drivers/of/unittest-data/ot_bad_phandle.dts
@@ -0,0 +1,20 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+
+	fragment@0 {
+		target = <&electric_1>;
+
+		__overlay__ {
+
+			// This label should cause an error when the overlay
+			// is applied.  There is already a phandle value
+			// in the base tree for motor_1.
+			spin_ctrl_1_conflict: motor_1 {
+				accelerate = < 3 >;
+				decelerate = < 5 >;
+			};
+		};
+	};
+};
diff --git a/drivers/of/unittest-data/ot_base.dts b/drivers/of/unittest-data/ot_base.dts
new file mode 100644
index 000000000000..0a4fbe598b02
--- /dev/null
+++ b/drivers/of/unittest-data/ot_base.dts
@@ -0,0 +1,71 @@
+/dts-v1/;
+/plugin/;
+
+/ {
+	testcase-data-2 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		electric_1: substation@100 {
+			compatible = "ot,big-volts-control";
+			reg = < 0x00000100 0x100 >;
+			status = "disabled";
+
+			hvac_1: hvac_medium_1 {
+				compatible = "ot,hvac-medium";
+				heat-range = < 50 75 >;
+				cool-range = < 60 80 >;
+			};
+
+			spin_ctrl_1: motor_1 {
+				compatible = "ot,ferris-wheel-motor";
+				spin = "clockwise";
+			};
+
+			spin_ctrl_2: motor_8 {
+				compatible = "ot,roller-coaster-motor";
+			};
+		};
+
+		rides_1: fairway_1 {
+			#address-cells = <1>;
+			#size-cells = <1>;
+			compatible = "ot,rides";
+			status = "disabled";
+			orientation = < 127 >;
+
+			ride@100 {
+				compatible = "ot,roller-coaster";
+				reg = < 0x00000100 0x100 >;
+				hvac-provider = < &hvac_1 >;
+				hvac-thermostat = < 29 > ;
+				hvac-zones = < 14 >;
+				hvac-zone-names = "operator";
+				spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
+				spin-controller-names = "track_1", "track_2";
+				queues = < 2 >;
+			};
+		};
+
+		lights_1: lights@30000 {
+			compatible = "ot,work-lights";
+			reg = < 0x00030000 0x1000 >;
+			status = "disabled";
+		};
+
+		lights_2: lights@40000 {
+			compatible = "ot,show-lights";
+			reg = < 0x00040000 0x1000 >;
+			status = "disabled";
+			rate = < 13 138 >;
+		};
+
+		retail_1: vending@50000 {
+			reg = < 0x00050000 0x1000 >;
+			compatible = "ot,tickets";
+			status = "disabled";
+		};
+
+	};
+};
+
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 62db55b97c10..599eb10e9b40 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/hashtable.h>
+#include <linux/libfdt.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/of_irq.h>
@@ -42,6 +43,13 @@
 	failed; \
 })
 
+static struct device_node *ot_base_root;
+
+void unittest_set_ot_base_root(struct device_node *dn)
+{
+	ot_base_root = dn;
+}
+
 static void __init of_unittest_find_node_by_name(void)
 {
 	struct device_node *np;
@@ -1925,6 +1933,259 @@ static void __init of_unittest_overlay(void)
 static inline void __init of_unittest_overlay(void) { }
 #endif
 
+#define OVERLAY_INFO_EXTERN(name) \
+	extern uint8_t __dtb_##name##_begin[]; \
+	extern uint8_t __dtb_##name##_end[]
+
+#define OVERLAY_INFO(name, expected) \
+{	.dtb_begin	 = __dtb_##name##_begin, \
+	.dtb_end	 = __dtb_##name##_end, \
+	.expected_result = expected, \
+}
+
+struct overlay_info {
+	uint8_t		   *dtb_begin;
+	uint8_t		   *dtb_end;
+	void		   *data;
+	struct device_node *np_overlay;
+	int		   expected_result;
+	int		   overlay_id;
+};
+
+OVERLAY_INFO_EXTERN(ot);
+OVERLAY_INFO_EXTERN(ot_bad_phandle);
+
+struct overlay_info overlays[] = {
+	OVERLAY_INFO(ot, 0),
+	OVERLAY_INFO(ot_bad_phandle, -EINVAL),
+	{}
+};
+
+#ifdef CONFIG_OF_OVERLAY
+/*
+ * The purpose of of_unittest_overlay_test_data_add is to add an
+ * overlay in the normal fashion.  This is a test of the whole
+ * picture, instead of testing individual elements.
+ *
+ * A secondary purpose is to be able to verify that the contents of
+ * /proc/device-tree/ contains the updated structure and values from
+ * the overlay.  That must be verified separately in user space.
+ *
+ * Return 0 on unexpected error.
+ */
+static int __init overlay_test_data_add(int onum)
+{
+	/*
+	 * __dtb_ot_begin[] and __dtb_ot_end[] are
+	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
+	 */
+	struct overlay_info *info;
+	int k;
+	int ret;
+	u32 size;
+	u32 size_from_header;
+
+	for (k = 0, info = overlays; info; info++, k++) {
+		if (k == onum)
+			break;
+	}
+	if (onum > k)
+		return 0;
+
+	size = info->dtb_end - info->dtb_begin;
+	if (!size) {
+		pr_err("no overlay to attach, %d\n", onum);
+		ret = 0;
+	}
+
+	size_from_header = fdt_totalsize(info->dtb_begin);
+	if (size_from_header != size) {
+		pr_err("overlay header totalsize != actual size, %d", onum);
+		return 0;
+	}
+
+	/*
+	 * Must create permanent copy of FDT because of_fdt_unflatten_tree()
+	 * will create pointers to the passed in FDT in the EDT.
+	 */
+	info->data = kmemdup(info->dtb_begin, size, GFP_KERNEL);
+	if (!info->data) {
+		pr_err("unable to allocate memory for data, %d\n", onum);
+		return 0;
+	}
+
+	of_fdt_unflatten_tree(info->data, NULL, &info->np_overlay);
+	if (!info->np_overlay) {
+		pr_err("unable to unflatten overlay, %d\n", onum);
+		ret = 0;
+		goto out_free_data;
+	}
+	of_node_set_flag(info->np_overlay, OF_DETACHED);
+
+	ret = of_resolve_phandles(info->np_overlay);
+	if (ret) {
+		pr_err("resolve ot phandles (ret=%d), %d\n", ret, onum);
+		goto out_free_np_overlay;
+	}
+
+	ret = of_overlay_create(info->np_overlay);
+	if (ret < 0) {
+		pr_err("of_overlay_create() (ret=%d), %d\n", ret, onum);
+		goto out_free_np_overlay;
+	} else {
+		info->overlay_id = ret;
+		ret = 0;
+	}
+
+	pr_debug("__dtb_ot_begin applied, overlay id %d\n", ret);
+
+	goto out;
+
+out_free_np_overlay:
+	/*
+	 * info->np_overlay is the unflattened device tree
+	 * It has not been spliced into the live tree.
+	 */
+
+	/* todo: function to free unflattened device tree */
+
+out_free_data:
+	kfree(info->data);
+
+out:
+	return (ret == info->expected_result);
+}
+
+/*
+ * The purpose of of_unittest_overlay_high_level is to add an overlay
+ * in the normal fashion.  This is a test of the whole picture,
+ * instead of individual elements.
+ *
+ * The first part of the function is _not_ normal overlay usage; it is
+ * finishing splicing the base overlay device tree into the live tree.
+ */
+static __init void of_unittest_overlay_high_level(void)
+{
+	struct device_node *last_sibling;
+	struct device_node *np;
+	struct device_node *of_symbols;
+	struct device_node *ot_base_symbols;
+	struct device_node **pprev;
+	struct property *prop;
+	int ret;
+
+	if (!ot_base_root) {
+		unittest(0, "ot_base_root not initialized\n");
+		return;
+	}
+
+	/*
+	 * Could not fixup phandles in unflatten_device_tree() because
+	 * kmalloc() was not yet available.
+	 */
+	of_resolve_phandles(ot_base_root);
+
+	/*
+	 * do not allow ot_base to duplicate any node already in tree,
+	 * this greatly simplifies the code
+	 */
+
+
+	/* remove ot_base_root node "__local_fixups" */
+	pprev = &ot_base_root->child;
+	for (np = ot_base_root->child; np; np = np->sibling) {
+		if (!of_node_cmp(np->name, "__local_fixups__")) {
+			*pprev = np->sibling;
+			break;
+		}
+		pprev = &np->sibling;
+	}
+
+
+	/* remove ot_base_root node "__symbols__" if in live tree*/
+	of_symbols = of_get_child_by_name(of_root, "__symbols__");
+	if (of_symbols) {
+		/* will have to graft properties from node into live tree */
+		pprev = &ot_base_root->child;
+		for (np = ot_base_root->child; np; np = np->sibling) {
+			if (!of_node_cmp(np->name, "__symbols__")) {
+				ot_base_symbols = np;
+				*pprev = np->sibling;
+				break;
+			}
+			pprev = &np->sibling;
+		}
+	}
+
+	for (np = ot_base_root->child; np; np = np->sibling) {
+		if (of_get_child_by_name(of_root, np->name)) {
+			unittest(0, "illegal node name in ot_base %s",
+				np->name);
+			return;
+		}
+	}
+
+	/*
+	 * __dtb_ot_base_begin is not allowed to have root properties,
+	 * so only need to splice nodes into main device tree.
+	 *
+	 * root node of *ot_base_root will not be freed, it is lost
+	 * memory.
+	 */
+
+	for (np = ot_base_root->child; np; np = np->sibling)
+		np->parent = of_root;
+
+	mutex_lock(&of_mutex);
+
+	for (np = of_root->child; np; np = np->sibling)
+		last_sibling = np;
+
+	if (last_sibling)
+		last_sibling->sibling = ot_base_root->child;
+	else
+		of_root->child = ot_base_root->child;
+
+	for_each_of_allnodes_from(ot_base_root, np)
+		__of_attach_node_sysfs(np);
+
+	if (of_symbols) {
+		for_each_property_of_node(ot_base_symbols, prop) {
+			ret = __of_add_property(of_symbols, prop);
+			if (ret) {
+				unittest(0,
+					 "duplicate property '%s' in ot_base node __symbols__",
+					 prop->name);
+				return;
+			}
+			ret = __of_add_property_sysfs(of_symbols, prop);
+			if (ret) {
+				unittest(0,
+					 "unable to add property '%s' in ot_base node __symbols__ to sysfs",
+					 prop->name);
+				return;
+			}
+		}
+	}
+
+	mutex_unlock(&of_mutex);
+
+
+	/* now do the normal overlay usage test */
+
+	unittest(overlay_test_data_add(0),
+		 "Adding overlay __dtb_ot_begin failed\n");
+
+	unittest(overlay_test_data_add(1),
+		 "Adding overlay phandle conflict failed\n");
+}
+
+#else
+
+static inline __init void of_unittest_overlay_high_level(void) {}
+
+#endif
+
 static int __init of_unittest(void)
 {
 	struct device_node *np;
@@ -1962,6 +2223,9 @@ static int __init of_unittest(void)
 	/* Double check linkage after removing testcase data */
 	of_unittest_check_tree_linkage();
 
+
+	of_unittest_overlay_high_level();
+
 	pr_info("end of unittest - %i passed, %i failed\n",
 		unittest_results.passed, unittest_results.failed);
 
-- 
Frank Rowand <frank.rowand@sony.com>

