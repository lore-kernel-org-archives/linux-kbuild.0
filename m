Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:28747 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727748AbeGTIfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 04:35:07 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 03/11] kconfig: remove unneeded directory generation from local*config
Date: Fri, 20 Jul 2018 16:46:28 +0900
Message-Id: <1532072796-7947-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit 17263baf958b ("kconfig: Create include/generated for
localmodconfig") added the 'mkdir' line because local{yes,mod}config
ran streamline_config.pl followed by silentoldconfig at that time.

Since commit 81d2bc227305 ("kconfig: invoke oldconfig instead of
silentoldconfig from local*config"), no sub-directory is required.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None

 scripts/kconfig/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f3c0e62..96a1c3d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -41,7 +41,6 @@ syncconfig: $(obj)/conf
 	$< $(silent) --$@ $(Kconfig)
 
 localyesconfig localmodconfig: $(obj)/conf
-	$(Q)mkdir -p include/config include/generated
 	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
-- 
2.7.4

