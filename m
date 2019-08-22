Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29727 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730905AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] kbuild: check clean srctree even earlier
Date: Thu, 22 Aug 2019 13:46:13 +0900
Message-Id: <20190822044613.5349-6-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Move the outputmakefile target to the leftmost in the prerequisite list
so that this is checked first. There is no guarantee that Make runs the
prerequisites from left to right, but at least the released versions of
GNU Make work like that when the parallel build option is not given.

Of course, when the parallel option -j given, other targets will be run
simultaneously but it is nice to show the error as early as possible.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 960df4d35b15..089983a8a028 100644
--- a/Makefile
+++ b/Makefile
@@ -581,10 +581,10 @@ ifdef config-build
 include arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
 
-config: scripts_basic outputmakefile FORCE
+config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
-%config: scripts_basic outputmakefile FORCE
+%config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 else #!config-build
@@ -1123,7 +1123,7 @@ scripts: scripts_basic scripts_dtc
 
 PHONY += prepare archprepare
 
-archprepare: archheaders archscripts scripts include/config/kernel.release outputmakefile \
+archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
-- 
2.17.1
