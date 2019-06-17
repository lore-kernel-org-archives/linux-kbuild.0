Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f202.google.com ([209.85.160.202]:44577 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfFQR2f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 13:28:35 -0400
Received: by mail-qt1-f202.google.com with SMTP id x10so9854722qti.11
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 10:28:35 -0700 (PDT)
Date: Mon, 17 Jun 2019 10:28:29 -0700
Message-Id: <20190617172829.164520-1-nhuck@google.com>
Mime-Version: 1.0
Subject: [PATCH] kbuild: Remove unnecessary -Wno-unused-value
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com

This flag turns off several other warnings that would
be useful. Most notably -warn_unused_result is disabled.
All of the following warnings are currently disabled:

UnusedValue
|-UnusedComparison
  |-warn_unused_comparison
|-UnusedResult
  |-warn_unused_result
|-UnevaluatedExpression
  |-PotentiallyEvaluatedExpression
    |-warn_side_effects_typeid
  |-warn_side_effects_unevaluated_context
|-warn_unused_expr
|-warn_unused_voidptr
|-warn_unused_container_subscript_expr
|-warn_unused_call

With this flag removed there are ~10 warnings.
Patches have been submitted for each of these warnings.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/520
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 3ab8d1a303cd..b293246e48fe 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -68,7 +68,6 @@ else
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
-KBUILD_CFLAGS += -Wno-unused-value
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
-- 
2.22.0.410.gd8fdbe21b5-goog
