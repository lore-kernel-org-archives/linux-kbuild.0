Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:46685 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbeKLNxc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Nov 2018 08:53:32 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove 'prepare' and 'scripts' dummies for external module build
Date: Mon, 12 Nov 2018 13:01:25 +0900
Message-Id: <1541995285-11144-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Make is lenient enough to ignore missing rules as long as they are marked
as PHONY. Remove dummy targets.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index 766a64e..7508243 100644
--- a/Makefile
+++ b/Makefile
@@ -1610,10 +1610,7 @@ help:
 	@echo  '  clean           - remove generated files in module directory only'
 	@echo  ''
 
-# Dummies...
 PHONY += prepare scripts
-prepare: ;
-scripts: ;
 endif # KBUILD_EXTMOD
 
 clean: $(clean-dirs)
-- 
2.7.4
