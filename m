Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:65474 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751286AbdDNGSR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Apr 2017 02:18:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: avoid conflict between -ffunction-sections and -pg on gcc-4.7
Date: Fri, 14 Apr 2017 15:17:26 +0900
Message-Id: <1492150646-20848-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

Arnd Bergmann reported:
  "When ftrace is enabled and we build with gcc-4.7 or older, we
  get a warning for each file on architectures that select
  CONFIG_LD_DEAD_CODE_DATA_ELIMINATION:

  warning: -ffunction-sections disabled; it makes profiling impossible [enabled by default]
  "

Since commit c3f0d0bc5b01 ("kbuild, LLVMLinux: Add -Werror to
cc-option to support clang"), warnings are treated as errors in
cc-option checks.  CC_FLAGS_FTRACE is blindly added to KBUILD_CFLAGS,
so $(call cc-option,-ffunction-sections,) should be moved below it
in order to detect the conflict between the two options.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index efa267a..753e450 100644
--- a/Makefile
+++ b/Makefile
@@ -632,11 +632,6 @@ include arch/$(SRCARCH)/Makefile
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 
-ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
-KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
-KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
-endif
-
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS	+= -Os $(call cc-disable-warning,maybe-uninitialized,)
 else
@@ -773,6 +768,11 @@ ifdef CONFIG_DEBUG_SECTION_MISMATCH
 KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
 endif
 
+ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
+KBUILD_CFLAGS	+= $(call cc-option,-ffunction-sections,)
+KBUILD_CFLAGS	+= $(call cc-option,-fdata-sections,)
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 CHECKFLAGS     += $(NOSTDINC_FLAGS)
-- 
2.7.4

