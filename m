Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:30112 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754580AbeGJBgn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 21:36:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] objtool: move libelf detection to Kconfig from Makefile
Date: Tue, 10 Jul 2018 10:35:16 +0900
Message-Id: <1531186516-15764-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

Currently, users are allowed to enable STACK_VALIDATION regardless
of the compiler capability.  The top-level Makefile warns or breaks
the build if it turns out that the host compiler cannot link libelf.

Move the libelf test to Kconfig so that users can enable the feature
only when the host compiler can build the objtool.  The ugly check
in the Makefile will go away.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
---

Changes in v2:
  - Move package information to help of STACK_VALIDATION

 Makefile               | 14 +-------------
 arch/x86/Kconfig       |  2 +-
 arch/x86/Kconfig.debug |  2 +-
 lib/Kconfig.debug      |  6 +++++-
 scripts/Makefile.build |  2 --
 5 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 925c55f..65befa0 100644
--- a/Makefile
+++ b/Makefile
@@ -927,19 +927,7 @@ endif
 export mod_sign_cmd
 
 ifdef CONFIG_STACK_VALIDATION
-  has_libelf := $(call try-run,\
-		echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -,1,0)
-  ifeq ($(has_libelf),1)
-    objtool_target := tools/objtool FORCE
-  else
-    ifdef CONFIG_UNWINDER_ORC
-      $(error "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    else
-      $(warning "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev, libelf-devel or elfutils-libelf-devel")
-    endif
-    SKIP_STACK_VALIDATION := 1
-    export SKIP_STACK_VALIDATION
-  endif
+    objtool_target := tools/objtool
 endif
 
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f1dbb4e..c1ded99 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -434,7 +434,7 @@ config GOLDFISH
 config RETPOLINE
 	bool "Avoid speculative indirect branches in kernel"
 	default y
-	select STACK_VALIDATION if HAVE_STACK_VALIDATION
+	imply STACK_VALIDATION
 	help
 	  Compile kernel with the retpoline compiler options to guard against
 	  kernel-to-user data leaks by avoiding speculative indirect
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index c6dd1d9..4713b3c 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -364,7 +364,7 @@ choice
 config UNWINDER_ORC
 	bool "ORC unwinder"
 	depends on X86_64
-	select STACK_VALIDATION
+	depends on STACK_VALIDATION
 	---help---
 	  This option enables the ORC (Oops Rewind Capability) unwinder for
 	  unwinding kernel stack traces.  It uses a custom data format which is
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8838d11..f4d48af 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -364,7 +364,7 @@ config FRAME_POINTER
 config STACK_VALIDATION
 	bool "Compile-time stack metadata validation"
 	depends on HAVE_STACK_VALIDATION
-	default n
+	depends on $(success,echo "int main() {}" | $(HOSTCC) -xc -o /dev/null -lelf -)
 	help
 	  Add compile-time checks to validate stack metadata, including frame
 	  pointers (if CONFIG_FRAME_POINTER is enabled).  This helps ensure
@@ -373,6 +373,10 @@ config STACK_VALIDATION
 	  This is also a prerequisite for generation of ORC unwind data, which
 	  is needed for CONFIG_UNWINDER_ORC.
 
+	  To enable this, the host compiler needs to be able to link libelf.
+	  If it is missing on your system, please install libelf-dev,
+	  libelf-devel or elfutils-libelf-devel.
+
 	  For more information, see
 	  tools/objtool/Documentation/stack-validation.txt.
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index e7889f4..154205b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -243,7 +243,6 @@ endif # -record-mcount
 endif # CONFIG_FTRACE_MCOUNT_RECORD
 
 ifdef CONFIG_STACK_VALIDATION
-ifneq ($(SKIP_STACK_VALIDATION),1)
 
 __objtool_obj := $(objtree)/tools/objtool/objtool
 
@@ -282,7 +281,6 @@ objtool_obj = $(if $(patsubst y%,, \
 	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
 	$(__objtool_obj))
 
-endif # SKIP_STACK_VALIDATION
 endif # CONFIG_STACK_VALIDATION
 
 # Rebuild all objects when objtool changes, or is enabled/disabled.
-- 
2.7.4

