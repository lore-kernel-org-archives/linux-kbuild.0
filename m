Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:42170 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbfGIEZl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:41 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 10/11] kbuild: remove 'prepare1' target
Date: Tue,  9 Jul 2019 13:24:14 +0900
Message-Id: <20190709042416.27554-11-yamada.masahiro@socionext.com>
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 958fafa605b9..b284863e7ea0 100644
--- a/Makefile
+++ b/Makefile
@@ -1094,7 +1094,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1111,10 +1111,8 @@ ifneq ($(srctree),.)
 	fi;
 endif
 
-prepare1: prepare3 outputmakefile asm-generic $(version_h) $(autoksyms_h) \
-						include/generated/utsrelease.h
-
-archprepare: archheaders archscripts prepare1 scripts
+archprepare: archheaders archscripts scripts prepare3 outputmakefile \
+	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
 	$(Q)$(MAKE) $(build)=scripts/mod
-- 
2.17.1
