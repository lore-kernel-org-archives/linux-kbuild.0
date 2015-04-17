Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rev33.vpn.fdn.fr ([80.67.179.33]:59377 "EHLO
	marvin.crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932325AbbDQWCs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Apr 2015 18:02:48 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2] Makefile: Fix detection of clang when cross-compiling
Date: Fri, 17 Apr 2015 23:35:04 +0200
Message-Id: <1429306504-26122-1-git-send-email-paul@crapouillou.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>

When the host's C compiler is clang, and when attempting to
cross-compile Linux e.g. to MIPS with mipsel-linux-gcc, the Makefile
would incorrectly detect the use of clang, which resulted in
clang-specific flags being passed to mipsel-linux-gcc.

This can be verified under Debian by installing the "clang" package,
and then using it as the default compiler with:
sudo update-alternatives --config cc

This patch moves the detection of clang after the $(CC) variable is
initialized to the name of the cross-compiler, so that the check applies
to the cross-compiler and not the host's C compiler.

v2: Move the detection of clang after the inclusion of the
arch/*/Makefile (as they might set $(CROSS_COMPILE))

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Makefile | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index fbd43bf..e1e8c7e 100644
--- a/Makefile
+++ b/Makefile
@@ -335,15 +335,6 @@ endif
 export KBUILD_MODULES KBUILD_BUILTIN
 export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 
-ifneq ($(CC),)
-ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
-COMPILER := clang
-else
-COMPILER := gcc
-endif
-export COMPILER
-endif
-
 # Look for make include files relative to root of kernel src
 MAKEFLAGS += --include-dir=$(srctree)
 
@@ -673,6 +664,13 @@ endif
 endif
 KBUILD_CFLAGS += $(stackp-flag)
 
+ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
+COMPILER := clang
+else
+COMPILER := gcc
+endif
+export COMPILER
+
 ifeq ($(COMPILER),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
 KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
-- 
2.1.4

