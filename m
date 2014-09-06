Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:65251 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750826AbaIFAV5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Sep 2014 20:21:57 -0400
Received: by mail-pd0-f176.google.com with SMTP id w10so7356333pde.35
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Sep 2014 17:21:56 -0700 (PDT)
From: behanw@converseincode.com
Subject: [PATCH] kbuild, LLVMLinux: Add better clang cross build support
Date: Fri,  5 Sep 2014 17:21:49 -0700
Message-Id: <1409962909-14660-1-git-send-email-behanw@converseincode.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>

From: Behan Webster <behanw@converseincode.com>

Add cross target to CC if using clang. Also add custom gcc toolchain path for
fallback gcc tools.

COMPILER is previously set to "clang" if CC=clang was set from the make command
line.  So -target and -gcc-toolchain can be added to CC, since we already know
that it is set.

Clang will fallback to using things like ld, as, and libgcc if (respectively)
one of the llvm linkers isn't available, the integrated assembler is turned
off, or an appropriately cross-compiled version of compiler-rt isn't available.
To this end, you can specify the path to this fallback gcc toolchain with
GCC_TOOLCHAIN.

Signed-off-by: Behan Webster <behanw@converseincode.com>
---
 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 2893d7f..c772619 100644
--- a/Makefile
+++ b/Makefile
@@ -360,7 +360,16 @@ include $(srctree)/scripts/Kbuild.include
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
+ifeq ($(COMPILER),clang)
+ifneq ($(CROSS_COMPILE),)
+CC		+= -target $(CROSS_COMPILE:%-=%)
+endif
+ifneq ($(GCC_TOOLCHAIN),)
+CC		+= -gcc-toolchain $(GCC_TOOLCHAIN)
+endif
+else
 CC		= $(CROSS_COMPILE)gcc
+endif
 CPP		= $(CC) -E
 AR		= $(CROSS_COMPILE)ar
 NM		= $(CROSS_COMPILE)nm
-- 
1.9.1

