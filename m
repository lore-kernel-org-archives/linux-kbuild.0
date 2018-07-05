Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:44282 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753430AbeGEClt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 22:41:49 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 11/12] kbuild: remove auto.conf and tristate.conf from prerequisites
Date: Thu,  5 Jul 2018 11:39:48 +0900
Message-Id: <1530758389-30862-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The top-level Makefile adds include/config/auto.conf as
prerequisites of 'scripts', 'prepare1', etc.

They were needed to terminate the build when include/config/auto.conf
is missing.

Now that the inclusion of include/config/auto.conf is mandatory
in the top-level Makefile if dot-config is 1 (Note 'include' directive
is used instead of '-include').

Make terminates the build by itself if it fails to create or update
include/config/auto.conf so we are sure that include/config/auto.conf
exists in the very first stage of make.

We do not have to explicitly list include/config/auto.conf as
prerequisites any more.

include/config/tristate.conf is generated as a side-effect of
syncconfig; if auto.conf exists, tristate.conf exists as well
(unless a user does 'rm include/config/tristate.conf')

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index c258937..c6ab38c4 100644
--- a/Makefile
+++ b/Makefile
@@ -649,10 +649,6 @@ include/config/auto.conf:
 	/bin/false)
 
 endif # may-sync-config
-
-else
-# Dummy target needed, because used as prerequisite
-include/config/auto.conf: ;
 endif # $(dot-config)
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
@@ -1047,15 +1043,14 @@ define filechk_kernel.release
 endef
 
 # Store (new) KERNELRELEASE string in include/config/kernel.release
-include/config/kernel.release: include/config/auto.conf FORCE
+include/config/kernel.release: $(srctree)/Makefile FORCE
 	$(call filechk,kernel.release)
 
 # Additional helpers built in scripts/
 # Carefully list dependencies so we do not try to build scripts twice
 # in parallel
 PHONY += scripts
-scripts: scripts_basic include/config/auto.conf include/config/tristate.conf \
-	 asm-generic gcc-plugins $(autoksyms_h)
+scripts: scripts_basic asm-generic gcc-plugins $(autoksyms_h)
 	$(Q)$(MAKE) $(build)=$(@)
 
 # Things we need to do before we recursively start building the kernel
@@ -1085,8 +1080,7 @@ endif
 # that need to depend on updated CONFIG_* values can be checked here.
 prepare2: prepare3 outputmakefile asm-generic
 
-prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
-                   include/config/auto.conf
+prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 	$(cmd_crmodverdir)
 
 archprepare: archheaders archscripts prepare1 scripts_basic
@@ -1224,7 +1218,7 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
 
-%/modules.builtin: include/config/auto.conf
+%/modules.builtin:
 	$(Q)$(MAKE) $(modbuiltin)=$*
 
 
-- 
2.7.4

