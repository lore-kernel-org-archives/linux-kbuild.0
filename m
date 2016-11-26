Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33861 "EHLO
        mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750698AbcKZEeg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Nov 2016 23:34:36 -0500
Received: by mail-qk0-f173.google.com with SMTP id q130so94543843qke.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Nov 2016 20:34:35 -0800 (PST)
From: Peter Foley <pefoley2@pefoley.com>
Subject: [PATCH] Fixes for compiling with clang
Date: Fri, 25 Nov 2016 23:27:24 -0500
Message-Id: <20161126042724.15461-1-pefoley2@pefoley.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, mmarek@suse.com, linux-kbuild@vger.kernel.org
Cc: Peter Foley <pefoley2@pefoley.com>

Move definition of HOSTCC to allow use of cc-name.
Suppress warnings about unsupported optimization options.
Disable clang's integrated assembler which is incompatible with kernel
asm constructs.

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 0ede48ba5aaf..b69ad7e4a6d2 100644
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
 
@@ -343,6 +333,16 @@ export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 scripts/Kbuild.include: ;
 include scripts/Kbuild.include
 
+HOSTCC       = gcc
+HOSTCXX      = g++
+HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 \
+               -Wno-unused-value -Wno-unused-parameter -Wno-missing-field-initializers
+HOSTCXXFLAGS = -O2
+
+ifneq ($(cc-name),clang)
+HOSTCFLAGS +=  -fno-delete-null-pointer-checks
+endif
+
 # Make variables (CC, etc...)
 AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
@@ -685,6 +685,7 @@ KBUILD_CFLAGS += $(stackp-flag)
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
 KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
+KBUILD_CFLAGS += $(call cc-disable-warning, ignored-optimization-argument)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
@@ -695,6 +696,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -fno-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -fno-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.11.0.rc2

