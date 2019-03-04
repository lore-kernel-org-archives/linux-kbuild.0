Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:46398 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfCDO1f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Mar 2019 09:27:35 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove build target scripts/basic/%
Date: Mon,  4 Mar 2019 23:27:19 +0900
Message-Id: <1551709639-14681-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This build rule was introduced by commit cd05e6bdc600 ("[PATCH]
kbuild: fix split-include dependency") to handle the dependency of
scripts/basic/split-include.

Now, fixdep is the only tool in scripts/basic/, and this rule is
no longer used.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Makefile b/Makefile
index ade8709..cfb49aa 100644
--- a/Makefile
+++ b/Makefile
@@ -477,9 +477,6 @@ scripts_basic:
 	$(Q)$(MAKE) $(build)=scripts/basic
 	$(Q)rm -f .tmp_quiet_recordmcount
 
-# To avoid any implicit rule to kick in, define an empty command.
-scripts/basic/%: scripts_basic ;
-
 PHONY += outputmakefile
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
-- 
2.7.4
