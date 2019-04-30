Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38159 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728997AbfD3BBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 21:01:51 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Date: Mon, 29 Apr 2019 18:00:38 -0700
Message-Id: <20190430010037.6216-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <natechancellor@gmail.com>

This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
point, it has not been used because -Wuninitialized has been disabled,
which also turns off -Wsometimes-uninitialized, meaning that we miss out
on finding some bugs [1]. In my experience, it appears to be more
accurate than GCC and catch some things that GCC can't.

All of these warnings have now been fixed in -next across arm, arm64,
and x86_64 defconfig/allyesconfig so this should be enabled for everyone
to prevent more from easily creeping in.

As of next-20190429:

$ git log --oneline --grep="sometimes-uninitialized" | wc -l
45

[1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/

Link: https://github.com/ClangBuiltLinux/linux/issues/381
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Masahiro, I am not sure how you want to handle merging this with regards
to all of the patches floating around in -next but I wanted to send this
out to let everyone know this is ready to be turned on.

Arnd, are there many remaning -Wsometimes-uninitialized warnings in
randconfigs?

 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 768306add591..f4332981ea85 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
 KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
 KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
+KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
 endif
 endif
-- 
2.21.0
