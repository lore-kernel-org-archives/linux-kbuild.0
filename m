Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43245 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729430AbeKFAht (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 19:37:49 -0500
From: Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] init/Kconfig: make CC_OPTIMIZE_FOR_DEBUGGING visible only for GCC
Date: Mon,  5 Nov 2018 23:17:19 +0800
Message-Id: <20181105151719.4552-1-changbin.du@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>

Currently CC_OPTIMIZE_FOR_DEBUGGING is only able to build with GCC.
For clang, -Og optimization level could break kernel build. So make
CC_OPTIMIZE_FOR_DEBUGGING visible only for GCC.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 init/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/init/Kconfig b/init/Kconfig
index 0fb9c0b5f1a1..d5fb0ee1400a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1107,6 +1107,7 @@ config CC_OPTIMIZE_FOR_SIZE
 
 config CC_OPTIMIZE_FOR_DEBUGGING
 	bool "Optimize for better debugging experience (-Og)"
+	depends on CC_IS_GCC
 	depends on $(cc-option,-Og)
 	select NO_AUTO_INLINE
 	help
-- 
2.17.1
