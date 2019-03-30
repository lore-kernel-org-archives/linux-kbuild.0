Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:36041 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730691AbfC3ME2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 08:04:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] kbuild: pass $(MAKECMDGOALS) to sub-make as is
Date: Sat, 30 Mar 2019 21:04:13 +0900
Message-Id: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Manipulating $(MAKECMDGOALS) for sub-make seems odd to me.

[1] 'make O=foo sub-make' is turned into 'make O=foo', which builds
the default targets. It would make sense to terminate the build with:

  *** No rule to make target 'sub-make'.  Stop.

[2] 'make O=foo defconfig _all' is turned into 'make O=foo defconfig',
which changes the behavior.

Let's pass $(MAKECMDGOALS) as is.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 92ad066..9cbd367 100644
--- a/Makefile
+++ b/Makefile
@@ -168,7 +168,7 @@ $(filter-out _all sub-make $(lastword $(MAKEFILE_LIST)), $(MAKECMDGOALS)) _all:
 sub-make:
 	$(Q)$(MAKE) \
 	$(if $(KBUILD_OUTPUT),-C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR)) \
-	-f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
+	-f $(CURDIR)/Makefile $(MAKECMDGOALS)
 
 endif # need-sub-make
 endif # sub_make_done
-- 
2.7.4
