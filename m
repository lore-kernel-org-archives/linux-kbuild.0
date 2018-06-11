Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38120 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753793AbeFKDqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jun 2018 23:46:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH] kbuild: clean-up passing KCOV compiler flags
Date: Mon, 11 Jun 2018 12:45:17 +0900
Message-Id: <1528688717-8500-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Now that the compiler support for KCOV is computed in the Kconfig
phase, expensive $(call cc-option,...) calls no longer exist in
scripts/Makefile.kcov .

It shouldn't hurt to include scripts/Makefile.kcov everytime Kbuild
descends into a sub-directory.  Also, move ugly stuff from Makefile.lib
to Makefile.kcov .

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

My hope is to do likewise for gcov, kasan, ubsan.

gcov, kcov, kasan, ubsan need per-file (or per-directory)
flag addition or removal.

Currently, scripts/Makefile.lib is cluttered to handle this.

If this clean-up is achieved, scripts/Makefile.lib will
look like this:

 ---------------------->8------------------------------
include-$(CONFIG_GCOV_KERNEL) += scripts/Makefile.gcov
include-$(CONFIG_KCOV)        += scripts/Makefile.kcov
include-$(CONFIG_KASAN)       += scripts/Makefile.kasan
include-$(CONFIG_UBSAN)       += scripts/Makefile.ubsan

include $(include-y)
 ---------------------->8------------------------------

I will not apply this until some more cleanups are done (hence, RFC).
At least, scripts/Makefile.kasan is so complicated for now.


 Makefile              | 1 -
 scripts/Makefile.kcov | 8 +++-----
 scripts/Makefile.lib  | 8 +++-----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index 73f0bb2..c99ca82 100644
--- a/Makefile
+++ b/Makefile
@@ -669,7 +669,6 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
 
-include scripts/Makefile.kcov
 include scripts/Makefile.gcc-plugins
 
 ifdef CONFIG_READABLE_ASM
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 3d61c4b..408b776 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,9 +1,7 @@
-ifdef CONFIG_KCOV
-
 kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
-export CFLAGS_KCOV := $(kcov-flags-y)
-
-endif
+_c_flags += $(if $(patsubst n%,, \
+	$(KCOV_INSTRUMENT_$(basetarget).o)$(KCOV_INSTRUMENT)$(CONFIG_KCOV_INSTRUMENT_ALL)), \
+	$(kcov-flags-y))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5af34a2b..f5bd1d3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -126,11 +126,9 @@ _c_flags += $(if $(patsubst n%,, \
 		$(CFLAGS_UBSAN))
 endif
 
-ifeq ($(CONFIG_KCOV),y)
-_c_flags += $(if $(patsubst n%,, \
-	$(KCOV_INSTRUMENT_$(basetarget).o)$(KCOV_INSTRUMENT)$(CONFIG_KCOV_INSTRUMENT_ALL)), \
-	$(CFLAGS_KCOV))
-endif
+include-$(CONFIG_KCOV)		+= scripts/Makefile.kcov
+
+include $(include-y)
 
 # If building the kernel in a separate objtree expand all occurrences
 # of -Idir to -I$(srctree)/dir except for absolute paths (starting with '/').
-- 
2.7.4

