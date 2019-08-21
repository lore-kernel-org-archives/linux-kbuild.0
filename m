Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:47224 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbfHURd0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 13:33:26 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: remove unneeded dependency for $(DOC_TARGETS)
Date: Thu, 22 Aug 2019 02:33:21 +0900
Message-Id: <20190821173321.15012-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
stopped using if_changed_rule. No more users of if_changed* for the
doc targets. Hence, fixdep is unneeded. Remove the dependency on
scripts_basic.

All the doc targets are phony. Depending on FORCE is odd.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c0be1a4dbfdd..7e54a821b4b0 100644
--- a/Makefile
+++ b/Makefile
@@ -1578,7 +1578,7 @@ $(help-board-dirs): help-%:
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
 	       linkcheckdocs dochelp refcheckdocs
 PHONY += $(DOC_TARGETS)
-$(DOC_TARGETS): scripts_basic FORCE
+$(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
 # Misc
-- 
2.17.1
