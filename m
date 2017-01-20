Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36238 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752125AbdATXoN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jan 2017 18:44:13 -0500
Received: by mail-pf0-f169.google.com with SMTP id 189so25826847pfu.3
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Jan 2017 15:44:13 -0800 (PST)
From: David Lin <dtwlin@google.com>
Subject: [PATCH RESEND] jump label: pass kbuild_cflags when checking for asm goto support
Date: Fri, 20 Jan 2017 15:43:29 -0800
Message-Id: <20170120234329.78868-1-dtwlin@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, jbaron@akamai.com, will.deacon@arm.com, rostedt@goodmis.org, gregkh@linuxfoundation.org, joelaf@google.com, David Lin <dtwlin@google.com>

Some versions of ARM GCC compiler such as Android toolchain throws in a
'-fpic' flag by default. This causes the gcc-goto check script to fail
although some config would have '-fno-pic' flag in the KBUILD_CFLAGS.

This patch passes the KBUILD_CFLAGS to the check script so that the
script does not rely on the default config from different compilers.

Signed-off-by: David Lin <dtwlin@google.com>
Acked-by: Steven Rostedt <rostedt@goodmis.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5f1a84735ff6..c5dec246b4ab 100644
--- a/Makefile
+++ b/Makefile
@@ -797,7 +797,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 KBUILD_ARFLAGS := $(call ar-option,D)
 
 # check for 'asm goto'
-ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC)), y)
+ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
 	KBUILD_CFLAGS += -DCC_HAVE_ASM_GOTO
 	KBUILD_AFLAGS += -DCC_HAVE_ASM_GOTO
 endif
-- 
2.11.0.483.g087da7b7c-goog

