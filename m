Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28078 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLNIGN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 03:06:13 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: add -Werror=strict-prototype flag unconditionally
Date: Fri, 14 Dec 2018 17:05:38 +0900
Message-Id: <1544774739-13471-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

-Wstrict-prototype is added to KBUILD_CFLAGS first, then overridden
by -Werror=strict-prototype later.

Let's add -Werror=strict-prototypes unconditionally because it is
supported by GCC 4.6, and also by Clang.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3bbc16a..bcb943e 100644
--- a/Makefile
+++ b/Makefile
@@ -423,7 +423,7 @@ LINUXINCLUDE    := \
 		$(USERINCLUDE)
 
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
+KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
@@ -828,9 +828,6 @@ KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
 # disallow errors like 'EXPORT_GPL(foo);' with missing header
 KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
 
-# require functions to have arguments in prototypes, not empty 'int foo()'
-KBUILD_CFLAGS   += $(call cc-option,-Werror=strict-prototypes)
-
 # Prohibit date/time macros, which would make the build non-deterministic
 KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 
-- 
2.7.4
