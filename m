Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:36394 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387519AbfDRLSr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Apr 2019 07:18:47 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: re-enable int-in-bool-context warning
Date: Thu, 18 Apr 2019 20:18:22 +0900
Message-Id: <20190418111822.12660-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This warning was disabled by commit bd664f6b3e37 ("disable new
gcc-7.1.1 warnings for now") just because it was too noisy.

Thanks to Arnd Bergmann, (almost) all warnings have been fixed.
We are now ready to re-enable it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 459f37d9c482..adba08606f37 100644
--- a/Makefile
+++ b/Makefile
@@ -690,7 +690,6 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
-KBUILD_CFLAGS	+= $(call cc-disable-warning, int-in-bool-context)
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
 KBUILD_CFLAGS	+= -Os
-- 
2.17.1
