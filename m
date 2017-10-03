Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:49712 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750865AbdJCXyD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 19:54:03 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kbuild: Fix optimization level choice default
Date: Wed,  4 Oct 2017 01:53:26 +0200
Message-Id: <1507074806-21577-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, paulmck@linux.vnet.ibm.com, nicolas.pitre@linaro.org, akpm@linux-foundation.org, tj@kernel.org, tglx@linutronix.de, keescook@chromium.org, daniel@zonque.org, arnd@arndb.de, Ulf Magnusson <ulfalizer@gmail.com>

The choice containing the CC_OPTIMIZE_FOR_PERFORMANCE symbol
accidentally added a "CONFIG_" prefix when trying to make it the
default, selecting an undefined symbol as the default.

The mistake is harmless here: Since the default symbol is not visible,
the choice falls back on using the visible symbol as the default
instead, which is CC_OPTIMIZE_FOR_PERFORMANCE, as intended.

A patch that makes Kconfig print a warning in this case has been
submitted separately:
http://www.spinics.net/lists/linux-kbuild/msg15566.html

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 78cb246..3c1faaa 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1033,7 +1033,7 @@ endif
 
 choice
 	prompt "Compiler optimization level"
-	default CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
+	default CC_OPTIMIZE_FOR_PERFORMANCE
 
 config CC_OPTIMIZE_FOR_PERFORMANCE
 	bool "Optimize for performance"
-- 
2.7.4

