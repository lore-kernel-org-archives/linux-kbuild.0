Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:43870 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab1EWILM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:12 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so4551698iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:11 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 09/13] kconfig: migrate parser to implicit rules
Date: Mon, 23 May 2011 04:10:35 -0400
Message-Id: <1306138239-13440-10-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/.gitignore |    2 +-
 scripts/kconfig/Makefile   |   25 -------------------------
 scripts/kconfig/zconf.y    |    2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index 624f650..ee120d4 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -2,7 +2,7 @@
 # Generated files
 #
 config*
-lex.*.c
+*.lex.c
 *.tab.c
 *.tab.h
 zconf.hash.c
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 088ed9b..c9ec4d6 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -327,28 +327,3 @@ $(obj)/lkc_defs.h: $(src)/lkc_proto.h
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
 	intltool-extract --type=gettext/glade $(obj)/gconf.glade
 
-###
-# The following requires flex/bison/gperf
-# By default we use the _shipped versions, uncomment the following line if
-# you are modifying the flex/bison src.
-# LKC_GENPARSER := 1
-
-ifdef LKC_GENPARSER
-
-$(obj)/zconf.tab.c: $(src)/zconf.y
-$(obj)/lex.zconf.c: $(src)/zconf.l
-$(obj)/zconf.hash.c: $(src)/zconf.gperf
-
-%.tab.c: %.y
-	bison -l -b $* -p $(notdir $*) $<
-	cp $@ $@_shipped
-
-lex.%.c: %.l
-	flex -L -P$(notdir $*) -o$@ $<
-	cp $@ $@_shipped
-
-%.hash.c: %.gperf
-	gperf -C < $< > $@
-	cp $@ $@_shipped
-
-endif
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 8f8dc70..157d31f 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -735,7 +735,7 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "lex.zconf.c"
+#include "zconf.lex.c"
 #include "util.c"
 #include "confdata.c"
 #include "expr.c"
-- 
1.7.3.4.574.g608b.dirty

