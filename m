Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu1sys200aog110.obsmtp.com ([207.126.144.129]:58831 "EHLO
	eu1sys200aog110.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753423Ab2HMIOF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Aug 2012 04:14:05 -0400
From: Srinivas KANDAGATLA <srinivas.kandagatla@st.com>
Subject: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for Pre-Processing.
Date: Mon, 13 Aug 2012 09:01:53 +0100
Message-Id: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, srinivas.kandagatla@st.com, mmarek@suse.cz, dwg@au1.ibm.com

From: Srinivas Kandagatla <srinivas.kandagatla@st.com>

This patch add pre-processing capablity to dtc based on status property.
Now the dtc has additional option -P to enable Pre-processing based on
status property.

The SOCS have lot of device tree infrastructure files which mark the
device nodes as disabled and the board level device tree enables them if
required. However while creating device tree blob, the compiler can
preprocess the nodes and exclude nodes marked as disabled, doing this
way will reduce the size of device tree blob.

In our case this has reduced the blob size from 29K to 15K.

Also nodes with status="disabled" is are never probed by dt platform bus
code.

Again, Preprocessing is optional parameter to dtc.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@st.com>
---
Hi All, 

I have noticed that the dtb blob also contains device nodes with property status = "disabled", 
But these device nodes are not used by device tree platform bus probe code or any of the kernel code.
Are these type of nodes ever used by the kernel code? 
If they are not it might be nice to get them out of dtb to reduce the overall size of dtb.

The size change will be significant once the SOC adds all the possible devices in to the device trees.

My patch adds option -P to dtc to skip such nodes, resulting in only nodes which are supposed to be instantiated.

Comments?

Thanks,
srini

 scripts/dtc/dtc.c        |    9 ++++++++-
 scripts/dtc/dtc.h        |    3 +++
 scripts/dtc/flattree.c   |    3 +++
 scripts/dtc/livetree.c   |   17 +++++++++++++++++
 scripts/dtc/treesource.c |    3 +++
 5 files changed, 34 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/dtc.c b/scripts/dtc/dtc.c
index 2ef5e2e..f20d4e0 100644
--- a/scripts/dtc/dtc.c
+++ b/scripts/dtc/dtc.c
@@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
 int reservenum;		/* Number of memory reservation slots */
 int minsize;		/* Minimum blob size */
 int padsize;		/* Additional padding to blob */
+int preprocess;		/* Preprocess output */
 int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
 
 static void fill_fullpaths(struct node *tree, const char *prefix)
@@ -84,6 +85,8 @@ static void  __attribute__ ((noreturn)) usage(void)
 	fprintf(stderr, "\t\tForce - try to produce output even if the input tree has errors\n");
 	fprintf(stderr, "\t-s\n");
 	fprintf(stderr, "\t\tSort nodes and properties before outputting (only useful for\n\t\tcomparing trees)\n");
+	fprintf(stderr, "\t-P\n");
+	fprintf(stderr, "\t\tPre-Process nodes based on status property\n");
 	fprintf(stderr, "\t-v\n");
 	fprintf(stderr, "\t\tPrint DTC version and exit\n");
 	fprintf(stderr, "\t-H <phandle format>\n");
@@ -108,12 +111,13 @@ int main(int argc, char *argv[])
 	int outversion = DEFAULT_FDT_VERSION;
 	long long cmdline_boot_cpuid = -1;
 
+	preprocess = 0;
 	quiet      = 0;
 	reservenum = 0;
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:d:R:S:p:fcqb:vH:s"))
+	while ((opt = getopt(argc, argv, "hI:O:o:V:d:R:S:p:fcqb:vH:s:P"))
 			!= EOF) {
 		switch (opt) {
 		case 'I':
@@ -167,6 +171,9 @@ int main(int argc, char *argv[])
 		case 's':
 			sort = 1;
 			break;
+		case 'P':
+			preprocess = 1;
+			break;
 
 		case 'h':
 		default:
diff --git a/scripts/dtc/dtc.h b/scripts/dtc/dtc.h
index f37c97e..a1b525c 100644
--- a/scripts/dtc/dtc.h
+++ b/scripts/dtc/dtc.h
@@ -52,6 +52,7 @@ extern int quiet;		/* Level of quietness */
 extern int reservenum;		/* Number of memory reservation slots */
 extern int minsize;		/* Minimum blob size */
 extern int padsize;		/* Additional padding to blob */
+extern int preprocess;		/* Preprocess output */
 extern int phandle_format;	/* Use linux,phandle or phandle properties */
 
 #define PHANDLE_LEGACY	0x1
@@ -222,6 +223,8 @@ struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 void sort_tree(struct boot_info *bi);
 
+int is_device_node_avaiable(struct node *node);
+
 /* Checks */
 
 void process_checks(int force, struct boot_info *bi);
diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
index 28d0b23..162066d 100644
--- a/scripts/dtc/flattree.c
+++ b/scripts/dtc/flattree.c
@@ -304,6 +304,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	}
 
 	for_each_child(tree, child) {
+		if (preprocess && !is_device_node_avaiable(child))
+			continue;
+
 		flatten_tree(child, emit, etarget, strbuf, vi);
 	}
 
diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
index 26d0e1e..37617d5 100644
--- a/scripts/dtc/livetree.c
+++ b/scripts/dtc/livetree.c
@@ -607,3 +607,20 @@ void sort_tree(struct boot_info *bi)
 	sort_reserve_entries(bi);
 	sort_node(bi->dt);
 }
+
+int is_device_node_avaiable(struct node *node)
+{
+	struct property *status;
+
+	status = get_property(node, "status");
+	if (status == NULL)
+		return 1;
+
+	if (status->val.len > 0) {
+		if (!strcmp(status->val.val, "okay") ||
+			 !strcmp(status->val.val, "ok"))
+			return 1;
+	}
+
+	return 0;
+}
diff --git a/scripts/dtc/treesource.c b/scripts/dtc/treesource.c
index c09aafa..febb622 100644
--- a/scripts/dtc/treesource.c
+++ b/scripts/dtc/treesource.c
@@ -253,6 +253,9 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
 		write_propval(f, prop);
 	}
 	for_each_child(tree, child) {
+		if (preprocess && !is_device_node_avaiable(child))
+			continue;
+
 		fprintf(f, "\n");
 		write_tree_source_node(f, child, level+1);
 	}
-- 
1.7.0.4

