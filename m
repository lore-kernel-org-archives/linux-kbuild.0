Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:64025 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729050AbeJAQWX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 12:22:23 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: add -Wdeclaration-after-statement flag unconditionally
Date: Mon,  1 Oct 2018 18:44:37 +0900
Message-Id: <1538387078-21892-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
References: <1538387078-21892-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We have raised the compiler requirement from time to time.
With commit cafa0010cd51 ("Raise the minimum required gcc version
to 4.6"), the minimum for GCC is 4.6 now.

This flag has been here since the pre-git era.  It is documented in
the GCC 4.6 manual, and it is recognized by Clang and ICC as well.

Let's rip off the cc-option switch, and see if somebody complains
about it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 505a324..8a23fee 100644
--- a/Makefile
+++ b/Makefile
@@ -797,7 +797,7 @@ endif
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
 # warn about C99 declaration after statement
-KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
+KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # disable pointer signed / unsigned warnings in gcc 4.0
 KBUILD_CFLAGS += -Wno-pointer-sign
-- 
2.7.4
