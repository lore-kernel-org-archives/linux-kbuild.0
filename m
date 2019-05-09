Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:38135 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbfEIGqt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 02:46:49 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: add -Wvla flag unconditionally
Date: Thu,  9 May 2019 15:45:49 +0900
Message-Id: <20190509064549.1302-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux@googlegroups.com, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This flag is documented in the GCC 4.6 manual, and recognized by
Clang as well. Let's rip off the cc-option switch.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c71ffb6f55b5..3f5e8a0f4561 100644
--- a/Makefile
+++ b/Makefile
@@ -841,7 +841,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
-KBUILD_CFLAGS += $(call cc-option,-Wvla)
+KBUILD_CFLAGS += -Wvla
 
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += -Wno-pointer-sign
-- 
2.17.1
