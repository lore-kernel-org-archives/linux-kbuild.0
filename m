Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb0-f176.google.com ([209.85.213.176]:35193 "EHLO
        mail-yb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162329AbdDUSVG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 14:21:06 -0400
Received: by mail-yb0-f176.google.com with SMTP id 6so46964923ybq.2
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 11:21:05 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] kbuild: Add better clang cross build support
Date: Fri, 21 Apr 2017 11:20:01 -0700
Message-Id: <20170421182001.139199-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Behan Webster <behanw@converseincode.com>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>, Matthias Kaehlcke <mka@chromium.org>

Add cross target to CC if using clang. Also add custom gcc toolchain
path for fallback gcc tools.

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
- Moved new 'code' into existing ifeq clang block
- Don't add -target and -gcc-toolchain to KBUILD_CPPFLAGS
- Removed intermediate CLANG_FLAGS variable
- Updated commit message, removed paragraph mentioning old COMPILER
  variable

 Makefile | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Makefile b/Makefile
index 5039b9148d15..11c00bd3ec0c 100644
--- a/Makefile
+++ b/Makefile
@@ -698,6 +698,15 @@ endif
 KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
+ifneq ($(CROSS_COMPILE),)
+CLANG_TARGET	:= -target $(notdir $(CROSS_COMPILE:%-=%))
+GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
+endif
+ifneq ($(GCC_TOOLCHAIN),)
+CLANG_GCC_TC	:= -gcc-toolchain $(GCC_TOOLCHAIN)
+endif
+KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
+KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
 KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
-- 
2.12.2.816.g2cccc81164-goog

