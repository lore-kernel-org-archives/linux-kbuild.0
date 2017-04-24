Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f50.google.com ([74.125.83.50]:33814 "EHLO
        mail-pg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S977304AbdDXUFT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 16:05:19 -0400
Received: by mail-pg0-f50.google.com with SMTP id v1so6420959pgv.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2017 13:05:19 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4] kbuild: Add support to generate LLVM assembly files
Date: Mon, 24 Apr 2017 13:04:58 -0700
Message-Id: <20170424200458.74416-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, =?UTF-8?q?Vin=C3=ADcius=20Tinti?= <viniciustinti@gmail.com>, Behan Webster <behanw@converseincode.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Matthias Kaehlcke <mka@chromium.org>

Add rules to kbuild in order to generate LLVM assembly files with the .ll
extension when using clang.

  # from c code
  make CC=clang kernel/pid.ll

From: Vinícius Tinti <viniciustinti@gmail.com>
Signed-off-by: Vinícius Tinti <viniciustinti@gmail.com>
Signed-off-by: Behan Webster <behanw@converseincode.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v4:
- changed 'bitcode' to 'assembly'
- removed rule for creating LLVM assembly from machine assembly
- added .ll files to clean rule
- corrected example command in commit message

 .gitignore             | 1 +
 Makefile               | 5 +++++
 scripts/Makefile.build | 8 ++++++++
 3 files changed, 14 insertions(+)

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
index e11989d36c87..1cf775d7c510 100644
--- a/Makefile
+++ b/Makefile
@@ -1361,6 +1361,8 @@ help:
 	@echo  '                    (default: $$(INSTALL_MOD_PATH)/lib/firmware)'
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
+	@echo  '  dir/file.ll     - Build the LLVM assembly file'
+	@echo  '                    (requires compiler support for LLVM assembly generation)'
 	@echo  '  dir/file.lst    - Build specified mixed source/assembly target only'
 	@echo  '                    (requires a recent binutils and recent build (System.map))'
 	@echo  '  dir/file.ko     - Build module including final link'
@@ -1545,6 +1547,7 @@ clean: $(clean-dirs)
 		-o -name '*.symtypes' -o -name 'modules.order' \
 		-o -name modules.builtin -o -name '.tmp_*.o.*' \
 		-o -name '*.c.[012]*.*' \
+		-o -name '*.ll' \
 		-o -name '*.gcno' \) -type f -print | xargs rm -f
 
 # Generate tags for editors
@@ -1648,6 +1651,8 @@ endif
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 %.symtypes: %.c prepare scripts FORCE
 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
+%.ll: %.c prepare scripts FORCE
+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
 
 # Modules
 /: prepare scripts FORCE
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d883116ebaa4..e5f1425c601f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -177,6 +177,14 @@ cmd_cc_symtypes_c =                                                         \
 $(obj)/%.symtypes : $(src)/%.c FORCE
 	$(call cmd,cc_symtypes_c)
 
+# LLVM assembly
+# Generate .ll files from .c
+quiet_cmd_cc_ll_c = CC $(quiet_modtag)  $@
+      cmd_cc_ll_c = $(CC) $(c_flags) -emit-llvm -S -o $@ $<
+
+$(obj)/%.ll: $(src)/%.c FORCE
+	$(call if_changed_dep,cc_ll_c)
+
 # C (.c) files
 # The C file is compiled and updated dependency information is generated.
 # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
-- 
2.12.2.816.g2cccc81164-goog

