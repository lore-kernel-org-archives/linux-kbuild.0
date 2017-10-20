Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:49172 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751721AbdJTVJT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Oct 2017 17:09:19 -0400
Received: by mail-it0-f68.google.com with SMTP id y15so133751ita.4
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Oct 2017 14:09:19 -0700 (PDT)
From: David Lin <dtwlin@google.com>
Subject: [PATCH] kbuild: clang: fix build failures with sparse check
Date: Fri, 20 Oct 2017 14:09:13 -0700
Message-Id: <20171020210913.64498-1-dtwlin@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: corbet@lwn.net, yamada.masahiro@socionext.com, michal.lkml@markovi.net, behanw@converseincode.com
Cc: ghackmann@google.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, David Lin <dtwlin@google.com>

We should avoid using the space character when passing arguments to
clang, because static code analysis check tool such as sparse may
misinterpret the arguments followed by spaces as build targets hence
cause the build to fail.

Signed-off-by: David Lin <dtwlin@google.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 05f95df0a247..c8819d0de907 100644
--- a/Makefile
+++ b/Makefile
@@ -685,11 +685,11 @@ KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
 ifneq ($(CROSS_COMPILE),)
-CLANG_TARGET	:= -target $(notdir $(CROSS_COMPILE:%-=%))
+CLANG_TARGET	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN	:= $(realpath $(dir $(shell which $(LD)))/..)
 endif
 ifneq ($(GCC_TOOLCHAIN),)
-CLANG_GCC_TC	:= -gcc-toolchain $(GCC_TOOLCHAIN)
+CLANG_GCC_TC	:= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 KBUILD_CFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
 KBUILD_AFLAGS += $(CLANG_TARGET) $(CLANG_GCC_TC)
-- 
2.15.0.rc0.271.g36b669edcc-goog

