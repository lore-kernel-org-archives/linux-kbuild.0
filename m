Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:59468 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 10/11] kbuild: remove 'prepare1' target
Date: Thu, 11 Jul 2019 14:44:33 +0900
Message-Id: <20190711054434.1177-11-yamada.masahiro@socionext.com>
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 4243b6daffcf..8de893e41149 100644
--- a/Makefile
+++ b/Makefile
@@ -1093,7 +1093,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1110,10 +1110,8 @@ ifneq ($(srctree),.)
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
