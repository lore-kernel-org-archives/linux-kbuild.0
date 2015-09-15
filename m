Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:37358 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751728AbbIODUG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 23:20:06 -0400
From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH] kbuild: llvmlinux: Set appropriate compiler-flag for CONFIG_CC_OPTIMIZE_FOR_SIZE
Date: Tue, 15 Sep 2015 05:19:48 +0200
Message-Id: <1442287188-11326-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>, Behan Webster <behanw@converseincode.com>

Based on a patch of Behan Webster (see [1]).

CLANG (here: v3.7) requires '-Oz' as OptLevel to be set.

A Linux v4.3-rc1 kernel built fine with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
and boots on bare metal.
This is a Ubuntu/precise AMD64 system.

Tested against Linux v4.3-rc1 and a refreshed llvmlinux patchset.

[1] http://git.linuxfoundation.org/?p=llvmlinux.git;a=blob;f=arch/all/patches/smaller.patch

CC: Behan Webster <behanw@converseincode.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4249441e535d..a57fb6b39ed7 100644
--- a/Makefile
+++ b/Makefile
@@ -622,7 +622,8 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 endif
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-KBUILD_CFLAGS	+= -Os $(call cc-disable-warning,maybe-uninitialized,)
+KBUILD_CFLAGS 	+= $(call cc-option,-Oz,-Os)
+KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
 else
 KBUILD_CFLAGS	+= -O2
 endif
-- 
2.5.2

