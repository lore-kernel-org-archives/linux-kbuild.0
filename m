Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:24208 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753015AbeGEDdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 23:33:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RESEND PATCH 1/2] Makefile: .PHONY is not a variable, but PHONY is
Date: Thu,  5 Jul 2018 12:33:07 +0900
Message-Id: <1530761588-9986-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

From: Ulf Magnusson <ulfalizer@gmail.com>

.PHONY is a target, not a variable.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Ulf sent this a long time ago.
https://patchwork.kernel.org/patch/7111711/
Unfortunately, it was lost for some reason.

I am resending to apply it if Ulf does not mind it.


 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 58bd78b..b610cb0 100644
--- a/Makefile
+++ b/Makefile
@@ -1720,6 +1720,6 @@ endif	# skip-makefile
 PHONY += FORCE
 FORCE:
 
-# Declare the contents of the .PHONY variable as phony.  We keep that
+# Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
-- 
2.7.4

