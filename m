Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:56289 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752108AbdKGRiz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 12:38:55 -0500
Received: by mail-pf0-f194.google.com with SMTP id 17so10829149pfn.12
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 09:38:55 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 3/3] Makefile: Introduce CONFIG_CC_STACKPROTECTOR_AUTO
Date: Tue,  7 Nov 2017 09:38:40 -0800
Message-Id: <1510076320-69931-4-git-send-email-keescook@chromium.org>
In-Reply-To: <1510076320-69931-1-git-send-email-keescook@chromium.org>
References: <1510076320-69931-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Josh Triplett <josh@joshtriplett.org>, linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Laura Abbott <labbott@redhat.com>, linux-kernel@vger.kernel.org

Nearly all modern compilers support a stack-protector option, and nearly
all modern distributions enable the kernel stack-protector, so enabling
this by default in kernel builds would make sense. However, Kconfig does
not have knowledge of available compiler features, so it isn't safe to
force on, as this would unconditionally break builds for the compilers
or architectures that don't have support. Instead, this introduces a new
option, CONFIG_CC_STACKPROTECTOR_AUTO, which attempts to discover the best
possible stack-protector available, and will allow builds to proceed even
if the compiler doesn't support any stack-protector.

This option is made the default so that kernels built with modern
compilers will be protected-by-default against stack buffer overflows,
avoiding things like the recent BlueBorne attack. Selection of a specific
stack-protector option remains available, including disabling it.

Additionally, tiny.config is adjusted to use CC_STACKPROTECTOR_NONE,
since that's the option with the least code size (and it used to be the
default, so we have to explicitly choose it there now).

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                   | 37 ++++++++++++++++++++++++++++++++++---
 arch/Kconfig               |  8 +++++++-
 kernel/configs/tiny.config |  4 ++++
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index b486c0271866..a1e8dd1ab236 100644
--- a/Makefile
+++ b/Makefile
@@ -676,6 +676,10 @@ endif
 # This selects the stack protector compiler flag. Testing it is delayed
 # until after .config has been reprocessed, in the prepare-compiler-check
 # target.
+ifdef CONFIG_CC_STACKPROTECTOR_AUTO
+  stackp-flag := $(call cc-option,-fstack-protector-strong,$(call cc-option,-fstack-protector))
+  stackp-name := AUTO
+else
 ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
   stackp-flag := -fstack-protector
   stackp-name := REGULAR
@@ -684,12 +688,18 @@ ifdef CONFIG_CC_STACKPROTECTOR_STRONG
   stackp-flag := -fstack-protector-strong
   stackp-name := STRONG
 else
+  # If either there is no stack protector for this architecture or
+  # CONFIG_CC_STACKPROTECTOR_NONE is selected, we're done, and $(stackp-name)
+  # is empty, skipping all remaining stack protector tests.
+  #
   # Force off for distro compilers that enable stack protector by default.
-  stackp-flag := $(call cc-option, -fno-stack-protector)
+  KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
+endif
 endif
 endif
 # Find arch-specific stack protector compiler sanity-checking script.
 ifdef stackp-name
+ifneq ($(stackp-flag),)
   stackp-path := $(srctree)/scripts/gcc-$(SRCARCH)_$(BITS)-has-stack-protector.sh
   stackp-check := $(wildcard $(stackp-path))
   # If the wildcard test matches a test script, run it to check functionality.
@@ -701,9 +711,17 @@ ifdef stackp-name
   ifndef stackp-broken
     # If the stack protector is functional, enable code that depends on it.
     KBUILD_CPPFLAGS += -DCONFIG_CC_STACKPROTECTOR
+    # Either we've already detected the flag (for AUTO) or we'll fail the
+    # build in the prepare-compiler-check rule (for specific flag).
+    KBUILD_CFLAGS += $(stackp-flag)
+  else
+    # We have to make sure stack protector is unconditionally disabled if
+    # the compiler is broken (in case we're going to continue the build in
+    # AUTO mode).
+    KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
   endif
 endif
-KBUILD_CFLAGS += $(stackp-flag)
+endif
 
 ifeq ($(cc-name),clang)
 ifneq ($(CROSS_COMPILE),)
@@ -1091,15 +1109,28 @@ PHONY += prepare-compiler-check
 prepare-compiler-check: FORCE
 # Make sure compiler supports requested stack protector flag.
 ifdef stackp-name
+  # Warn about CONFIG_CC_STACKPROTECTOR_AUTO having found no option.
+  ifeq ($(stackp-flag),)
+	@echo CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
+		  Compiler does not support any known stack-protector >&2
+  else
+  # Fail if specifically requested stack protector is missing.
   ifeq ($(call cc-option, $(stackp-flag)),)
 	@echo Cannot use CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
 		  $(stackp-flag) not supported by compiler >&2 && exit 1
   endif
+  endif
 endif
-# Make sure compiler does not have buggy stack-protector support.
+# Make sure compiler does not have buggy stack-protector support. If a
+# specific stack-protector was requested, fail the build, otherwise warn.
 ifdef stackp-broken
+  ifeq ($(stackp-name),AUTO)
+	@echo CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
+                  $(stackp-flag) available but compiler is broken: disabling >&2
+  else
 	@echo Cannot use CONFIG_CC_STACKPROTECTOR_$(stackp-name): \
                   $(stackp-flag) available but compiler is broken >&2 && exit 1
+  endif
 endif
 	@:
 
diff --git a/arch/Kconfig b/arch/Kconfig
index 7007c1bfa79c..cd2676ff5d5d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -526,7 +526,7 @@ config HAVE_CC_STACKPROTECTOR
 choice
 	prompt "Stack Protector buffer overflow detection"
 	depends on HAVE_CC_STACKPROTECTOR
-	default CC_STACKPROTECTOR_NONE
+	default CC_STACKPROTECTOR_AUTO
 	help
 	  This option turns on the "stack-protector" GCC feature. This
 	  feature puts, at the beginning of functions, a canary value on
@@ -573,6 +573,12 @@ config CC_STACKPROTECTOR_STRONG
 	  about 20% of all kernel functions, which increases the kernel code
 	  size by about 2%.
 
+config CC_STACKPROTECTOR_AUTO
+	bool "Automatic"
+	help
+	  If the compiler supports it, the best available stack-protector
+	  option will be chosen.
+
 endchoice
 
 config THIN_ARCHIVES
diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 7fa0c4ae6394..9bfdffc100da 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -10,3 +10,7 @@ CONFIG_OPTIMIZE_INLINING=y
 # CONFIG_SLAB is not set
 # CONFIG_SLUB is not set
 CONFIG_SLOB=y
+CONFIG_CC_STACKPROTECTOR_NONE=y
+# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
+# CONFIG_CC_STACKPROTECTOR_STRONG is not set
+# CONFIG_CC_STACKPROTECTOR_AUTO is not set
-- 
2.7.4

