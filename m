Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:35301 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766AbbIODDO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 23:03:14 -0400
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH] kbuild: llvmlinux: Fix -fno-delete-null-pointer-checks compiler-flag
Date: Tue, 15 Sep 2015 05:03:00 +0200
Message-Id: <1442286180-11050-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>

CLANG (here: v3.7) does not support '-fno-delete-null-pointer-checks'
as a compiler-flag.

Fix the HOSTCFLAGS and KBUILD_CFLAGS settings accordingly.
Furthermore, move and correct the $HOSTCC check.

Tested against Linux v4.3-rc1 and a refreshed llvmlinux patchset.
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index aaf1d52bc646..4249441e535d 100644
--- a/Makefile
+++ b/Makefile
@@ -300,9 +300,9 @@ HOSTCXX      = g++
 HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
 HOSTCXXFLAGS = -O2
 
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
+HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers
+ifneq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
+HOSTCFLAGS  += -fno-delete-null-pointer-checks
 endif
 
 # Decide whether to build built-in, modular, or both.
@@ -617,7 +617,9 @@ ARCH_AFLAGS :=
 ARCH_CFLAGS :=
 include arch/$(SRCARCH)/Makefile
 
+ifneq ($(cc-name),clang)
 KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
+endif
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS	+= -Os $(call cc-disable-warning,maybe-uninitialized,)
-- 
2.5.2

