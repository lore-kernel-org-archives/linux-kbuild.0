Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:35304 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754925AbdDDR1d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Apr 2017 13:27:33 -0400
Received: by mail-pg0-f51.google.com with SMTP id 81so158884543pgh.2
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Apr 2017 10:27:33 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3] kbuild: Add support to generate LLVM bitcode files
Date: Tue,  4 Apr 2017 10:27:06 -0700
Message-Id: <20170404172706.171971-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>, Behan Webster <behanw@converseincode.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, Kyeongmin Cho <korea.drzix@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Peter Foley <pefoley2@pefoley.com>, Matthias Kaehlcke <mka@chromium.org>

From: Vinícius Tinti <viniciustinti@gmail.com>

Add rules to kbuild in order to generate LLVM bitcode files with the .ll
extension when using clang.

  # from c code
  CC=clang make kernel/pid.ll

  # from asm code
  CC=clang make arch/x86/kernel/preempt.ll

From: Vinícius Tinti <viniciustinti@gmail.com>
Signed-off-by: Vinícius Tinti <viniciustinti@gmail.com>
Signed-off-by: Behan Webster <behanw@converseincode.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Resending, original v3 patch: https://patchwork.kernel.org/patch/4891071/

 .gitignore             |  1 +
 Makefile               |  6 ++++++
 scripts/Makefile.build | 14 ++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/.gitignore b/.gitignore
index c2ed4ecb0acd..0c39aa20b6ba 100644
--- a/.gitignore
+++ b/.gitignore
@@ -33,6 +33,7 @@
 *.lzo
 *.patch
 *.gcno
+*.ll
 modules.builtin
 Module.symvers
 *.dwo
diff --git a/Makefile b/Makefile
index e11989d36c87..d998ce363335 100644
--- a/Makefile
+++ b/Makefile
@@ -1361,6 +1361,8 @@ help:
 	@echo  '                    (default: $$(INSTALL_MOD_PATH)/lib/firmware)'
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
+	@echo  '  dir/file.ll     - Build the LLVM bitcode file'
+	@echo  '                    (requires compiler support for LLVM bitcode generation)'
 	@echo  '  dir/file.lst    - Build specified mixed source/assembly target only'
 	@echo  '                    (requires a recent binutils and recent build (System.map))'
 	@echo  '  dir/file.ko     - Build module including final link'
@@ -1648,6 +1650,10 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.symtypes: %.c prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%.ll: %.c prepare scripts FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%.ll: %.S prepare scripts FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
 /: prepare scripts FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d883116ebaa4..e5a28da2e6fa 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -177,6 +177,20 @@ cmd_cc_symtypes_c =                                                         \
 $(obj)/%.symtypes : $(src)/%.c FORCE
 	$(call cmd,cc_symtypes_c)
 
+# LLVM bitcode
+# Generate .ll files from .s and .c
+quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
+      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
+
+$(obj)/%.ll: $(src)/%.c FORCE
+	$(call if_changed_dep,cc_ll_c)
+
+quiet_cmd_as_ll_S = CPP $(quiet_modtag) $@
+      cmd_as_ll_S = $(CPP) $(a_flags)   -o $@ $<
+
+$(obj)/%.ll: $(src)/%.S FORCE
+	$(call if_changed_dep,as_ll_S)
+
 # C (.c) files
 # The C file is compiled and updated dependency information is generated.
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
-- 
2.12.2.715.g7642488e1d-goog

