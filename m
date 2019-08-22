Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29723 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] kbuild: move the clean srctree check to the outputmakefile target
Date: Thu, 22 Aug 2019 13:46:11 +0900
Message-Id: <20190822044613.5349-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

With this commit, the error report is shown earlier, even before
running kconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 901fcb8fffbe..ca6851f5ebc9 100644
--- a/Makefile
+++ b/Makefile
@@ -522,6 +522,7 @@ scripts_basic:
 	$(Q)rm -f .tmp_quiet_recordmcount
 
 PHONY += outputmakefile
+# Before starting out-of-tree build, make sure the source tree is clean.
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
@@ -529,6 +530,15 @@ PHONY += outputmakefile
 # ignore whole output directory
 outputmakefile:
 ifdef building_out_of_srctree
+	$(Q)if [ -f $(srctree)/.config -o \
+		 -d $(srctree)/include/config -o \
+		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+		echo >&2 "***"; \
+		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
+		echo >&2 "*** in $(abs_srctree)";\
+		echo >&2 "***"; \
+		false; \
+	fi
 	$(Q)ln -fsn $(srctree) source
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
 	$(Q)test -e .gitignore || \
@@ -1113,21 +1123,7 @@ scripts: scripts_basic scripts_dtc
 
 PHONY += prepare archprepare prepare3
 
-# prepare3 is used to check if we are building in a separate output directory,
-# and if so do:
-# 1) Check that make has not been executed in the kernel src $(srctree)
 prepare3: include/config/kernel.release
-ifdef building_out_of_srctree
-	$(Q)if [ -f $(srctree)/.config -o \
-		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
-		echo >&2 "***"; \
-		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
-		echo >&2 "*** in $(abs_srctree)";\
-		echo >&2 "***"; \
-		/bin/false; \
-	fi;
-endif
 
 archprepare: archheaders archscripts scripts prepare3 outputmakefile \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
-- 
2.17.1
