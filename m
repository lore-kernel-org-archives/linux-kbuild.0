Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:46120 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935423AbdLSB2D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 20:28:03 -0500
From: Marc Herbert <marc.herbert@intel.com>
Subject: [PATCH] Remove silentoldconfig from "make help"; fix kconfig/conf's help
Date: Mon, 18 Dec 2017 17:26:56 -0800
Message-Id: <20171219012656.23728-1-marc.herbert@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marc Herbert <marc.herbert@intel.com>

As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
silentoldconfig has become a misnomer. It has become an internal
interface and "oldconfig" is just as silent now. It's not part of the
user interface so remove it from "make help" to stop confusing people
trying to use it as seen for instance at
https://chromium-review.googlesource.com/271688

On the other hand, correct and expand its description in the help of
scripts/kconfig/conf.c

Signed-off-by: Marc Herbert <marc.herbert@intel.com>
---
 scripts/kconfig/Makefile | 1 -
 scripts/kconfig/conf.c   | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 297c1bf35140..bf13b8fa3ccc 100644
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
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 866369f10ff8..f8c002a19f62 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -477,7 +477,10 @@ static void conf_usage(const char *progname)
 	printf("  --listnewconfig         List new options\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
-	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
+	printf("  --silentoldconfig       Similar to oldconfig but:\n"
+	       "                            - no re-formatting of .config when nothing's missing\n"
+	       "                            - generates configuration in include/{generated/,config/}\n"
+	       "                          (oldconfig used to be more verbose)\n");
 	printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
 	printf("  --oldnoconfig           An alias of olddefconfig\n");
 	printf("  --defconfig <file>      New config with default defined in <file>\n");
-- 
2.9.5

