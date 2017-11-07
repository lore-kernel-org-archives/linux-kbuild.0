Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:49407 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752251AbdKGRi4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Nov 2017 12:38:56 -0500
Received: by mail-pf0-f195.google.com with SMTP id i5so10835112pfe.6
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Nov 2017 09:38:56 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2 2/3] Makefile: Move stack-protector availability out of Kconfig
Date: Tue,  7 Nov 2017 09:38:39 -0800
Message-Id: <1510076320-69931-3-git-send-email-keescook@chromium.org>
In-Reply-To: <1510076320-69931-1-git-send-email-keescook@chromium.org>
References: <1510076320-69931-1-git-send-email-keescook@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Laura Abbott <labbott@redhat.com>, linux-kernel@vger.kernel.org

Various portions of the kernel, especially per-architecture pieces,
need to know if the compiler is building with the stack protector.
This was done in the arch/Kconfig with 'select', but this doesn't
allow a way to do auto-detected compiler support. In preparation for
creating an on-if-available default, move the logic for the definition of
CONFIG_CC_STACKPROTECTOR into the Makefile.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile         | 6 +++++-
 arch/Kconfig     | 8 --------
 arch/x86/Kconfig | 2 +-
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index caa3f7e6f524..b486c0271866 100644
--- a/Makefile
+++ b/Makefile
@@ -689,7 +689,7 @@ else
 endif
 endif
 # Find arch-specific stack protector compiler sanity-checking script.
-ifdef CONFIG_CC_STACKPROTECTOR
+ifdef stackp-name
   stackp-path := $(srctree)/scripts/gcc-$(SRCARCH)_$(BITS)-has-stack-protector.sh
   stackp-check := $(wildcard $(stackp-path))
   # If the wildcard test matches a test script, run it to check functionality.
@@ -698,6 +698,10 @@ ifdef CONFIG_CC_STACKPROTECTOR
       stackp-broken := y
     endif
   endif
+  ifndef stackp-broken
+    # If the stack protector is functional, enable code that depends on it.
+    KBUILD_CPPFLAGS += -DCONFIG_CC_STACKPROTECTOR
+  endif
 endif
 KBUILD_CFLAGS += $(stackp-flag)
 
diff --git a/arch/Kconfig b/arch/Kconfig
index 1aafb4efbb51..7007c1bfa79c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -523,12 +523,6 @@ config HAVE_CC_STACKPROTECTOR
 	  - its compiler supports the -fstack-protector option
 	  - it has implemented a stack canary (e.g. __stack_chk_guard)
 
-config CC_STACKPROTECTOR
-	def_bool n
-	help
-	  Set when a stack-protector mode is enabled, so that the build
-	  can enable kernel-side support for the GCC feature.
-
 choice
 	prompt "Stack Protector buffer overflow detection"
 	depends on HAVE_CC_STACKPROTECTOR
@@ -549,7 +543,6 @@ config CC_STACKPROTECTOR_NONE
 
 config CC_STACKPROTECTOR_REGULAR
 	bool "Regular"
-	select CC_STACKPROTECTOR
 	help
 	  Functions will have the stack-protector canary logic added if they
 	  have an 8-byte or larger character array on the stack.
@@ -563,7 +556,6 @@ config CC_STACKPROTECTOR_REGULAR
 
 config CC_STACKPROTECTOR_STRONG
 	bool "Strong"
-	select CC_STACKPROTECTOR
 	help
 	  Functions will have the stack-protector canary logic added in any
 	  of the following conditions:
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 971feac13506..8d3847071707 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -319,7 +319,7 @@ config X86_64_SMP
 
 config X86_32_LAZY_GS
 	def_bool y
-	depends on X86_32 && !CC_STACKPROTECTOR
+	depends on X86_32 && CC_STACKPROTECTOR_NONE
 
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
-- 
2.7.4

