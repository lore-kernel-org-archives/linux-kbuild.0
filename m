Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:25631 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbeH0Jbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Aug 2018 05:31:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] x86/build: remove jump label quirk for GCC older than 4.5.2
Date: Mon, 27 Aug 2018 14:45:14 +0900
Message-Id: <1535348714-25457-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
bumped the minimum GCC version to 4.6 for all architectures.

Remove the workaround code.

It was the only user of cc-if-fullversion.  Remove the macro as well.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/x86/Makefile      | 12 ------------
 scripts/Kbuild.include |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index d6c10f3..a51d5dc 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -175,18 +175,6 @@ ifndef CC_HAVE_ASM_GOTO
   $(error Compiler lacks asm-goto support.)
 endif
 
-#
-# Jump labels need '-maccumulate-outgoing-args' for gcc < 4.5.2 to prevent a
-# GCC bug (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=46226).  There's no way
-# to test for this bug at compile-time because the test case needs to execute,
-# which is a no-go for cross compilers.  So check the GCC version instead.
-#
-ifdef CONFIG_JUMP_LABEL
-  ifneq ($(ACCUMULATE_OUTGOING_ARGS), 1)
-	ACCUMULATE_OUTGOING_ARGS = $(call cc-if-fullversion, -lt, 040502, 1)
-  endif
-endif
-
 ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
 	# This compiler flag is not supported by Clang:
 	KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index c75413d..ce53639 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -153,10 +153,6 @@ cc-fullversion = $(shell $(CONFIG_SHELL) \
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
 cc-ifversion = $(shell [ $(cc-version) $(1) $(2) ] && echo $(3) || echo $(4))
 
-# cc-if-fullversion
-# Usage:  EXTRA_CFLAGS += $(call cc-if-fullversion, -lt, 040502, -O1)
-cc-if-fullversion = $(shell [ $(cc-fullversion) $(1) $(2) ] && echo $(3) || echo $(4))
-
 # cc-ldoption
 # Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
 cc-ldoption = $(call try-run,\
-- 
2.7.4
