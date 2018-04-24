Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:43312 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751559AbeDXLH2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Apr 2018 07:07:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: replace hardcoded bison in cmd_bison_h with $(YACC)
Date: Tue, 24 Apr 2018 20:07:13 +0900
Message-Id: <1524568033-25026-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Commit 73a4f6dbe70a ("kbuild: add LEX and YACC variables") missed to
update cmd_bison_h somehow.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 07d0740..5af34a2b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -196,7 +196,7 @@ $(obj)/%.tab.c: $(src)/%.y FORCE
 	$(call if_changed,bison)
 
 quiet_cmd_bison_h = YACC    $@
-      cmd_bison_h = bison -o/dev/null --defines=$@ -t -l $<
+      cmd_bison_h = $(YACC) -o/dev/null --defines=$@ -t -l $<
 
 $(obj)/%.tab.h: $(src)/%.y FORCE
 	$(call if_changed,bison_h)
-- 
2.7.4

