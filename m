Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:45826 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTRKZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 13:10:25 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] init/Kconfig: rework help of CONFIG_CC_OPTIMIZE_FOR_SIZE
Date: Wed, 21 Aug 2019 02:09:39 +0900
Message-Id: <20190820170941.26193-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

CONFIG_CC_OPTIMIZE_FOR_SIZE was originally an independent boolean
option, but commit 877417e6ffb9 ("Kbuild: change CC_OPTIMIZE_FOR_SIZE
definition") turned it into a choice between _PERFORMANCE and _SIZE.

The phrase "If unsure, say N." sounds like an independent option.
Reword the help text to make it appropriate for the choice menu.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 init/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bf971b5c707d..149efd82447f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1219,10 +1219,8 @@ config CC_OPTIMIZE_FOR_SIZE
 	bool "Optimize for size"
 	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
 	help
-	  Enabling this option will pass "-Os" instead of "-O2" to
-	  your compiler resulting in a smaller kernel.
-
-	  If unsure, say N.
+	  Choosing this option will pass "-Os" to your compiler resulting
+	  in a smaller kernel.
 
 endchoice
 
-- 
2.17.1
