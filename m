Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:16426 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfAQALK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jan 2019 19:11:10 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v3 2/2] kbuild: merge KBUILD_VMLINUX_{INIT,MAIN} into KBUILD_VMLINUX_OBJS
Date: Thu, 17 Jan 2019 09:10:04 +0900
Message-Id: <1547683804-17956-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1547683804-17956-1-git-send-email-yamada.masahiro@socionext.com>
References: <1547683804-17956-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

The top Makefile does not need to export KBUILD_VMLINUX_INIT and
KBUILD_VMLINUX_MAIN separately.

Put every built-in.a into KBUILD_VMLINUX_OBJS. The order of
$(head-y), $(init-y), $(core-y), ... is still retained.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
 - update the document

Changes in v2: None

 Documentation/kbuild/kbuild.txt | 15 +++++----------
 Makefile                        |  6 +++---
 scripts/link-vmlinux.sh         | 28 ++++++++++------------------
 3 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index c9e3d93..8a3830b 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -232,17 +232,12 @@ KBUILD_LDS
 --------------------------------------------------
 The linker script with full path. Assigned by the top-level Makefile.
 
-KBUILD_VMLINUX_INIT
+KBUILD_VMLINUX_OBJS
 --------------------------------------------------
-All object files for the init (first) part of vmlinux.
-Files specified with KBUILD_VMLINUX_INIT are linked first.
-
-KBUILD_VMLINUX_MAIN
---------------------------------------------------
-All object files for the main part of vmlinux.
+All object files for vmlinux. They are linked to vmlinux in the same
+order as listed in KBUILD_VMLINUX_OBJS.
 
 KBUILD_VMLINUX_LIBS
 --------------------------------------------------
-All .a "lib" files for vmlinux.
-KBUILD_VMLINUX_INIT, KBUILD_VMLINUX_MAIN, and KBUILD_VMLINUX_LIBS together
-specify all the object files used to link vmlinux.
+All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS
+together specify all the object files used to link vmlinux.
diff --git a/Makefile b/Makefile
index 499b968..68898cc 100644
--- a/Makefile
+++ b/Makefile
@@ -975,15 +975,15 @@ libs-y2		:= $(patsubst %/, %/built-in.a, $(filter-out %.a, $(libs-y)))
 virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_INIT := $(head-y) $(init-y)
-export KBUILD_VMLINUX_MAIN := $(core-y) $(libs-y2) $(drivers-y) $(net-y) $(virt-y)
+export KBUILD_VMLINUX_OBJS := $(head-y) $(init-y) $(core-y) $(libs-y2) \
+			      $(drivers-y) $(net-y) $(virt-y)
 export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 export LDFLAGS_vmlinux
 # used by scripts/package/Makefile
 export KBUILD_ALLDIRS := $(sort $(filter-out arch/%,$(vmlinux-alldirs)) arch Documentation include samples scripts tools)
 
-vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_INIT) $(KBUILD_VMLINUX_MAIN) $(KBUILD_VMLINUX_LIBS)
+vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 
 # Recurse until adjust_autoksyms.sh is satisfied
 PHONY += autoksyms_recursive
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4788def..bc7f1fc 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -3,22 +3,17 @@
 #
 # link vmlinux
 #
-# vmlinux is linked from the objects selected by $(KBUILD_VMLINUX_INIT) and
-# $(KBUILD_VMLINUX_MAIN) and $(KBUILD_VMLINUX_LIBS). Most are built-in.a files
-# from top-level directories in the kernel tree, others are specified in
-# arch/$(ARCH)/Makefile. Ordering when linking is important, and
-# $(KBUILD_VMLINUX_INIT) must be first. $(KBUILD_VMLINUX_LIBS) are archives
-# which are linked conditionally (not within --whole-archive), and do not
-# require symbol indexes added.
+# vmlinux is linked from the objects selected by $(KBUILD_VMLINUX_OBJS) and
+# $(KBUILD_VMLINUX_LIBS). Most are built-in.a files from top-level directories
+# in the kernel tree, others are specified in arch/$(ARCH)/Makefile.
+# $(KBUILD_VMLINUX_LIBS) are archives which are linked conditionally
+# (not within --whole-archive), and do not require symbol indexes added.
 #
 # vmlinux
 #   ^
 #   |
-#   +-< $(KBUILD_VMLINUX_INIT)
-#   |   +--< init/version.o + more
-#   |
-#   +--< $(KBUILD_VMLINUX_MAIN)
-#   |    +--< drivers/built-in.a mm/built-in.a + more
+#   +--< $(KBUILD_VMLINUX_OBJS)
+#   |    +--< init/built-in.a drivers/built-in.a mm/built-in.a + more
 #   |
 #   +--< $(KBUILD_VMLINUX_LIBS)
 #   |    +--< lib/lib.a + more
@@ -51,8 +46,7 @@ modpost_link()
 	local objects
 
 	objects="--whole-archive				\
-		${KBUILD_VMLINUX_INIT}				\
-		${KBUILD_VMLINUX_MAIN}				\
+		${KBUILD_VMLINUX_OBJS}				\
 		--no-whole-archive				\
 		--start-group					\
 		${KBUILD_VMLINUX_LIBS}				\
@@ -71,8 +65,7 @@ vmlinux_link()
 
 	if [ "${SRCARCH}" != "um" ]; then
 		objects="--whole-archive			\
-			${KBUILD_VMLINUX_INIT}			\
-			${KBUILD_VMLINUX_MAIN}			\
+			${KBUILD_VMLINUX_OBJS}			\
 			--no-whole-archive			\
 			--start-group				\
 			${KBUILD_VMLINUX_LIBS}			\
@@ -83,8 +76,7 @@ vmlinux_link()
 			-T ${lds} ${objects}
 	else
 		objects="-Wl,--whole-archive			\
-			${KBUILD_VMLINUX_INIT}			\
-			${KBUILD_VMLINUX_MAIN}			\
+			${KBUILD_VMLINUX_OBJS}			\
 			-Wl,--no-whole-archive			\
 			-Wl,--start-group			\
 			${KBUILD_VMLINUX_LIBS}			\
-- 
2.7.4
