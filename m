Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28854 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbeGTIfM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 04/11] kconfig: create directories needed for syncconfig by itself
Date: Fri, 20 Jul 2018 16:46:29 +0900
Message-Id: <1532072796-7947-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

'make syncconfig' creates some files such as include/config/auto.conf,
include/generate/autoconf.h, etc. but the necessary directory creation
relies on scripts/kconfig/Makefile.

To make Kconfig self-contained, create directories as needed in
conf_write_autoconf().

This change allows scripts/kconfig/Makefile cleanups; syncconfig can
be merged into simple-targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None

 scripts/kconfig/Makefile   | 15 ++++++---------
 scripts/kconfig/confdata.c | 14 ++++++++++++++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 96a1c3d..963ba90 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -3,8 +3,7 @@
 # Kernel configuration targets
 # These targets are used from top-level makefile
 
-PHONY += xconfig gconfig menuconfig config syncconfig \
-	localmodconfig localyesconfig
+PHONY += xconfig gconfig menuconfig config localmodconfig localyesconfig
 
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
@@ -34,12 +33,6 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
 
-# This has become an internal implementation detail and is now deprecated
-# for external use.
-syncconfig: $(obj)/conf
-	$(Q)mkdir -p include/config include/generated
-	$< $(silent) --$@ $(Kconfig)
-
 localyesconfig localmodconfig: $(obj)/conf
 	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
@@ -55,8 +48,12 @@ localyesconfig localmodconfig: $(obj)/conf
 	$(Q)rm -f .tmp.config
 
 # These targets map 1:1 to the commandline options of 'conf'
+#
+# Note:
+#  syncconfig has become an internal implementation detail and is now
+#  deprecated for external use
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
-	alldefconfig randconfig listnewconfig olddefconfig
+	alldefconfig randconfig listnewconfig olddefconfig syncconfig
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index f9c5ad4..029ab16 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -894,6 +894,9 @@ static int conf_write_dep(const char *name)
 
 	fprintf(out, "\n$(deps_config): ;\n");
 	fclose(out);
+
+	if (make_parent_dir(name))
+		return 1;
 	rename("..config.tmp", name);
 	return 0;
 }
@@ -910,6 +913,8 @@ static int conf_split_config(void)
 	conf_read_simple(name, S_DEF_AUTO);
 	sym_calc_value(modules_sym);
 
+	if (make_parent_dir("include/config/foo.h"))
+		return 1;
 	if (chdir("include/config"))
 		return 1;
 
@@ -986,6 +991,7 @@ static int conf_split_config(void)
 				res = 1;
 				goto out;
 			}
+
 			/* Try it again. */
 			fd = open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
 			if (fd == -1) {
@@ -1058,14 +1064,22 @@ int conf_write_autoconf(void)
 	name = getenv("KCONFIG_AUTOHEADER");
 	if (!name)
 		name = "include/generated/autoconf.h";
+	if (make_parent_dir(name))
+		return 1;
 	if (rename(".tmpconfig.h", name))
 		return 1;
+
 	name = getenv("KCONFIG_TRISTATE");
 	if (!name)
 		name = "include/config/tristate.conf";
+	if (make_parent_dir(name))
+		return 1;
 	if (rename(".tmpconfig_tristate", name))
 		return 1;
+
 	name = conf_get_autoconfig_name();
+	if (make_parent_dir(name))
+		return 1;
 	/*
 	 * This must be the last step, kbuild has a dependency on auto.conf
 	 * and this marks the successful completion of the previous steps.
-- 
2.7.4

