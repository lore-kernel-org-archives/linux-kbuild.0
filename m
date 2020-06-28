Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:50055 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbgF1ByQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 21:54:16 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Date: Sun, 28 Jun 2020 10:50:41 +0900
Message-Id: <20200628015041.1000002-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

CFLAGS_REMOVE_<file>.o works per object, that is, there is no
convenient way to filter out flags for every object in a directory.

Add ccflags-remove-y and asflags-remove-y to make it easily.

Use ccflags-remove-y to clean up some Makefiles.

Suggested-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm/boot/compressed/Makefile | 6 +-----
 arch/powerpc/xmon/Makefile        | 3 +--
 arch/sh/boot/compressed/Makefile  | 5 +----
 kernel/trace/Makefile             | 4 ++--
 lib/Makefile                      | 5 +----
 scripts/Makefile.lib              | 4 ++--
 6 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 00602a6fba04..3d5691b23951 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -103,13 +103,9 @@ clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S hyp-stub.S
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
-ifeq ($(CONFIG_FUNCTION_TRACER),y)
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
-endif
-
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
 	     -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
 asflags-y := -DZIMAGE
 
 # Supply kernel BSS size to the decompressor via a linker symbol.
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index 89c76ca35640..55cbcdd88ac0 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
 # Disable ftrace for the entire directory
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
+ccflags-remove-y += $(CC_FLAGS_FTRACE)
 
 ifdef CONFIG_CC_IS_CLANG
 # clang stores addresses on the stack causing the frame size to blow
diff --git a/arch/sh/boot/compressed/Makefile b/arch/sh/boot/compressed/Makefile
index ad0e2403e56f..589d2d8a573d 100644
--- a/arch/sh/boot/compressed/Makefile
+++ b/arch/sh/boot/compressed/Makefile
@@ -28,10 +28,7 @@ IMAGE_OFFSET	:= $(shell /bin/bash -c 'printf "0x%08x" \
 			$(CONFIG_BOOT_LINK_OFFSET)]')
 endif
 
-ifeq ($(CONFIG_MCOUNT),y)
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst -pg, , $(ORIG_CFLAGS))
-endif
+ccflags-remove-$(CONFIG_MCOUNT) += -pg
 
 LDFLAGS_vmlinux := --oformat $(ld-bfd) -Ttext $(IMAGE_OFFSET) -e startup \
 		   -T $(obj)/../../kernel/vmlinux.lds
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 6575bb0a0434..7492844a8b1b 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -2,9 +2,9 @@
 
 # Do not instrument the tracer itself:
 
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
+
 ifdef CONFIG_FUNCTION_TRACER
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
 
 # Avoid recursion due to instrumentation.
 KCSAN_SANITIZE := n
diff --git a/lib/Makefile b/lib/Makefile
index b1c42c10073b..b2ed4beddd68 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -3,10 +3,7 @@
 # Makefile for some libs needed in the kernel.
 #
 
-ifdef CONFIG_FUNCTION_TRACER
-ORIG_CFLAGS := $(KBUILD_CFLAGS)
-KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
-endif
+ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
 # These files are disabled because they produce lots of non-interesting and/or
 # flaky coverage that is not a function of syscall inputs. For example,
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 99ac59c59826..5da420f13f9b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -113,10 +113,10 @@ modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
 
 orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) \
                  $(ccflags-y) $(CFLAGS_$(target-stem).o)
-_c_flags       = $(filter-out $(CFLAGS_REMOVE_$(target-stem).o), $(orig_c_flags))
+_c_flags       = $(filter-out $(ccflags-remove-y) $(CFLAGS_REMOVE_$(target-stem).o), $(orig_c_flags))
 orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) \
                  $(asflags-y) $(AFLAGS_$(target-stem).o)
-_a_flags       = $(filter-out $(AFLAGS_REMOVE_$(target-stem).o), $(orig_a_flags))
+_a_flags       = $(filter-out $(asflags-remove-y) $(AFLAGS_REMOVE_$(target-stem).o), $(orig_a_flags))
 _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(target-stem).lds)
 
 #
-- 
2.25.1
