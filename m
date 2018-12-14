Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28077 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727634AbeLNIGN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 03:06:13 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: add -fno-PIE flag unconditionally
Date: Fri, 14 Dec 2018 17:05:37 +0900
Message-Id: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This flag is documented in the GCC 4.6 manual, and recognized by
Clang as well. Let's rip off the cc-option switch.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index f2c3423..3bbc16a 100644
--- a/Makefile
+++ b/Makefile
@@ -422,9 +422,9 @@ LINUXINCLUDE    := \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
-KBUILD_AFLAGS   := -D__ASSEMBLY__
+KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
-		   -fno-strict-aliasing -fno-common -fshort-wchar \
+		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
 		   -std=gnu89
@@ -510,9 +510,6 @@ RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
-KBUILD_CFLAGS	+= $(call cc-option,-fno-PIE)
-KBUILD_AFLAGS	+= $(call cc-option,-fno-PIE)
-
 # check for 'asm goto'
 ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
   CC_HAVE_ASM_GOTO := 1
-- 
2.7.4
