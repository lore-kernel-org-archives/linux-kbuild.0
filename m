Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:41884 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab1EECDh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:37 -0400
Received: by iwn34 with SMTP id 34so1462033iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:37 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 2/9] genksyms: finalize rename
Date: Wed,  4 May 2011 22:03:17 -0400
Message-Id: <1304561004-2684-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/genksyms/.gitignore |    6 ++--
 scripts/genksyms/Makefile   |   45 +++++++++++++-----------------------------
 scripts/genksyms/genksyms.c |   11 ++++-----
 scripts/genksyms/genksyms.l |    7 ++---
 scripts/genksyms/genksyms.y |    2 +
 5 files changed, 27 insertions(+), 44 deletions(-)

diff --git a/scripts/genksyms/.gitignore b/scripts/genksyms/.gitignore
index be5cadb..0983577 100644
--- a/scripts/genksyms/.gitignore
+++ b/scripts/genksyms/.gitignore
@@ -1,4 +1,4 @@
-keywords.c
-lex.c
-parse.[ch]
 genksyms
+genksyms.tab.c
+lex.genksyms.c
+genksyms.hash.c
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index e420fe4..82bb25f 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -2,52 +2,35 @@
 hostprogs-y	:= genksyms
 always		:= $(hostprogs-y)
 
-genksyms-objs	:= genksyms.o parse.o lex.o
+genksyms-objs	:= genksyms.o genksyms.tab.o
 
 # -I needed for generated C source (shipped source)
 HOSTCFLAGS_parse.o := -Wno-uninitialized -I$(src)
 
-# dependencies on generated files need to be listed explicitly
-$(obj)/lex.o: $(obj)/parse.h $(obj)/keywords.c
-
 # -I needed for generated C source (shipped source)
 HOSTCFLAGS_lex.o := -I$(src)
 
-ifdef GENERATE_PARSER
-
-# gperf
+clean-files	:= genksyms.tab.c lex.genksyms.c genksyms.hash.c
 
-quiet_cmd_keywords.c = GPERF   $@
-      cmd_keywords.c = gperf -L ANSI-C -a -C -E -g -H is_reserved_hash	\
-		       -k 1,3,$$ -N is_reserved_word -p -t $< > $@
-
-$(obj)/keywords.c: $(obj)/keywords.gperf FORCE
-	$(call if_changed,keywords.c)
-	cp $@ $@_shipped
+$(obj)/genksyms.tab.o: $(obj)/lex.genksyms.c $(obj)/genksyms.hash.c
 
-# flex
+ifdef GENKSYMS_GENPARSER
 
-quiet_cmd_lex.c = FLEX    $@
-      cmd_lex.c = flex -o$@ -d $< $(obj)/parse.h
+$(obj)/genksyms.tab.c: $(src)/genksyms.y
+$(obj)/lex.genksyms.c: $(src)/genksyms.l
+$(obj)/genksyms.hash.c: $(src)/genksyms.gperf
 
-$(obj)/lex.c: $(obj)/lex.l $(obj)/parse.h $(obj)/keywords.c FORCE
-	$(call if_changed,lex.c)
+%.tab.c: %.y
+	bison -l -b $* -p $(notdir $*) $<
 	cp $@ $@_shipped
 
-# bison
-
-quiet_cmd_parse.c = BISON   $@
-      cmd_parse.c = bison -o$@ -dtv $(filter-out FORCE,$^)
-
-$(obj)/parse.c: $(obj)/parse.y FORCE
-	$(call if_changed,parse.c)
+lex.%.c: %.l
+	flex -L -P$(notdir $*) -o$@ $<
 	cp $@ $@_shipped
-	cp $(@:.c=.h) $(@:.c=.h)_shipped
 
-$(obj)/parse.h: $(obj)/parse.c ;
-
-clean-files	+= parse.output
+%.hash.c: %.gperf
+	gperf -t --output-file $@ -L ANSI-C -a -C -E -g -H is_reserved_hash -k 1,3,$$ -N is_reserved_word -p -t $<
+	cp $@ $@_shipped
 
 endif
 
-targets += keywords.c lex.c parse.c parse.h
diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index f99115e..034c30b 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -748,11 +748,10 @@ int main(int argc, char **argv)
 	if ((strcmp(arch, "h8300") == 0) || (strcmp(arch, "blackfin") == 0))
 		mod_prefix = "_";
 	{
-		extern int yydebug;
-		extern int yy_flex_debug;
-
-		yydebug = (flag_debug > 1);
-		yy_flex_debug = (flag_debug > 2);
+#ifdef YYDEBUG
+		extern int genksymsdebug = (flag_debug > 1);
+#endif
+		genksymsset_debug(flag_debug > 2);
 
 		debugfile = stderr;
 		/* setlinebuf(debugfile); */
@@ -763,7 +762,7 @@ int main(int argc, char **argv)
 		fclose(ref_file);
 	}
 
-	yyparse();
+	genksymsparse();
 
 	if (flag_dump_types && visited_symbols) {
 		while (visited_symbols != (struct symbol *)-1L) {
diff --git a/scripts/genksyms/genksyms.l b/scripts/genksyms/genksyms.l
index fe50ff9..06953f0 100644
--- a/scripts/genksyms/genksyms.l
+++ b/scripts/genksyms/genksyms.l
@@ -29,11 +29,10 @@
 #include <ctype.h>
 
 #include "genksyms.h"
-#include "parse.h"
 
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
-#define YY_DECL		static int yylex1(void)
+#define YY_DECL		static int genksymslex1(void)
 
 %}
 
@@ -98,7 +97,7 @@ MC_TOKEN		([~%^&*+=|<>/-]=)|(&&)|("||")|(->)|(<<)|(>>)
 
 /* Bring in the keyword recognizer.  */
 
-#include "keywords.c"
+#include "genksyms.hash.c"
 
 
 /* Macros to append to our phrase collection list.  */
@@ -141,7 +140,7 @@ yylex(void)
     }
 
 repeat:
-  token = yylex1();
+  token = genksymslex1();
 
   if (token == 0)
     return 0;
diff --git a/scripts/genksyms/genksyms.y b/scripts/genksyms/genksyms.y
index 09a265c..bff24d4 100644
--- a/scripts/genksyms/genksyms.y
+++ b/scripts/genksyms/genksyms.y
@@ -471,3 +471,5 @@ yyerror(const char *e)
 {
   error_with_pos("%s", e);
 }
+
+#include "lex.genksyms.c"
-- 
1.7.3.4.574.g608b.dirty

