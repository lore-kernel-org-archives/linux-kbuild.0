Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:50863 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936142AbdKPRCb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 12:02:31 -0500
From: Knut Omang <knut.omang@oracle.com>
Subject: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Date: Thu, 16 Nov 2017 18:01:42 +0100
Message-Id: <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Knut Omang <knut.omang@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

Add interpretation of a new environment variable P={1,2} in spirit of the
C= option, but executing checkpatch instead of sparse.

Signed-off-by: Knut Omang <knut.omang@oracle.com>
Reviewed-by: Håkon Bugge <haakon.bugge@oracle.com>
Acked-by: Åsmund Østvold <asmund.ostvold@oracle.com>
---
 Makefile               | 20 +++++++++++++++++++-
 scripts/Makefile.build | 13 +++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ccd9818..eb4bca9 100644
--- a/Makefile
+++ b/Makefile
@@ -176,6 +176,20 @@ ifndef KBUILD_CHECKSRC
   KBUILD_CHECKSRC = 0
 endif
 
+# Run scripts/checkpatch.pl with --ignore-cfg checkpatch.cfg
+#
+# Use 'make P=1' to enable checking of only re-compiled files.
+# Use 'make P=2' to enable checking of *all* source files, regardless
+#
+# See the file "Documentation/dev-tools/run-checkpatch.rst" for more details,
+#
+ifeq ("$(origin P)", "command line")
+  KBUILD_CHECKPATCH = $(P)
+endif
+ifndef KBUILD_CHECKPATCH
+  KBUILD_CHECKPATCH = 0
+endif
+
 # Use make M=dir to specify directory of external module to build
 # Old syntax make ... SUBDIRS=$PWD is still supported
 # Setting the environment variable KBUILD_EXTMOD take precedence
@@ -340,7 +354,7 @@ ifeq ($(MAKECMDGOALS),)
 endif
 
 export KBUILD_MODULES KBUILD_BUILTIN
-export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
+export KBUILD_CHECKSRC KBUILD_CHECKPATCH KBUILD_SRC KBUILD_EXTMOD
 
 # We need some generic definitions (do not try to remake the file).
 scripts/Kbuild.include: ;
@@ -363,9 +377,12 @@ DEPMOD		= /sbin/depmod
 PERL		= perl
 PYTHON		= python
 CHECK		= sparse
+CHECKP		= scripts/checkpatch.pl
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void $(CF)
+CHECKPFLAGS    := --quiet --show-types --emacs \
+		  --ignore-cfg checkpatch.cfg --file $(PF)
 NOSTDINC_FLAGS  =
 CFLAGS_MODULE   =
 AFLAGS_MODULE   =
@@ -419,6 +436,7 @@ export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
 export MAKE AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
+export CHECKP CHECKPFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE CFLAGS_GCOV CFLAGS_KCOV CFLAGS_KASAN CFLAGS_UBSAN
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index bb831d4..cfc540a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -109,6 +109,17 @@ ifneq ($(KBUILD_CHECKSRC),0)
   endif
 endif
 
+# Run per-directory/per-file specific checkpatch testing:
+ifneq ($(KBUILD_CHECKPATCH),0)
+  ifeq ($(KBUILD_CHECKPATCH),2)
+    quiet_cmd_force_checkpatch = CHECKP   $<
+          cmd_force_checkpatch = $(srctree)/$(CHECKP) $(POPTS) $< $(CHECKPFLAGS) ;
+  else
+      quiet_cmd_checkpatch     = CHECKP   $<
+            cmd_checkpatch     = $(srctree)/$(CHECKP) $(POPTS) $< $(CHECKPFLAGS) ;
+  endif
+endif
+
 # Do section mismatch analysis for each module/built-in.o
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
   cmd_secanalysis = ; scripts/mod/modpost $@
@@ -290,6 +301,7 @@ objtool_dep = $(objtool_obj)					\
 
 define rule_cc_o_c
 	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \
+	$(call echo-cmd,checkpatch) $(cmd_checkpatch)			  \
 	$(call cmd_and_fixdep,cc_o_c)					  \
 	$(cmd_modversions_c)						  \
 	$(call echo-cmd,objtool) $(cmd_objtool)				  \
@@ -312,6 +324,7 @@ endif
 # Built-in and composite module parts
 $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
+	$(call cmd,force_checkpatch)
 	$(call if_changed_rule,cc_o_c)
 
 # Single-part modules are special since we need to mark them in $(MODVERDIR)
-- 
git-series 0.9.1
