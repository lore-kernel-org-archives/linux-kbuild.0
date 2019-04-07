Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57862 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbfDGKD0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Apr 2019 06:03:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unneeded dependency for include/config/kernel.release
Date: Sun,  7 Apr 2019 19:03:18 +0900
Message-Id: <1554631398-29297-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This is unneeded since commit 43fee2b23895 ("kbuild: do not redirect
the first prerequisite for filechk").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 895022b..10643c3 100644
--- a/Makefile
+++ b/Makefile
@@ -1067,7 +1067,7 @@ filechk_kernel.release = \
 	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
 
 # Store (new) KERNELRELEASE string in include/config/kernel.release
-include/config/kernel.release: $(srctree)/Makefile FORCE
+include/config/kernel.release: FORCE
 	$(call filechk,kernel.release)
 
 # Additional helpers built in scripts/
-- 
2.7.4
