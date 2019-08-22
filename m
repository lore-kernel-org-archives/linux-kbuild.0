Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29728 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/6] kbuild: remove prepare3 target
Date: Thu, 22 Aug 2019 13:46:12 +0900
Message-Id: <20190822044613.5349-5-yamada.masahiro@socionext.com>
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now prepare3 does nothing but depends on include/config/kernel.release

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ca6851f5ebc9..960df4d35b15 100644
--- a/Makefile
+++ b/Makefile
@@ -1121,11 +1121,9 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare3
+PHONY += prepare archprepare
 
-prepare3: include/config/kernel.release
-
-archprepare: archheaders archscripts scripts prepare3 outputmakefile \
+archprepare: archheaders archscripts scripts include/config/kernel.release outputmakefile \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
@@ -1261,11 +1259,11 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: prepare3 scripts_dtc
+%.dtb: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dt_binding_check
-dtbs dtbs_check: prepare3 scripts_dtc
+dtbs dtbs_check: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
 dtbs_check: export CHECK_DTBS=1
-- 
2.17.1
