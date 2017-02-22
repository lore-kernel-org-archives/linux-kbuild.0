Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33118 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932684AbdBVPI4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Feb 2017 10:08:56 -0500
From: Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH] kbuild: strip the last slash in KBUILD_EXTMOD
Date: Wed, 22 Feb 2017 23:08:33 +0800
Message-Id: <20170222150833.83149-1-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>

Current kbuild will build the target again if we run "make M=dir" and "make
M=dir/" by turns, since if_changed will see the prerequisite is changed.
The behavior may confuse the user a little, since actually we are building
the same target and no difference.

According to current implementation in scripts/Makefile.build, the obj
passed to next level is a directory name with last slash stripped. This
patch strips the last slash in KBUILD_EXTMOD which is assigned from "M=".

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b1037774e8e8..db6ed60928ab 100644
--- a/Makefile
+++ b/Makefile
@@ -184,13 +184,15 @@ endif
 # Old syntax make ... SUBDIRS=$PWD is still supported
 # Setting the environment variable KBUILD_EXTMOD take precedence
 ifdef SUBDIRS
-  KBUILD_EXTMOD ?= $(SUBDIRS)
+  __KBUILD_EXTMOD ?= $(SUBDIRS)
 endif
 
 ifeq ("$(origin M)", "command line")
-  KBUILD_EXTMOD := $(M)
+  __KBUILD_EXTMOD := $(M)
 endif
 
+KBUILD_EXTMOD = $(patsubst %/,%,$(__KBUILD_EXTMOD))
+
 # If building an external module we do not care about the all: rule
 # but instead _all depend on modules
 PHONY += all
-- 
2.11.0

