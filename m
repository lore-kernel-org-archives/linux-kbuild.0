Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28079 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbeLNIGO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Dec 2018 03:06:14 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: add -Werror=implicit-int flag unconditionally
Date: Fri, 14 Dec 2018 17:05:39 +0900
Message-Id: <1544774739-13471-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544774739-13471-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This flag is documented in the GCC 4.6 manual, and recognized by
Clang as well. Let's rip off the cc-option switch.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index bcb943e..b63699b 100644
--- a/Makefile
+++ b/Makefile
@@ -425,7 +425,7 @@ LINUXINCLUDE    := \
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
-		   -Werror-implicit-function-declaration \
+		   -Werror-implicit-function-declaration -Werror=implicit-int \
 		   -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
@@ -825,9 +825,6 @@ KBUILD_CFLAGS  += $(call cc-option,-fno-stack-check,)
 # conserve stack if available
 KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
 
-# disallow errors like 'EXPORT_GPL(foo);' with missing header
-KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
-
 # Prohibit date/time macros, which would make the build non-deterministic
 KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 
-- 
2.7.4
