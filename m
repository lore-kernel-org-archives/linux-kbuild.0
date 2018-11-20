Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:35503 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbeKUDnw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 22:43:52 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: move modpost out of 'scripts' target
Date: Wed, 21 Nov 2018 02:13:24 +0900
Message-Id: <1542734004-2673-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

I am eagar to build under the scripts/ directory only with $(HOSTCC),
but scripts/mod/ highly depends on the $(CC) and target arch headers.
That it why the 'scripts' target must depend on 'asm-generic',
'gcc-plugins', and $(autoksyms_h).

Move it to the 'prepare0' stage. I know this is a cheesy workaround,
but better than the current situation.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile             | 3 ++-
 scripts/Makefile     | 3 +--
 scripts/mod/Makefile | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index b78cc97..21a7729 100644
--- a/Makefile
+++ b/Makefile
@@ -1073,7 +1073,7 @@ include/config/kernel.release: $(srctree)/Makefile FORCE
 # Carefully list dependencies so we do not try to build scripts twice
 # in parallel
 PHONY += scripts
-scripts: scripts_basic scripts_dtc asm-generic gcc-plugins $(autoksyms_h)
+scripts: scripts_basic scripts_dtc
 	$(Q)$(MAKE) $(build)=$(@)
 
 # Things we need to do before we recursively start building the kernel
@@ -1111,6 +1111,7 @@ macroprepare: prepare1 archmacros
 archprepare: archheaders archscripts macroprepare scripts_basic
 
 prepare0: archprepare gcc-plugins
+	$(Q)$(MAKE) $(build)=scripts/mod
 	$(Q)$(MAKE) $(build)=.
 
 # All the preparing..
diff --git a/scripts/Makefile b/scripts/Makefile
index ece52ff..b48259d 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -37,9 +37,8 @@ build_unifdef: $(obj)/unifdef
 	@:
 
 subdir-$(CONFIG_MODVERSIONS) += genksyms
-subdir-y                     += mod
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_GDB_SCRIPTS) += gdb
 
 # Let clean descend into subdirs
-subdir-	+= basic dtc kconfig package gcc-plugins
+subdir-	+= basic dtc kconfig mod package gcc-plugins
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index a5b4af4..42c5d50 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -4,8 +4,6 @@ OBJECT_FILES_NON_STANDARD := y
 hostprogs-y	:= modpost mk_elfconfig
 always		:= $(hostprogs-y) empty.o
 
-CFLAGS_REMOVE_empty.o := $(ASM_MACRO_FLAGS)
-
 modpost-objs	:= modpost.o file2alias.o sumversion.o
 
 devicetable-offsets-file := devicetable-offsets.h
-- 
2.7.4
