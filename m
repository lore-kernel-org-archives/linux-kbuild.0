Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:33485 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753038AbcKZSUK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Nov 2016 13:20:10 -0500
Received: by mail-qt0-f176.google.com with SMTP id p16so89652981qta.0
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Nov 2016 10:20:10 -0800 (PST)
From: Peter Foley <pefoley2@pefoley.com>
Subject: [PATCH v3] Fixes for compiling with clang
Date: Sat, 26 Nov 2016 13:20:06 -0500
Message-Id: <20161126182006.24815-1-pefoley2@pefoley.com>
In-Reply-To: <20161126180224.29783-1-pefoley2@pefoley.com>
References: <20161126180224.29783-1-pefoley2@pefoley.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: Peter Foley <pefoley2@pefoley.com>

Move definition of HOSTCC to allow use of cc-name.
Suppress warnings about unsupported optimization options.
Disable clang's integrated assembler which is incompatible with kernel
asm constructs.

Changes from v1:
* Move the $(cc-name) conditional below the definition of $(CC)
Changes from v2:
* Actually commit the changes in v2.

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 Makefile | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 0ede48ba5aaf..94402cef6622 100644
--- a/Makefile
+++ b/Makefile
@@ -299,16 +299,6 @@ CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
 
-HOSTCC       = gcc
-HOSTCXX      = g++
-HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89
-HOSTCXXFLAGS = -O2
-
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
-endif
-
 # Decide whether to build built-in, modular, or both.
 # Normally, just do built-in.
 
@@ -373,6 +363,15 @@ LDFLAGS_vmlinux =
 CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
 CFLAGS_KCOV	:= $(call cc-option,-fsanitize-coverage=trace-pc,)
 
+HOSTCC       = gcc
+HOSTCXX      = g++
+HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 \
+               -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers
+HOSTCXXFLAGS = -O2
+
+ifneq ($(cc-name),clang)
+HOSTCFLAGS +=  -fno-delete-null-pointer-checks
+endif
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
@@ -685,6 +684,7 @@ KBUILD_CFLAGS += $(stackp-flag)
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
 KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
+KBUILD_CFLAGS += $(call cc-disable-warning, ignored-optimization-argument)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
@@ -695,6 +695,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -fno-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -fno-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.11.0.rc2

