Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44747 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753887Ab1EWILH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:07 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so4551646iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:06 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 04/13] genksyms: migrate parser to implicit rules
Date: Mon, 23 May 2011 04:10:30 -0400
Message-Id: <1306138239-13440-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/genksyms/.gitignore |    6 ++--
 scripts/genksyms/Makefile   |   48 ++----------------------------------------
 scripts/genksyms/lex.l      |    2 +-
 3 files changed, 7 insertions(+), 49 deletions(-)

diff --git a/scripts/genksyms/.gitignore b/scripts/genksyms/.gitignore
index be5cadb..8b11ab4 100644
--- a/scripts/genksyms/.gitignore
+++ b/scripts/genksyms/.gitignore
@@ -1,4 +1,4 @@
-keywords.c
-lex.c
-parse.[ch]
+*.hash.c
+*.lex.c
+*.tab.c
 genksyms
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index 13d03cf..11d5582 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -2,52 +2,10 @@
 hostprogs-y	:= genksyms
 always		:= $(hostprogs-y)
 
-genksyms-objs	:= genksyms.o parse.o lex.o
+genksyms-objs	:= genksyms.o parse.tab.o
 
 # -I needed for generated C source (shipped source)
-HOSTCFLAGS_parse.o := -Wno-uninitialized -I$(src)
+HOSTCFLAGS_parse.tab.o := -Wno-uninitialized -I$(src)
 
-# dependencies on generated files need to be listed explicitly
-$(obj)/lex.o: $(obj)/parse.h $(obj)/keywords.c
+$(obj)/parse.tab.o: $(obj)/lex.lex.c $(obj)/keywords.hash.c
 
-# -I needed for generated C source (shipped source)
-HOSTCFLAGS_lex.o := -I$(src)
-
-ifdef GENERATE_PARSER
-
-# gperf
-
-quiet_cmd_keywords.c = GPERF   $@
-      cmd_keywords.c = gperf -L ANSI-C -a -C -E -g -H is_reserved_hash	\
-		       -k 1,3,$$ -N is_reserved_word -p -t $< > $@
-
-$(obj)/keywords.c: $(obj)/keywords.gperf FORCE
-	$(call if_changed,keywords.c)
-	cp $@ $@_shipped
-
-# flex
-
-quiet_cmd_lex.c = FLEX    $@
-      cmd_lex.c = flex -o$@ -d $<
-
-$(obj)/lex.c: $(obj)/lex.l $(obj)/keywords.c FORCE
-	$(call if_changed,lex.c)
-	cp $@ $@_shipped
-
-# bison
-
-quiet_cmd_parse.c = BISON   $@
-      cmd_parse.c = bison -o$@ -dtv $(filter-out FORCE,$^)
-
-$(obj)/parse.c: $(obj)/parse.y FORCE
-	$(call if_changed,parse.c)
-	cp $@ $@_shipped
-	cp $(@:.c=.h) $(@:.c=.h)_shipped
-
-$(obj)/parse.h: $(obj)/parse.c ;
-
-clean-files	+= parse.output
-
-endif
-
-targets += keywords.c lex.c parse.c parse.h
diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index adf75b6..fb881b6 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -91,7 +91,7 @@ MC_TOKEN		([~%^&*+=|<>/-]=)|(&&)|("||")|(->)|(<<)|(>>)
 
 /* Bring in the keyword recognizer.  */
 
-#include "keywords.c"
+#include "keywords.hash.c"
 
 
 /* Macros to append to our phrase collection list.  */
-- 
1.7.3.4.574.g608b.dirty

