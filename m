Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:51376 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752840AbeARBmD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 20:42:03 -0500
From: Marc Herbert <marc.herbert@intel.com>
Subject: [PATCH v2] Remove silentoldconfig from "make help"; fix kconfig/conf's help
Date: Wed, 17 Jan 2018 17:41:37 -0800
Message-Id: <20180118014137.28313-1-marc.herbert@intel.com>
In-Reply-To: <20171219012656.23728-1-marc.herbert@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Wayne Boyer <wayne.boyer@intel.com>, Marc Herbert <marc.herbert@intel.com>

As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
silentoldconfig has become a misnomer. It has become an internal interface
so remove it from "make help" to stop confusing people trying to use it as
seen for instance at https://chromium-review.googlesource.com/835632

On the other hand, correct and expand its description in the help of
scripts/kconfig/conf.c

Signed-off-by: Marc Herbert <marc.herbert@intel.com>
---
v2: rewordings (Masahiro)

 scripts/kconfig/Makefile | 5 ++---
 scripts/kconfig/conf.c   | 5 +++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 297c1bf35140..ac4bda790922 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -142,7 +142,6 @@ help:
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
 	@echo  '  localyesconfig  - Update current config converting local mods to core'
-	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
 	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
 	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
 	@echo  '  allnoconfig	  - New config where all options are answered with no'
@@ -151,8 +150,8 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their'
-	@echo  '                    default value'
+	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
+	@echo  '                    default value without prompting'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 866369f10ff8..303fbe2ffa04 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -477,8 +477,9 @@ static void conf_usage(const char *progname)
 	printf("  --listnewconfig         List new options\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
-	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
-	printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
+	printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
+	       "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
+	printf("  --olddefconfig          Same as oldconfig but sets new symbols to their default value\n");
 	printf("  --oldnoconfig           An alias of olddefconfig\n");
 	printf("  --defconfig <file>      New config with default defined in <file>\n");
 	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
-- 
2.13.6

