Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28746 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbeGTIfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:09 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 11/11] kbuild: remove auto.conf from prerequisite of phony targets
Date: Fri, 20 Jul 2018 16:46:36 +0900
Message-Id: <1532072796-7947-12-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

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

I am still keeping include/config/auto.conf as the prerequisite of
%/modules.builtin because modules.builtin is a real file.  According
to commit a6c366324cac ("kbuild: Do not unnecessarily regenerate
modules.builtin"), it is intentional to compare time-stamps between
%/modules.builtin and include/config/auto.conf .  I moved tristate.conf
here because it is only included from scripts/Makefile.modbuiltin.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None

 Makefile | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 0ec1c27..ceb9c1e 100644
--- a/Makefile
+++ b/Makefile
@@ -650,10 +650,6 @@ include/config/auto.conf:
 	/bin/false)
 
 endif # may-sync-config
-
-else
-# Dummy target needed, because used as prerequisite
-include/config/auto.conf: ;
 endif # $(dot-config)
 
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
@@ -1048,15 +1044,14 @@ define filechk_kernel.release
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
@@ -1086,8 +1081,7 @@ endif
 # that need to depend on updated CONFIG_* values can be checked here.
 prepare2: prepare3 outputmakefile asm-generic
 
-prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
-                   include/config/auto.conf
+prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 	$(cmd_crmodverdir)
 
 archprepare: archheaders archscripts prepare1 scripts_basic
@@ -1225,7 +1219,7 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
 
-%/modules.builtin: include/config/auto.conf
+%/modules.builtin: include/config/auto.conf include/config/tristate.conf
 	$(Q)$(MAKE) $(modbuiltin)=$*
 
 
-- 
2.7.4

