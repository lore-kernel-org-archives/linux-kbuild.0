Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36683 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbeJBIOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Oct 2018 04:14:02 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: add -Wno-unused-but-set-variable flag unconditionally
Date: Tue,  2 Oct 2018 10:32:23 +0900
Message-Id: <1538443943-29805-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

We have raised the compiler requirement from time to time.
With commit cafa0010cd51 ("Raise the minimum required gcc version
to 4.6"), the minimum for GCC is 4.6 now.

This flag was added by GCC 4.6, and it is recognized by ICC as well.

It is true that Clang does not support this flag but this commit is
just touching the else part of the "ifeq ($(cc-name),clang)" check.
Hence, Clang build is not affected.

Let's rip off the cc-disable-warning switch, and see if somebody
complains about it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Fix commit log

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8a23fee..2627266 100644
--- a/Makefile
+++ b/Makefile
@@ -716,7 +716,7 @@ else
 
 # These warnings generated too much noise in a regular build.
 # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
-KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
+KBUILD_CFLAGS += -Wno-unused-but-set-variable
 endif
 
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
-- 
2.7.4
