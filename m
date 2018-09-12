Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:53906 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbeILLVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Sep 2018 07:21:22 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove old check for CFLAGS use
Date: Wed, 12 Sep 2018 15:18:02 +0900
Message-Id: <1536733082-19110-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This check has been here more than a decade since commit 0c53c8e6eb45
("kbuild: check for wrong use of CFLAGS").

Enough time for migration has passed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 5a2d1c9..cb03774 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -36,21 +36,11 @@ subdir-ccflags-y :=
 
 include scripts/Kbuild.include
 
-# For backward compatibility check that these variables do not change
-save-cflags := $(CFLAGS)
-
 # The filename Kbuild has precedence over Makefile
 kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
 kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
 include $(kbuild-file)
 
-# If the save-* variables changed error out
-ifeq ($(KBUILD_NOPEDANTIC),)
-        ifneq ("$(save-cflags)","$(CFLAGS)")
-                $(error CFLAGS was changed in "$(kbuild-file)". Fix it to use ccflags-y)
-        endif
-endif
-
 include scripts/Makefile.lib
 
 # Do not include host rules unless needed
-- 
2.7.4
