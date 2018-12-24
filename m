Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:53888 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbeLXOLR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Dec 2018 09:11:17 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unused cmd_gentimeconst
Date: Mon, 24 Dec 2018 23:11:09 +0900
Message-Id: <1545660669-15123-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

filechk_gentimeconst is always used instead of cmd_gentimeconst.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Kbuild b/Kbuild
index 640557d..4455dfd 100644
--- a/Kbuild
+++ b/Kbuild
@@ -25,10 +25,6 @@ timeconst-file := include/generated/timeconst.h
 
 targets += $(timeconst-file)
 
-quiet_cmd_gentimeconst = GEN     $@
-define cmd_gentimeconst
-	(echo $(CONFIG_HZ) | bc -q $< ) > $@
-endef
 define filechk_gentimeconst
 	(echo $(CONFIG_HZ) | bc -q $< )
 endef
-- 
2.7.4
