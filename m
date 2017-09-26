Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37643 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966283AbdIZC2v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Sep 2017 22:28:51 -0400
From: Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: [PATCH] kbuild: clang: remove crufty HOSTCFLAGS
Date: Mon, 25 Sep 2017 19:28:35 -0700
Message-Id: <20170926022835.30916-1-nick.desaulniers@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: behanw@converseincode.com, dl9pf@gmx.de, charlebm@gmail.com, mka@chromium.org, ghackmann@google.com, md@google.com, Nick Desaulniers <nick.desaulniers@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

When compiling with `make CC=clang HOSTCC=clang`, I was seeing warnings
that clang did not recognize -fno-delete-null-pointer-checks for HOSTCC
targets.  These were added in commit 61163efae020 ("kbuild: LLVMLinux:
Add Kbuild support for building kernel with Clang").  That patch wraps
that flag in cc-option for KBUILD_CFLAGS, but not hostcc-option for
HOSTCFLAGS. Either hostcc-option did not exist, or the author was not
setting HOSTCC to clang as well as CC when authored.

It's not clear why the other warnings were disabled, and just for
HOSTCFLAGS, but I can remove them, add -Werror to HOSTCFLAGS and compile
with clang just fine.

Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
---
* It may also be worthwhile keep the old flags, and simply wrap
  everything in hostcc-option.

 Makefile | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index d1119941261c..2e908969e0d8 100644
--- a/Makefile
+++ b/Makefile
@@ -301,16 +301,12 @@ HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 HOSTCC       = gcc
 HOSTCXX      = g++
 HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
+		$(call hostcc-option,-fno-delete-null-pointer-checks) \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
 HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS)
 HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)
 HOST_LOADLIBES := $(HOST_LFS_LIBS)
 
-ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
-HOSTCFLAGS  += -Wno-unused-value -Wno-unused-parameter \
-		-Wno-missing-field-initializers -fno-delete-null-pointer-checks
-endif
-
 # Decide whether to build built-in, modular, or both.
 # Normally, just do built-in.
 
-- 
2.11.0

