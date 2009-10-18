Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:50926 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753442AbZJRILU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Oct 2009 04:11:20 -0400
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 11/14] kbuild: move compile.h to include/generated
Date: Sun, 18 Oct 2009 10:15:20 +0200
Message-Id: <1255853723-477-11-git-send-email-sam@ravnborg.org>
In-Reply-To: <20091018080635.GA13767@merkur.ravnborg.org>
References: <20091018080635.GA13767@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .gitignore              |    1 -
 arch/x86/boot/version.c |    2 +-
 init/Makefile           |    8 ++------
 init/version.c          |    2 +-
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/.gitignore b/.gitignore
index 624e3ab..0f594d9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,7 +46,6 @@ Module.symvers
 #
 include/config
 include/linux/autoconf.h
-include/linux/compile.h
 include/linux/version.h
 include/linux/utsrelease.h
 include/generated
diff --git a/arch/x86/boot/version.c b/arch/x86/boot/version.c
index 2723d9b..4d88763 100644
--- a/arch/x86/boot/version.c
+++ b/arch/x86/boot/version.c
@@ -14,7 +14,7 @@
 
 #include "boot.h"
 #include <linux/utsrelease.h>
-#include <linux/compile.h>
+#include <generated/compile.h>
 
 const char kernel_version[] =
 	UTS_RELEASE " (" LINUX_COMPILE_BY "@" LINUX_COMPILE_HOST ") "
diff --git a/init/Makefile b/init/Makefile
index 4a243df..0bf677a 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -15,12 +15,8 @@ mounts-$(CONFIG_BLK_DEV_RAM)	+= do_mounts_rd.o
 mounts-$(CONFIG_BLK_DEV_INITRD)	+= do_mounts_initrd.o
 mounts-$(CONFIG_BLK_DEV_MD)	+= do_mounts_md.o
 
-# files to be removed upon make clean
-clean-files := ../include/linux/compile.h
-
 # dependencies on generated files need to be listed explicitly
-
-$(obj)/version.o: include/linux/compile.h
+$(obj)/version.o: include/generated/compile.h
 
 # compile.h changes depending on hostname, generation number, etc,
 # so we regenerate it always.
@@ -30,7 +26,7 @@ $(obj)/version.o: include/linux/compile.h
        chk_compile.h = :
  quiet_chk_compile.h = echo '  CHK     $@'
 silent_chk_compile.h = :
-include/linux/compile.h: FORCE
+include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@ \
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)" "$(CC) $(KBUILD_CFLAGS)"
diff --git a/init/version.c b/init/version.c
index 52a8b98..82328aa 100644
--- a/init/version.c
+++ b/init/version.c
@@ -6,7 +6,7 @@
  *  May be freely distributed as part of Linux.
  */
 
-#include <linux/compile.h>
+#include <generated/compile.h>
 #include <linux/module.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
-- 
1.6.2.5

