Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62958 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 11/12] kbuild: remove 'prepare1' target
Date: Wed, 17 Jul 2019 15:17:59 +0900
Message-Id: <20190717061800.10018-12-yamada.masahiro@socionext.com>
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Lawrence <joe.lawrence@redhat.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that there is no rule for 'prepare1', it can go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2: None

 Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9ad9f8d1130d..14458ab3d6a8 100644
--- a/Makefile
+++ b/Makefile
@@ -1089,7 +1089,7 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare1 prepare3
+PHONY += prepare archprepare prepare3
 
 # prepare3 is used to check if we are building in a separate output directory,
 # and if so do:
@@ -1106,10 +1106,8 @@ ifdef building_out_of_srctree
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
