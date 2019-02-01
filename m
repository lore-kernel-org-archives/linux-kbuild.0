Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37618 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbfBAVKV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Feb 2019 16:10:21 -0500
Received: by mail-pf1-f194.google.com with SMTP id y126so3822363pfb.4
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Feb 2019 13:10:20 -0800 (PST)
From: jflat@chromium.org
Subject: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Date: Fri,  1 Feb 2019 13:08:53 -0800
Message-Id: <20190201210853.244043-1-jflat@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, Jon Flatley <jflat@chromium.org>

From: Jon Flatley <jflat@chromium.org>

gcc produces format warnings that clang suppresses. To keep behavior
consistent between gcc and clang, don't suppress format warnings in
clang.

Signed-off-by: Jon Flatley <jflat@chromium.org>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306add591..94daf4e1fc73 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -68,7 +68,6 @@ else
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
-KBUILD_CFLAGS += $(call cc-disable-warning, format)
 KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
 KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
-- 
2.20.1.611.gfbb209baf1-goog
