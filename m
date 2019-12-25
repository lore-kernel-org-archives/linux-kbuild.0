Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42955 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfLYF6K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Dec 2019 00:58:10 -0500
From: Liangcai Fan <fanliangcai9@gmail.com>
Subject: [PATCH] use bash instead of sh to run mkcompile_h
Date: Wed, 25 Dec 2019 13:58:03 +0800
Message-Id: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: masahiroy@kernel.org, michal.lkml@markovi.net
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, zhang.lyra@gmail.com, gengcixi@gmail.com, orson.zhai@unisoc.com, Liangcai Fan <liangcai.fan@unisoc.com>, Liangcai Fan <fanliangcai9@gmail.com>

From: Liangcai Fan <liangcai.fan@unisoc.com>

Use sh to run mkcompile_h, compilation would fail if whoami contains
backslash, since sh uses dash. The reason is that the echo command would
interpret backslash to escapes, so the LINUX_COMPILE_BY definition was
incorrect.

Parse mkcompile_h with bash, the echo command would not see backslash as
escapes, then there is no error with the definition of LINUX_COMPILE_BY.

Signed-off-by: Liangcai Fan <liangcai.fan@unisoc.com>
Signed-off-by: Liangcai Fan <fanliangcai9@gmail.com>
---
 init/Makefile       | 2 +-
 scripts/mkcompile_h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Makefile b/init/Makefile
index 6246a06..9348d17 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -33,6 +33,6 @@ $(obj)/version.o: include/generated/compile.h
 silent_chk_compile.h = :
 include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
+	$(Q)$(BASH) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
 	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 3a5a4b2..cfc2e2a 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 TARGET=$1
-- 
1.9.1
