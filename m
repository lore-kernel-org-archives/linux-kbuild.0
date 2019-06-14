Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37114 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNQxG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Jun 2019 12:53:06 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] kbuild: Enable -Wuninitialized
Date: Fri, 14 Jun 2019 09:52:42 -0700
Message-Id: <20190614165242.79257-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Nathan Chancellor <natechancellor@gmail.com>

This helps fine very dodgy behavior through both -Wuninitialized
(warning that a variable is always uninitialized) and
-Wsometimes-uninitialized (warning that a variable is sometimes
uninitialized, like GCC's -Wmaybe-uninitialized). These warnings
catch things that GCC doesn't such as:

https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/

We very much want to catch these so turn this warning on so that CI is
aware of it.

Link: https://github.com/ClangBuiltLinux/linux/issues/381
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 98081ab300e5..699683a7c116 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -71,6 +71,5 @@ KBUILD_CFLAGS += -Wno-unused-value
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
-KBUILD_CFLAGS += -Wno-uninitialized
 endif
 endif
-- 
2.22.0
