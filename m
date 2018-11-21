Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:51970 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387912AbeKVJsj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Nov 2018 04:48:39 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: fix single target build for external module
Date: Thu, 22 Nov 2018 08:11:54 +0900
Message-Id: <1542841915-19686-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Building a single target in an external module fails due to missing
.tmp_versions directory.

For example,

  $ make -C /lib/modules/$(uname -r)/build M=$PWD foo.o

will fail in the following way:

  CC [M]  /home/masahiro/foo/foo.o
/bin/sh: 1: cannot create /home/masahiro/foo/.tmp_versions/foo.mod: Directory nonexistent

This is because $(cmd_crmodverdir) is executed only for /, %/, %.ko
single targets for external modules. Create .tmp_versions in the
'prepare' target.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index d5da1df..36f3f0e 100644
--- a/Makefile
+++ b/Makefile
@@ -1554,9 +1554,6 @@ else # KBUILD_EXTMOD
 
 # We are always building modules
 KBUILD_MODULES := 1
-PHONY += crmodverdir
-crmodverdir:
-	$(cmd_crmodverdir)
 
 PHONY += $(objtree)/Module.symvers
 $(objtree)/Module.symvers:
@@ -1568,7 +1565,7 @@ $(objtree)/Module.symvers:
 
 module-dirs := $(addprefix _module_,$(KBUILD_EXTMOD))
 PHONY += $(module-dirs) modules
-$(module-dirs): crmodverdir $(objtree)/Module.symvers
+$(module-dirs): prepare $(objtree)/Module.symvers
 	$(Q)$(MAKE) $(build)=$(patsubst _module_%,%,$@)
 
 modules: $(module-dirs)
@@ -1609,7 +1606,8 @@ help:
 
 # Dummies...
 PHONY += prepare scripts
-prepare: ;
+prepare:
+	$(cmd_crmodverdir)
 scripts: ;
 endif # KBUILD_EXTMOD
 
@@ -1733,17 +1731,14 @@ endif
 
 # Modules
 /: prepare scripts FORCE
-	$(cmd_crmodverdir)
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
 	$(build)=$(build-dir)
 # Make sure the latest headers are built for Documentation
 Documentation/ samples/: headers_install
 %/: prepare scripts FORCE
-	$(cmd_crmodverdir)
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
 	$(build)=$(build-dir)
 %.ko: prepare scripts FORCE
-	$(cmd_crmodverdir)
 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1)   \
 	$(build)=$(build-dir) $(@:.ko=.o)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-- 
2.7.4
