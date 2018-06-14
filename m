Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:43055 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754860AbeFNKha (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 06:37:30 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] x86: fix dependency of X86_32_LAZY_GS
Date: Thu, 14 Jun 2018 19:36:43 +0900
Message-Id: <1528972605-24264-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
References: <1528972605-24264-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

Commit 2a61f4747eea ("stack-protector: test compiler capability in
Kconfig and drop AUTO mode") replaced the 'choice' with two boolean
symbols, so CC_STACKPROTECTOR_NONE no longer exists.

Prior to commit 2bc2f688fdf8 ("Makefile: move stack-protector
availability out of Kconfig"), this line was like this:

  depends on X86_32 && !CC_STACKPROTECTOR

The CC_ prefix was dropped by commit 050e9baa9dc9 ("Kbuild: rename
CC_STACKPROTECTOR[_STRONG] config variables"), so the dependency
now should be:

  depends on X86_32 && !STACKPROTECTOR

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 455a670..d6c6ee6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -327,7 +327,7 @@ config X86_64_SMP
 
 config X86_32_LAZY_GS
 	def_bool y
-	depends on X86_32 && CC_STACKPROTECTOR_NONE
+	depends on X86_32 && !STACKPROTECTOR
 
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
-- 
2.7.4

