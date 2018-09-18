Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:33262 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbeIRICW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Sep 2018 04:02:22 -0400
From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] kbuild: allow to use GCC toolchain not in Clang search path
Date: Mon, 17 Sep 2018 19:31:57 -0700
Message-Id: <20180918023157.23951-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: ndesaulniers@google.com, arnd@arndb.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

When using a GCC cross toolchain which is not in a compiled in
Clang search path, Clang reverts to the system assembler and
linker. This leads to assembler or linker errors, depending on
which tool is first used for a given architecture.

It seems that Clang is not searching $PATH for a matching
assembler or linker.

Make sure that Clang picks up the correct assembler or linker by
passing the cross compilers bin directory as search path.

This allows to use Clang provided by distributions with GCC
toolchains not in /usr/bin.

Link: https://github.com/ClangBuiltLinux/linux/issues/78
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Nick, I removed your Reviewed-by since I had to change variable
assignment slightly...

 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 4d5c883a98e5..d5de2db4b549 100644
--- a/Makefile
+++ b/Makefile
@@ -495,13 +495,15 @@ endif
 ifeq ($(cc-name),clang)
 ifneq ($(CROSS_COMPILE),)
 CLANG_TARGET	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
-GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))
+CLANG_PREFIX	:= --prefix=$(GCC_TOOLCHAIN_DIR)
+GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_GCC_TC	:= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
-KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
-KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
+KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
+KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC) $(CLANG_PREFIX)
 KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
 KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
 endif
-- 
2.19.0
