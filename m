Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:34914 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750830AbdFORmv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 13:42:51 -0400
Received: by mail-pg0-f54.google.com with SMTP id k71so9599977pgd.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2017 10:42:51 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/3] kbuild: Add __cc-option macro
Date: Thu, 15 Jun 2017 10:37:13 -0700
Message-Id: <20170615173715.40882-2-mka@chromium.org>
In-Reply-To: <20170615173715.40882-1-mka@chromium.org>
References: <20170615173715.40882-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

cc-option uses KBUILD_CFLAGS and KBUILD_CPPFLAGS when it determines
whether an option is supported or not. This is fine for options used to
build the kernel itself, however some components like the x86 boot code
use a different set of flags.

Add the new macro __cc-option which is a more generic version of
cc-option with additional parameters. One parameter is the compiler
with which the check should be performed, the other the compiler options
to be used instead KBUILD_C*FLAGS.

Refactor cc-option and hostcc-option to use __cc-option and move
hostcc-option to scripts/Kbuild.include.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- Changed the name of the new macro to __cc-option
- Removed existing hostcc-option macro from scripts/Makefile.host
- Added HOST_EXTRACFLAGS to hostcc-option
- Updated commit message

 Makefile               |  2 +-
 scripts/Kbuild.include | 14 ++++++++++++--
 scripts/Makefile.host  |  6 ------
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 83f6d9972cab..b234bba6d652 100644
--- a/Makefile
+++ b/Makefile
@@ -303,7 +303,7 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
+HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
 HOSTCXXFLAGS = -O2
 
 ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 61f87a99bf0a..5001bf9b6579 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -108,6 +108,11 @@ as-option = $(call try-run,\
 as-instr = $(call try-run,\
 	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
 
+# __cc-option
+# Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
+__cc-option = $(call try-run,\
+	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
 CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
@@ -115,8 +120,13 @@ CC_OPTION_CFLAGS = $(filter-out $(GCC_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 # cc-option
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
 
-cc-option = $(call try-run,\
-	$(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+cc-option = $(call __cc-option, $(CC), $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS),\
+	$(1), $(2))
+
+# hostcc-option
+# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
+hostcc-option = $(call __cc-option, $(HOSTCC),\
+	$(HOSTCFLAGS) $(HOST_EXTRACFLAGS), $(1), $(2))
 
 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 45b5b1aaedbd..9cfd5c84d76f 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -20,12 +20,6 @@
 # Will compile qconf as a C++ program, and menu as a C program.
 # They are linked as C++ code to the executable qconf
 
-# hostcc-option
-# Usage: cflags-y += $(call hostcc-option,-march=winchip-c6,-march=i586)
-
-hostcc-option = $(call try-run,\
-	$(HOSTCC) $(HOSTCFLAGS) $(HOST_EXTRACFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
-
 __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 host-cshlib := $(sort $(hostlibs-y) $(hostlibs-m))
 host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
-- 
2.13.1.518.g3df882009-goog

