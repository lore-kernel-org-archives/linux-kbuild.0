Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:35392 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752857AbZEZID2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 May 2009 04:03:28 -0400
From: Cheng Renquan <crq@hera.kernel.org>
Subject: [PATCH] Kbuild: remove extra ifdef/endif of top Makefile
Date: Tue, 26 May 2009 16:03:07 +0800
Message-Id: <1243324987-17840-1-git-send-email-crq@hera.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, crquan@gmail.com

From: Cheng Renquan <crq@kernel.org>

The GNU make's origin function know undefined variable well,
so the outer ifdef/endif is unneeded.

I've checked the minimal requirements from Documentation/Changes
is GNU make 3.79.1, and that version of GNU make has support of
origin function already, so now it's safe to kill the outer
conditional checking, without upgrading the minimal requirements.

Signed-off-by: Cheng Renquan <crq@kernel.org>
---
 Makefile |   26 +++++++++-----------------
 1 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/Makefile b/Makefile
index 9b2b58c..3798f26 100644
--- a/Makefile
+++ b/Makefile
@@ -35,10 +35,8 @@ MAKEFLAGS += -rR --no-print-directory
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 
-ifdef V
-  ifeq ("$(origin V)", "command line")
-    KBUILD_VERBOSE = $(V)
-  endif
+ifeq ("$(origin V)", "command line")
+  KBUILD_VERBOSE = $(V)
 endif
 ifndef KBUILD_VERBOSE
   KBUILD_VERBOSE = 0
@@ -54,10 +52,8 @@ endif
 # See the file "Documentation/sparse.txt" for more details, including
 # where to get the "sparse" utility.
 
-ifdef C
-  ifeq ("$(origin C)", "command line")
-    KBUILD_CHECKSRC = $(C)
-  endif
+ifeq ("$(origin C)", "command line")
+  KBUILD_CHECKSRC = $(C)
 endif
 ifndef KBUILD_CHECKSRC
   KBUILD_CHECKSRC = 0
@@ -69,12 +65,10 @@ endif
 ifdef SUBDIRS
   KBUILD_EXTMOD ?= $(SUBDIRS)
 endif
-ifdef M
-  ifeq ("$(origin M)", "command line")
-    KBUILD_EXTMOD := $(M)
-  endif
-endif
 
+ifeq ("$(origin M)", "command line")
+  KBUILD_EXTMOD := $(M)
+endif
 
 # kbuild supports saving output files in a separate directory.
 # To locate output files in a separate directory two syntaxes are supported.
@@ -98,10 +92,8 @@ ifeq ($(KBUILD_SRC),)
 
 # OK, Make called in directory where kernel src resides
 # Do we want to locate output files in a separate directory?
-ifdef O
-  ifeq ("$(origin O)", "command line")
-    KBUILD_OUTPUT := $(O)
-  endif
+ifeq ("$(origin O)", "command line")
+  KBUILD_OUTPUT := $(O)
 endif
 
 # That's our default target when none is given on the command line

-- 
Cheng Renquan, Shenzhen, China
