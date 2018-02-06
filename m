Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57552 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753346AbeBFXrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 18:47:00 -0500
From: Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH] kbuild: clang: disable unused variable warnings only when constant
Date: Tue,  6 Feb 2018 15:46:51 -0800
Message-Id: <1517960811-21674-1-git-send-email-psodagud@codeaurora.org>
In-Reply-To: <CAK7LNAQ1d5t5-UHsF1ZJ9tNLpGgbMGnDoHdht9=wNy5kLDVyxw@mail.gmail.com>
References: <CAK7LNAQ1d5t5-UHsF1ZJ9tNLpGgbMGnDoHdht9=wNy5kLDVyxw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: gregkh@linuxfoundation.org, segher@kernel.crashing.org, ghackmann@google.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Prasad Sodagudi <psodagud@codeaurora.org>

Currently, GCC disables -Wunused-const-variable, but not
-Wunused-variable, so warns unused variables if they are
non-constant.

While, Clang does not warn unused variables at all regardless of
the const qualifier because -Wno-unused-const-variable is implied
by the stronger option -Wno-unused-variable.

Disable -Wunused-const-variable instead of -Wunused-variable so that
GCC and Clang work in the same way.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 11aff0f..ca0a571 100644
--- a/Makefile
+++ b/Makefile
@@ -700,7 +700,6 @@ KBUILD_CFLAGS += $(stackp-flag)
 
 ifeq ($(cc-name),clang)
 KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
@@ -718,9 +717,9 @@ else
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

