Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:23399 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfARIRC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jan 2019 03:17:02 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: descend to scripts/kconfig/ directly when syncconfig is needed
Date: Fri, 18 Jan 2019 17:16:52 +0900
Message-Id: <1547799412-20120-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

The recursion of the top Makefile is inefficient.
Just descend to scripts/kconfig/.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9851a44..d5f0ac4 100644
--- a/Makefile
+++ b/Makefile
@@ -631,7 +631,7 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
 # include/generated/ and include/config/. Update them if .config is newer than
 # include/config/auto.conf (which mirrors .config).
 include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
-	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
+	$(Q)$(MAKE) $(build)=scripts/kconfig syncconfig
 else
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
-- 
2.7.4
