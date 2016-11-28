Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:34738 "EHLO
        mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754393AbcK1GpC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 01:45:02 -0500
Received: by mail-qk0-f175.google.com with SMTP id q130so130534678qke.1
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Nov 2016 22:45:01 -0800 (PST)
From: Peter Foley <pefoley2@pefoley.com>
Subject: [PATCH v4] Fixes for compiling with clang
Date: Mon, 28 Nov 2016 01:44:46 -0500
Message-Id: <20161128064446.4892-1-pefoley2@pefoley.com>
In-Reply-To: <20161126182006.24815-1-pefoley2@pefoley.com>
References: <20161126182006.24815-1-pefoley2@pefoley.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: Peter Foley <pefoley2@pefoley.com>

Fix reversed conditional checking if HOSTCC is clang.
Suppress warnings about unsupported optimization options.
Suppress warnings about unused functions, as they are generated for
every module and are therefore far too spammy.
Disable clang's integrated assembler which is incompatible with kernel
asm constructs.

Changes from v1:
* Move the $(cc-name) conditional below the definition of $(CC)
Changes from v2:
* Actually commit the changes in v2.
Changes from v3:
* HOSTCC is not guaranteed to be the same as CC, adjust accordingly.

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 Makefile | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 694111b43cf8..9c4803a74117 100644
--- a/Makefile
+++ b/Makefile
@@ -301,12 +301,12 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 
 HOSTCC       = gcc
 HOSTCXX      = g++
-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
+HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 \
+               -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers
 HOSTCXXFLAGS = -O2
 
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
+ifneq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
+HOSTCFLAGS +=  -fno-delete-null-pointer-checks
 endif
 
 # Decide whether to build built-in, modular, or both.
@@ -685,7 +685,9 @@ KBUILD_CFLAGS += $(stackp-flag)
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
 KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
+KBUILD_CFLAGS += $(call cc-disable-warning, ignored-optimization-argument)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-function)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 # Quiet clang warning: comparison of unsigned expression < 0 is always false
@@ -695,6 +697,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -fno-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -fno-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.11.0.rc2

