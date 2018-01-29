Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49722 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751338AbeA2RIL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jan 2018 12:08:11 -0500
From: Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
Date: Mon, 29 Jan 2018 09:08:00 -0800
Message-Id: <1517245680-3361-1-git-send-email-psodagud@codeaurora.org>
In-Reply-To: <fd6fdda6c0080e72598eabd2c88d7df6@codeaurora.org>
References: <fd6fdda6c0080e72598eabd2c88d7df6@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org, segher@kernel.crashing.org, ghackmann@google.com, yamada.masahiro@socionext.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Prasad Sodagudi <psodagud@codeaurora.org>

Currently -Wunused-variable warnings are disabled with
clang and with gcc -Wunused-variable warnings are
enabled, with this setting all unused local variables
would be warned in clang as well.

Disable -Wunused-const-variable warnings instead of
disabling -Wunused-variable warnings, So that in both
clang and GCC -Wunused-const-variable gets disabled.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 339397b..4b6c8e2 100644
--- a/Makefile
+++ b/Makefile
@@ -698,7 +698,6 @@ KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
@@ -716,9 +715,9 @@ else
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
 
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 else
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

