Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:38852 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbeK2OFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Nov 2018 09:05:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: fix UML build error with CONFIG_GCC_PLUGINS
Date: Thu, 29 Nov 2018 11:58:50 +0900
Message-Id: <1543460330-2219-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Emese Revfy <re.emese@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Michal Marek <michal.lkml@markovi.net>, Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>, Jeff Dike <jdike@addtoit.com>

UML fails to build with CONFIG_GCC_PLUGINS=y.

$ make -s ARCH=um mrproper
$ make -s ARCH=um allmodconfig
$ make ARCH=um
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/asm/dma-contiguous.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/export.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/mm-arch-hooks.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  HOSTCC  scripts/unifdef
  CC      arch/x86/um/user-offsets.s
cc1: error: cannot load plugin ./scripts/gcc-plugins/cyc_complexity_plugin.so
./scripts/gcc-plugins/cyc_complexity_plugin.so: cannot open shared object file: No such file or directory
cc1: error: cannot load plugin ./scripts/gcc-plugins/structleak_plugin.so
./scripts/gcc-plugins/structleak_plugin.so: cannot open shared object file: No such file or directory
cc1: error: cannot load plugin ./scripts/gcc-plugins/latent_entropy_plugin.so
./scripts/gcc-plugins/latent_entropy_plugin.so: cannot open shared object file: No such file or directory
cc1: error: cannot load plugin ./scripts/gcc-plugins/randomize_layout_plugin.so
./scripts/gcc-plugins/randomize_layout_plugin.so: cannot open shared object file: No such file or directory
make[1]: *** [scripts/Makefile.build;119: arch/x86/um/user-offsets.s] Error 1
make: *** [arch/um/Makefile;152: arch/x86/um/user-offsets.s] Error 2

Change the order of the preparation stage (with cleanups) to make sure
gcc-plugins is built before descending to arch/x86/um/.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 6b90bd4ba40b ("GCC plugin infrastructure")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will pick up this to kbuild tree to avoid conflicts.
Ack from UML people is appreciated, though.


 Makefile             |  4 ++--
 arch/um/Makefile     | 24 ++----------------------
 arch/x86/um/Makefile |  4 +++-
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/Makefile b/Makefile
index 0ce4e29..a066dab 100644
--- a/Makefile
+++ b/Makefile
@@ -1106,9 +1106,9 @@ prepare1: prepare2 $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 macroprepare: prepare1 archmacros
 
-archprepare: archheaders archscripts macroprepare scripts_basic
+archprepare: archheaders archscripts macroprepare scripts_basic gcc-plugins
 
-prepare0: archprepare gcc-plugins
+prepare0: archprepare
 	$(Q)$(MAKE) $(build)=.
 
 # All the preparing..
diff --git a/arch/um/Makefile b/arch/um/Makefile
index ab1066c..c080359 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -116,7 +116,8 @@ endef
 archheaders:
 	$(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) asm-generic archheaders
 
-archprepare: include/generated/user_constants.h
+archprepare:
+	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
 
 LINK-$(CONFIG_LD_SCRIPT_STATIC) += -static
 LINK-$(CONFIG_LD_SCRIPT_DYN) += -Wl,-rpath,/lib $(call cc-option, -no-pie)
@@ -146,25 +147,4 @@ archclean:
 	@find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
 		-o -name '*.gcov' \) -type f -print | xargs rm -f
 
-# Generated files
-
-$(HOST_DIR)/um/user-offsets.s: __headers FORCE
-	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um $@
-
-define filechk_gen-asm-offsets
-        (set -e; \
-         echo "/*"; \
-         echo " * DO NOT MODIFY."; \
-         echo " *"; \
-         echo " * This file was generated by arch/$(ARCH)/Makefile"; \
-         echo " *"; \
-         echo " */"; \
-         echo ""; \
-         sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}" < $<; \
-         echo ""; )
-endef
-
-include/generated/user_constants.h: $(HOST_DIR)/um/user-offsets.s
-	$(call filechk,gen-asm-offsets)
-
 export HEADER_ARCH SUBARCH USER_CFLAGS CFLAGS_NO_HARDENING OS DEV_NULL_PATH
diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
index c2d3d7c..1792464 100644
--- a/arch/x86/um/Makefile
+++ b/arch/x86/um/Makefile
@@ -36,10 +36,12 @@ subarch-$(CONFIG_MODULES) += ../kernel/module.o
 
 USER_OBJS := bugs_$(BITS).o ptrace_user.o fault.o
 
-extra-y += user-offsets.s
 $(obj)/user-offsets.s: c_flags = -Wp,-MD,$(depfile) $(USER_CFLAGS) \
 	-Iarch/x86/include/generated
 
+include/generated/user_constants.h: $(obj)/user-offsets.s
+	$(call filechk,offsets,__USER_CONSTANT_H__)
+
 UNPROFILE_OBJS := stub_segv.o
 CFLAGS_stub_segv.o := $(CFLAGS_NO_HARDENING)
 
-- 
2.7.4
