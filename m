Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:43052 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754870AbeFNKha (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 06:37:30 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kconfig: tinyconfig: remove stale stack protector fixups
Date: Thu, 14 Jun 2018 19:36:44 +0900
Message-Id: <1528972605-24264-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Prior to commit 2a61f4747eea ("stack-protector: test compiler
capability in Kconfig and drop AUTO mode"), the stack protector
was configured by the choice of NONE, REGULAR, STRONG, AUTO.

tiny.config needed to explicitly set NONE because the default
value of choice, AUTO, did not produce the tiniest kernel.

Now that there are only two boolean symbols, STACKPROTECTOR
and STACKPROTECTOR_STRONG, they are naturally disabled by
"make allnoconfig", which "make tinyconfig" is based on.
Remove unnecessary lines from the tiny.config fragment file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 kernel/configs/tiny.config | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 9bfdffc..7fa0c4a 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -10,7 +10,3 @@ CONFIG_OPTIMIZE_INLINING=y
 # CONFIG_SLAB is not set
 # CONFIG_SLUB is not set
 CONFIG_SLOB=y
-CONFIG_CC_STACKPROTECTOR_NONE=y
-# CONFIG_CC_STACKPROTECTOR_REGULAR is not set
-# CONFIG_CC_STACKPROTECTOR_STRONG is not set
-# CONFIG_CC_STACKPROTECTOR_AUTO is not set
-- 
2.7.4

