Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:33898 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751121AbcLJAqp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Dec 2016 19:46:45 -0500
Received: by mail-pg0-f53.google.com with SMTP id x23so13056175pgx.1
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Dec 2016 16:46:45 -0800 (PST)
From: David Lin <dtwlin@google.com>
Subject: [PATCH] jump label: pass kbuild_cflags when checking for asm goto support
Date: Fri,  9 Dec 2016 16:46:38 -0800
Message-Id: <20161210004638.23417-1-dtwlin@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jbaron@akamai.com
Cc: David Lin <dtwlin@google.com>

Some versions of ARM GCC compiler such as Android toolchain throws in a
'-fpic' flag by default. This causes the gcc-goto check script to fail
although some config would have '-fno-pic' flag in the KBUILD_CFLAGS.

This patch passes the KBUILD_CFLAGS to the check script so that the
script does not rely on the default config from different compilers.

Signed-off-by: David Lin <dtwlin@google.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 694111b..f667daa 100644
--- a/Makefile
+++ b/Makefile
@@ -790,7 +790,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 KBUILD_ARFLAGS := $(call ar-option,D)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
+ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
-- 
2.10.2

