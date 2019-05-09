Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:59227 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725778AbfEIA6i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 20:58:38 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kbuild: re-enable int-in-bool-context warning
Date: Thu,  9 May 2019 09:58:01 +0900
Message-Id: <1557363481-27178-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This warning was disabled by commit bd664f6b3e37 ("disable new
gcc-7.1.1 warnings for now") just because it was too noisy.

Thanks to Arnd Bergmann, all warnings have been fixed. Now, we are
ready to re-enable it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---

Changes in v2:
  - rebase

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index a61a95b..2896518 100644
--- a/Makefile
+++ b/Makefile
@@ -692,7 +692,6 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
-KBUILD_CFLAGS	+= $(call cc-disable-warning, int-in-bool-context)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, address-of-packed-member)
 
 ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-- 
2.7.4
