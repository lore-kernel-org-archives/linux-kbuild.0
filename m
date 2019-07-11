Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:59531 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbfGKFpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:55 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 03/11] kbuild: remove duplication from modules.order in sub-directories
Date: Thu, 11 Jul 2019 14:44:26 +0900
Message-Id: <20190711054434.1177-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Currently, only the top-level modules.order drops duplicated entries.

The modules.order files in sub-directories potentially contain
duplication. To list out the paths of all modules, I want to use
modules.order instead of parsing *.mod files in $(MODVERDIR).

To achieve this, I want to rip off duplication from modules.order
of external modules too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.build | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f21d691c776a..98dede0b2ca8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -423,13 +423,10 @@ endif # builtin-target
 #
 # Create commands to either record .ko file or cat modules.order from
 # a subdirectory
-modorder-cmds =						\
-	$(foreach m, $(modorder),			\
-		$(if $(filter %/modules.order, $m),	\
-			cat $m;, echo $m;))
-
 $(modorder-target): $(subdir-ym) FORCE
-	$(Q)(cat /dev/null; $(modorder-cmds)) > $@
+	$(Q){ $(foreach m, $(modorder), \
+	$(if $(filter %/modules.order, $m), cat $m, echo $m);) :; } \
+	| $(AWK) '!x[$$0]++' - > $@
 
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
-- 
2.17.1
