Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:55780 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933003AbeALA7d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 19:59:33 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: remove unnecessary LEX_PREFIX and YACC_PREFIX
Date: Fri, 12 Jan 2018 09:58:21 +0900
Message-Id: <1515718701-4552-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515718701-4552-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Kconfig was the only user of these.  With Kconfig converted to use
the default 'yy' prefix, we do not need them any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0f9ef3f..5ff2761 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -188,10 +188,8 @@ endef
 
 # LEX
 # ---------------------------------------------------------------------------
-LEX_PREFIX = $(if $(LEX_PREFIX_${baseprereq}),$(LEX_PREFIX_${baseprereq}),yy)
-
 quiet_cmd_flex = LEX     $@
-      cmd_flex = $(LEX) -o$@ -L -P $(LEX_PREFIX) $<
+      cmd_flex = $(LEX) -o$@ -L $<
 
 ifdef REGENERATE_PARSERS
 .PRECIOUS: $(src)/%.lex.c_shipped
@@ -205,10 +203,8 @@ $(filter %.lex.c,$(targets)): $(obj)/%.lex.c: $(src)/%.l FORCE
 
 # YACC
 # ---------------------------------------------------------------------------
-YACC_PREFIX = $(if $(YACC_PREFIX_${baseprereq}),$(YACC_PREFIX_${baseprereq}),yy)
-
 quiet_cmd_bison = YACC    $@
-      cmd_bison = $(YACC) -o$@ -t -l -p $(YACC_PREFIX) $<
+      cmd_bison = $(YACC) -o$@ -t -l $<
 
 ifdef REGENERATE_PARSERS
 .PRECIOUS: $(src)/%.tab.c_shipped
-- 
2.7.4

