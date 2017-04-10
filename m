Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f170.google.com ([209.85.192.170]:33142 "EHLO
        mail-pf0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751434AbdDJVJw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Apr 2017 17:09:52 -0400
Received: by mail-pf0-f170.google.com with SMTP id s16so38777201pfs.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Apr 2017 14:09:52 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] kbuild: Add better clang cross build support
Date: Mon, 10 Apr 2017 14:09:04 -0700
Message-Id: <20170410210904.68211-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>, Matthias Kaehlcke <mka@chromium.org>

Add cross target to CC if using clang. Also add custom gcc toolchain
path for fallback gcc tools.

COMPILER is previously set to "clang" if CC=clang was set from the
make command line.  So -target and -gcc-toolchain can be added to CC,
since we already know that it is set.

Clang will fallback to using things like ld, as, and libgcc if
(respectively) one of the llvm linkers isn't available, the integrated
assembler is turned off, or an appropriately cross-compiled version of
compiler-rt isn't available. To this end, you can specify the path to
this fallback gcc toolchain with GCC_TOOLCHAIN.

From: Behan Webster <behanw@converseincode.com>
Signed-off-by: Behan Webster <behanw@converseincode.com>
Reviewed-by: Jan-Simon Möller <dl9pf@gmx.de>
Reviewed-by: Mark Charlebois <charlebm@gmail.com>
Signed-off-by: Greg Hackmann <ghackmann@google.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Fix GCC_TOOLCHAIN definition. $(LD) is needed to link the kernel, use
  its path to determine the installation prefix of the toolchain.
  (From: Greg Hackmann <ghackmann@google.com>)

 Makefile | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index e11989d36c87..d3a02786bb53 100644
--- a/Makefile
+++ b/Makefile
@@ -375,6 +375,16 @@ LDFLAGS_vmlinux =
 CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
 CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 
+ifeq ($(cc-name),clang)
+ifneq ($(CROSS_COMPILE),)
+CLANG_TARGET	:= -target $(notdir $(CROSS_COMPILE:%-=%))
+GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
+endif
+ifneq ($(GCC_TOOLCHAIN),)
+CLANG_GCC_TC	:= -gcc-toolchain $(GCC_TOOLCHAIN)
+endif
+CLANG_FLAGS	:= $(CLANG_TARGET) $(CLANG_GCC_TC)
+endif
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
@@ -395,18 +405,18 @@ LINUXINCLUDE    := \
 
 LINUXINCLUDE	+= $(filter-out $(LINUXINCLUDE),$(USERINCLUDE))
 
-KBUILD_CPPFLAGS := -D__KERNEL__
+KBUILD_CPPFLAGS := -D__KERNEL__ $(CLANG_FLAGS)
 
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
-		   -std=gnu89 $(call cc-option,-fno-PIE)
-
+		   -std=gnu89 $(call cc-option,-fno-PIE) \
+		   $(CLANG_FLAGS)
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
-KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE)
+KBUILD_AFLAGS   := -D__ASSEMBLY__ $(call cc-option,-fno-PIE) $(CLANG_FLAGS)
 KBUILD_AFLAGS_MODULE  := -DMODULE
 KBUILD_CFLAGS_MODULE  := -DMODULE
 KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
-- 
2.12.2.715.g7642488e1d-goog

