Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bn1bon0058.outbound.protection.outlook.com ([157.56.111.58]:51840
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753473AbbDIPKD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Apr 2015 11:10:03 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] Makefile: Fix detection of clang when cross-compiling
Date: Thu, 9 Apr 2015 16:34:54 +0200
Message-ID: <1428590094-6995-1-git-send-email-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Makefile | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 54430f9..5fff1b2 100644
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
 
@@ -369,6 +360,13 @@ PERL		= perl
 PYTHON		= python
 CHECK		= sparse
 
+ifeq ($(shell $(CC) -v 2>&1 | grep -c "clang version"), 1)
+COMPILER := clang
+else
+COMPILER := gcc
+endif
+export COMPILER
+
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void $(CF)
 CFLAGS_MODULE   =
-- 
2.1.4

