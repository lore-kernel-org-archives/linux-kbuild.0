Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:37863 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730510AbfC3MFr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 08:05:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/6] kbuild: use $(srctree) instead of KBUILD_SRC to check out-of-tree build
Date: Sat, 30 Mar 2019 21:04:17 +0900
Message-Id: <1553947458-8311-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "David S. Miller" <davem@davemloft.net>, Joey Pabalinas <joeypabalinas@gmail.com>, Kirill Tkhai <ktkhai@virtuozzo.com>, linux-kernel@vger.kernel.org, Constantine Shulyupin <const@MakeLinux.com>, Michal Marek <michal.lkml@markovi.net>, Kieran Bingham <kbingham@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, Andrew Morton <akpm@linux-foundation.org>

KBUILD_SRC was conventionally used for some different purposes:
 [1] To remember the source tree path
 [2] As a flag to check if sub-make is already done
 [3] As a flag to check if Kbuild runs out of tree

For [1], we do not need to remember it because the top Makefile
can compute it by $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

[2] has been replaced with self-commenting 'sub_make_done'.

For [3], we can distinguish in-tree/out-of-tree by comparing
$(srctree) and '.'

This commit converts [3] to prepare for the KBUILD_SRC removal.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile                    | 6 +++---
 scripts/Makefile.build      | 2 +-
 scripts/Makefile.host       | 2 +-
 scripts/Makefile.lib        | 2 +-
 scripts/Makefile.modbuiltin | 2 +-
 scripts/gdb/linux/Makefile  | 2 +-
 scripts/tags.sh             | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 1b2a70e..fa441ca 100644
--- a/Makefile
+++ b/Makefile
@@ -448,7 +448,7 @@ USERINCLUDE    := \
 LINUXINCLUDE    := \
 		-I$(srctree)/arch/$(SRCARCH)/include \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated \
-		$(if $(KBUILD_SRC), -I$(srctree)/include) \
+		$(if $(filter .,$(srctree)),,-I$(srctree)/include) \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
@@ -509,7 +509,7 @@ PHONY += outputmakefile
 # At the same time when output Makefile generated, generate .gitignore to
 # ignore whole output directory
 outputmakefile:
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 	$(Q)ln -fsn $(srctree) source
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
 	$(Q)test -e .gitignore || \
@@ -1087,7 +1087,7 @@ PHONY += prepare archprepare prepare1 prepare3
 # and if so do:
 # 1) Check that make has not been executed in the kernel src $(srctree)
 prepare3: include/config/kernel.release
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 	@$(kecho) '  Using $(srctree) as source for kernel'
 	$(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
 		echo >&2 "  $(srctree) is not clean, please run 'make mrproper'"; \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 76ca30c..9dddfb6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -501,7 +501,7 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 # Create directories for object files if they do not exist
 obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
 # If targets exist, their directories apparently exist. Skip mkdir.
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index a115259..73b8041 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -71,7 +71,7 @@ __hostc_flags	= $(_hostc_flags)
 __hostcxx_flags	= $(_hostcxx_flags)
 
 ifeq ($(KBUILD_EXTMOD),)
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 __hostc_flags	= -I$(obj) $(call flags,_hostc_flags)
 __hostcxx_flags	= -I$(obj) $(call flags,_hostcxx_flags)
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 8a1f64f..41e98fa 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -144,7 +144,7 @@ __cpp_flags     = $(_cpp_flags)
 # If building the kernel in a separate objtree expand all occurrences
 # of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
 ifeq ($(KBUILD_EXTMOD),)
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 
 # -I$(obj) locates generated .h files
 # $(call addtree,-I$(obj)) locates .h files in srctree, from generated .c files
diff --git a/scripts/Makefile.modbuiltin b/scripts/Makefile.modbuiltin
index a072a42..ea90a90 100644
--- a/scripts/Makefile.modbuiltin
+++ b/scripts/Makefile.modbuiltin
@@ -15,7 +15,7 @@ include include/config/tristate.conf
 
 include scripts/Kbuild.include
 
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 # Create output directory if not already present
 _dummy := $(shell [ -d $(obj) ] || mkdir -p $(obj))
 endif
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 3df395a..9fd3d8e 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ifneq ($(KBUILD_SRC),)
+ifneq ($(srctree),.)
 
 symlinks := $(patsubst $(srctree)/$(src)/%,%,$(wildcard $(srctree)/$(src)/*.py))
 
diff --git a/scripts/tags.sh b/scripts/tags.sh
index f470d99..6a55180 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -19,7 +19,7 @@ ignore="$ignore ( -name *.mod.c ) -prune -o"
 # Do not use full path if we do not use O=.. builds
 # Use make O=. {tags|cscope}
 # to force full paths for a non-O= build
-if [ "${KBUILD_SRC}" = "" ]; then
+if [ "${srctree}" = "." ]; then
 	tree=
 else
 	tree=${srctree}/
-- 
2.7.4
