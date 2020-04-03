Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:42404 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgDCV0T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 17:26:19 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
Date: Sat,  4 Apr 2020 06:24:59 +0900
Message-Id: <20200403212459.13914-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>

scripts/mkcompile_h uses $(CC) only for getting the version string.

I suspected there was a specific reason why the additional flags were
needed, and dug the commit history. This code dates back to at least
2002 [1], but I could not get any more clue.

Just get rid of it.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=29f3df7eba8ddf91a55183f9967f76fbcc3ab742

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Makefile b/init/Makefile
index 30aa8ab11120..d45e967483b2 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
 	@$($(quiet)chk_compile.h)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
-	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
+	"$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
-- 
2.17.1
