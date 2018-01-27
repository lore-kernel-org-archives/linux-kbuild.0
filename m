Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:52316 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751404AbeA0BAQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jan 2018 20:00:16 -0500
From: Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
Date: Fri, 26 Jan 2018 16:59:46 -0800
Message-Id: <1517014786-30685-1-git-send-email-psodagud@codeaurora.org>
In-Reply-To: <CAK7LNAQAtPQOXPKyhrs4w7cLXoO5vpM9_Yi_=_G0gNYmNNv_FA@mail.gmail.com>
References: <CAK7LNAQAtPQOXPKyhrs4w7cLXoO5vpM9_Yi_=_G0gNYmNNv_FA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh@linuxfoundation.org, mmarek@suse.com, ghackmann@google.com, yamada.masahiro@socionext.com
Cc: psodagud@codeaurora.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Disable -Wunused-const-variable warnings instead of
disabling -Wunused-variable warnings, So that in both
clang and GCC -Wunused-const-variable gets disabled.

Currently with clang -Wunused-variable warnings are
disabled and with gcc -Wunused-variable warnings are
enabled, with this setting all unused local variable
would be warned in clang as well.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 339397b..c730338 100644
--- a/Makefile
+++ b/Makefile
@@ -698,7 +698,6 @@ KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
@@ -719,6 +718,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 endif
 
+KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 else
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

