Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:20106 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfHYN24 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Aug 2019 09:28:56 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add $(BASH) to run scripts with bash-extension
Date: Sun, 25 Aug 2019 22:28:37 +0900
Message-Id: <20190825132837.13873-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

CONFIG_SHELL falls back to sh when bash is not installed on the system,
but nobody is testing such a case since bash is usually installed.
That is, shell scripts invoked by CONFIG_SHELL are only tested with
bash.

It makes it difficult to test whether the hashbang #!/bin/sh is real.
In fact, I saw some patches trying to add bash-extension to #!/bin/sh
script.

Besides, some shell scripts invoked by CONFIG_SHELL use bash-extension
and #!/bin/bash is specified as the hashbang, while CONFIG_SHELL may
not always be set to bash.

Probably, the right thing to do is to introduce BASH that is bash by
default, and always set CONFIG_SHELL to sh. Replace $(CONFIG_SHELL)
with $(BASH) for #!/bin/bash scripts.

If somebody tries to add bash-extension to a #!/bin/sh script, it will
be caught by somebody because /bin/sh is a symlink to dash on some
major distributions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile             | 11 +++++------
 kernel/Makefile      |  2 +-
 scripts/Makefile.lib |  2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 3f95d1d04b08..23d8fa6b047b 100644
--- a/Makefile
+++ b/Makefile
@@ -404,9 +404,7 @@ KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
 # SHELL used by kbuild
-CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
-	  else if [ -x /bin/bash ]; then echo /bin/bash; \
-	  else echo sh; fi ; fi)
+CONFIG_SHELL := sh
 
 HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
@@ -443,6 +441,7 @@ PYTHON		= python
 PYTHON2		= python2
 PYTHON3		= python3
 CHECK		= sparse
+BASH		= bash
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -488,7 +487,7 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
-export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
@@ -1694,7 +1693,7 @@ clean: $(clean-dirs)
 # Generate tags for editors
 # ---------------------------------------------------------------------------
 quiet_cmd_tags = GEN     $@
-      cmd_tags = $(CONFIG_SHELL) $(srctree)/scripts/tags.sh $@
+      cmd_tags = $(BASH) $(srctree)/scripts/tags.sh $@
 
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
@@ -1715,7 +1714,7 @@ versioncheck:
 		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
 
 coccicheck:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/$@
+	$(Q)$(BASH) $(srctree)/scripts/$@
 
 namespacecheck:
 	$(PERL) $(srctree)/scripts/namespace.pl
diff --git a/kernel/Makefile b/kernel/Makefile
index ef0d95a190b4..4deab893ca83 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -126,7 +126,7 @@ $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-cmd_genikh = $(CONFIG_SHELL) $(srctree)/kernel/gen_kheaders.sh $@
+cmd_genikh = $(BASH) $(srctree)/kernel/gen_kheaders.sh $@
 $(obj)/kheaders_data.tar.xz: FORCE
 	$(call cmd,genikh)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 888e5c830646..7ab17712ab24 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -364,7 +364,7 @@ UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
 UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'
 
 quiet_cmd_uimage = UIMAGE  $@
-      cmd_uimage = $(CONFIG_SHELL) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
+      cmd_uimage = $(BASH) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
 			-C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
 			-T $(UIMAGE_TYPE) \
 			-a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
-- 
2.17.1
