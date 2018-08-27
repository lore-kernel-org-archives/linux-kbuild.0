Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:21268 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbeH0H0G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Aug 2018 03:26:06 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] objtool: remove workaround for unreachable warnings from old GCC
Date: Mon, 27 Aug 2018 12:39:43 +0900
Message-Id: <1535341183-19994-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Commit cafa0010cd51 ("Raise the minimum required gcc version to 4.6")
bumped the minimum GCC version to 4.6 for all architectures.

This effectively reverts commit da541b20021c ("objtool: Skip
unreachable warnings for GCC 4.4 and older"), which was a workaround
for GCC 4.4 or older.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1c48572..5a2d1c9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -246,8 +246,6 @@ objtool_args += --no-fp
 endif
 ifdef CONFIG_GCOV_KERNEL
 objtool_args += --no-unreachable
-else
-objtool_args += $(call cc-ifversion, -lt, 0405, --no-unreachable)
 endif
 ifdef CONFIG_RETPOLINE
 ifneq ($(RETPOLINE_CFLAGS),)
-- 
2.7.4
