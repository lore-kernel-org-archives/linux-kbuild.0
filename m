Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:26623 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbdEPEgG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 May 2017 00:36:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: skip header install/check for right under uapi directories
Date: Tue, 16 May 2017 13:35:30 +0900
Message-Id: <1494909330-24127-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Since commit 61562f981e92 ("uapi: export all arch specifics
directories"), "make INSTALL_HDR_PATH=${root}/usr headers_install"
deletes standard glibc headers and others in ${root}/usr/include.

The cause of the issue is that headers_install now starts descending
from arch/$(hdr-arch)/include/uapi with ${root}/usr/include for its
destination when installing asm headers.  So, headers already there
are assumed to be unwanted.

When headers_install starts descending from include/uapi with
${root}/usr/include for its destination, it works around the problem
by creating an dummy destination ${root}/usr/include/uapi, but this
is tricky.

To fix the problem in a clean way is to skip header install/check in
include/uapi or arch/$(hdr-arch)/include/uapi.  A good side-effect
is the empty destination ${root}/usr/include/uapi will go away.

Fixes: 61562f981e92 ("uapi: export all arch specifics directories")
Reported-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.headersinst | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
index 6ba97a1..ce753a4 100644
--- a/scripts/Makefile.headersinst
+++ b/scripts/Makefile.headersinst
@@ -8,6 +8,29 @@
 #
 # ==========================================================================
 
+PHONY := __headers
+__headers:
+
+include scripts/Kbuild.include
+
+srcdir        := $(srctree)/$(obj)
+subdirs       := $(patsubst $(srcdir)/%/.,%,$(wildcard $(srcdir)/*/.))
+# caller may set destination dir (when installing to asm/)
+_dst          := $(if $(dst),$(dst),$(obj))
+
+# Recursion
+__headers: $(subdirs)
+
+.PHONY: $(subdirs)
+$(subdirs):
+	$(Q)$(MAKE) $(hdr-inst)=$(obj)/$@ dst=$(_dst)/$@
+
+# Skip header install/check for include/uapi and arch/$(hdr-arch)/include/uapi.
+# We have only sub-directories there.
+skip-inst := $(if $(filter %/uapi,$(obj)),1)
+
+ifeq ($(skip-inst),)
+
 # generated header directory
 gen := $(if $(gen),$(gen),$(subst include/,include/generated/,$(obj)))
 
@@ -15,21 +38,14 @@ gen := $(if $(gen),$(gen),$(subst include/,include/generated/,$(obj)))
 kbuild-file := $(srctree)/$(obj)/Kbuild
 -include $(kbuild-file)
 
-# called may set destination dir (when installing to asm/)
-_dst := $(if $(dst),$(dst),$(obj))
-
 old-kbuild-file := $(srctree)/$(subst uapi/,,$(obj))/Kbuild
 ifneq ($(wildcard $(old-kbuild-file)),)
 include $(old-kbuild-file)
 endif
 
-include scripts/Kbuild.include
-
 installdir    := $(INSTALL_HDR_PATH)/$(subst uapi/,,$(_dst))
 
-srcdir        := $(srctree)/$(obj)
 gendir        := $(objtree)/$(gen)
-subdirs       := $(patsubst $(srcdir)/%/.,%,$(wildcard $(srcdir)/*/.))
 header-files  := $(notdir $(wildcard $(srcdir)/*.h))
 header-files  += $(notdir $(wildcard $(srcdir)/*.agh))
 header-files  := $(filter-out $(no-export-headers), $(header-files))
@@ -88,11 +104,9 @@ quiet_cmd_check = CHECK   $(printdir) ($(words $(all-files)) files)
                   $(PERL) $< $(INSTALL_HDR_PATH)/include $(SRCARCH); \
 	          touch $@
 
-PHONY += __headersinst __headerscheck
-
 ifndef HDRCHECK
 # Rules for installing headers
-__headersinst: $(subdirs) $(install-file)
+__headers: $(install-file)
 	@:
 
 targets += $(install-file)
@@ -104,7 +118,7 @@ $(install-file): scripts/headers_install.sh \
 	$(call if_changed,install)
 
 else
-__headerscheck: $(subdirs) $(check-file)
+__headers: $(check-file)
 	@:
 
 targets += $(check-file)
@@ -113,11 +127,6 @@ $(check-file): scripts/headers_check.pl $(output-files) FORCE
 
 endif
 
-# Recursion
-.PHONY: $(subdirs)
-$(subdirs):
-	$(Q)$(MAKE) $(hdr-inst)=$(obj)/$@ dst=$(_dst)/$@
-
 targets := $(wildcard $(sort $(targets)))
 cmd_files := $(wildcard \
              $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))
@@ -126,6 +135,8 @@ ifneq ($(cmd_files),)
 	include $(cmd_files)
 endif
 
+endif # skip-inst
+
 .PHONY: $(PHONY)
 PHONY += FORCE
 FORCE: ;
-- 
2.7.4

