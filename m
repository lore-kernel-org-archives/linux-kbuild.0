Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:29172 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfILIGt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 04:06:49 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: change need-modorder implementation slightly
Date: Thu, 12 Sep 2019 17:06:26 +0900
Message-Id: <20190912080626.13773-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Align with the need-builtin implementation.

I also added need-modorder=1 to scripts/link-vmlinux.sh for future-proof;
Currently, we have no module in the init/ directory, but if we had a one,
scripts/Makefile.build would show the false positive warning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Add need-modorder=1 to link-vmlinux.sh

 scripts/Makefile.build  | 2 +-
 scripts/Makefile.lib    | 2 ++
 scripts/link-vmlinux.sh | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d30b04707fec..91617b9d7a34 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -528,7 +528,7 @@ $(subdir-ym):
 	$(Q)$(MAKE) $(build)=$@ \
 	$(if $(filter $@/, $(KBUILD_SINGLE_TARGETS)),single-build=) \
 	need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1) \
-	need-modorder=$(if $(need-modorder),$(if $(filter $@/modules.order, $(modorder)),1))
+	need-modorder=$(if $(filter $@/modules.order, $(modorder)),1)
 
 # Add FORCE to the prequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 07095d3789a1..034e92ea72c6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -23,7 +23,9 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
+ifdef need-modorder
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+endif
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 8961d999b86b..d9edfba54d84 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -216,7 +216,7 @@ else
 fi;
 
 # final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1
+${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init need-builtin=1 need-modorder=1
 
 #link vmlinux.o
 info LD vmlinux.o
-- 
2.17.1
