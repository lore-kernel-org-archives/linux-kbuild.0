Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:25348 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727666AbeJ3Aax (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 20:30:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kconfig: remove oldnoconfig target
Date: Tue, 30 Oct 2018 00:41:27 +0900
Message-Id: <1540827688-15999-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

As commit 312ee68752fa ("kconfig: announce removal of oldnoconfig if
used") announced, it is time for the removal.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 9 +--------
 scripts/kconfig/conf.c   | 7 -------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 67ed9f6..5d37a60 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -68,14 +68,7 @@ PHONY += $(simple-targets)
 $(simple-targets): $(obj)/conf
 	$< $(silent) --$@ $(Kconfig)
 
-PHONY += oldnoconfig silentoldconfig savedefconfig defconfig
-
-# oldnoconfig is an alias of olddefconfig, because people already are dependent
-# on its behavior (sets new symbols to their default value but not 'n') with the
-# counter-intuitive name.
-oldnoconfig: olddefconfig
-	@echo "  WARNING: \"oldnoconfig\" target will be removed after Linux 4.19"
-	@echo "            Please use \"olddefconfig\" instead, which is an alias."
+PHONY += silentoldconfig savedefconfig defconfig
 
 # We do not expect manual invokcation of "silentoldcofig" (or "syncconfig").
 silentoldconfig: syncconfig
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 7b2b372..98e0c7a 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -460,12 +460,6 @@ static struct option long_opts[] = {
 	{"randconfig",      no_argument,       NULL, randconfig},
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
 	{"olddefconfig",    no_argument,       NULL, olddefconfig},
-	/*
-	 * oldnoconfig is an alias of olddefconfig, because people already
-	 * are dependent on its behavior(sets new symbols to their default
-	 * value but not 'n') with the counter-intuitive name.
-	 */
-	{"oldnoconfig",     no_argument,       NULL, olddefconfig},
 	{NULL, 0, NULL, 0}
 };
 
@@ -480,7 +474,6 @@ static void conf_usage(const char *progname)
 	printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
 	       "                          include/{generated/,config/}\n");
 	printf("  --olddefconfig          Same as oldconfig but sets new symbols to their default value\n");
-	printf("  --oldnoconfig           An alias of olddefconfig\n");
 	printf("  --defconfig <file>      New config with default defined in <file>\n");
 	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
 	printf("  --allnoconfig           New config where all options are answered with no\n");
-- 
2.7.4
