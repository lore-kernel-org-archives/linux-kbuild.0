Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61982 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752473Ab1EECDo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 May 2011 22:03:44 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so1461966iwn.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 May 2011 19:03:43 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 7/9] kbuild: merge parser generation rules
Date: Wed,  4 May 2011 22:03:22 -0400
Message-Id: <1304561004-2684-8-git-send-email-lacombar@gmail.com>
In-Reply-To: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
References: <1304561004-2684-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/Makefile.lib      |   31 ++++++++++++++++++++++++++++++-
 scripts/genksyms/Makefile |   20 --------------------
 scripts/kconfig/Makefile  |   25 -------------------------
 3 files changed, 30 insertions(+), 46 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1c702ca..74a73de 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -160,13 +160,42 @@ ld_flags       = $(LDFLAGS) $(ldflags-y)
 modname-multi = $(sort $(foreach m,$(multi-used),\
 		$(if $(filter $(subst $(obj)/,,$*.o), $($(m:.o=-objs)) $($(m:.o=-y))),$(m:.o=))))
 
+ifdef REGENERATE_PARSERS
+# GPERF
+# ---------------------------------------------------------------------------
+quiet_cmd_gperf = GPERF $@
+      cmd_gperf = gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
+$(src)/%.hash.c_shipped: $(src)/%.gperf
+	$(call cmd,gperf)
+
+# LEX
+# ---------------------------------------------------------------------------
+quiet_cmd_flex = LEX     $@
+      cmd_flex = flex -L -P$(notdir $*) -o$@ $<
+$(src)/lex.%.c_shipped: $(src)/%.l
+	$(call cmd,flex)
+
+# YACC
+# ---------------------------------------------------------------------------
+quiet_cmd_bison = YACC    $@
+      cmd_bison = bison -o$@ -l -b $* -p $(notdir $*) $<
+$(src)/%.tab.c_shipped: $(src)/%.y
+	$(call cmd,bison)
+endif
+
 # Shipped files
 # ===========================================================================
 
 quiet_cmd_shipped = SHIPPED $@
 cmd_shipped = cat $< > $@
 
-$(obj)/%:: $(src)/%_shipped
+$(obj)/%.tab.c: $(src)/%.tab.c_shipped
+	$(call cmd,shipped)
+
+$(obj)/lex.%.c: $(src)/lex.%.c_shipped
+	$(call cmd,shipped)
+
+$(obj)/%.hash.c: $(src)/%.hash.c_shipped
 	$(call cmd,shipped)
 
 # Commands useful for building a boot image
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index de6675d..e3295a8 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -14,23 +14,3 @@ clean-files	:= genksyms.tab.c lex.genksyms.c genksyms.hash.c
 
 $(obj)/genksyms.tab.o: $(obj)/lex.genksyms.c $(obj)/genksyms.hash.c
 
-ifdef GENKSYMS_GENPARSER
-
-$(obj)/genksyms.tab.c: $(src)/genksyms.y
-$(obj)/lex.genksyms.c: $(src)/genksyms.l
-$(obj)/genksyms.hash.c: $(src)/genksyms.gperf
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
-	gperf -t --output-file $@ -a -C -E -g -k 1,3,$$ -p -t $<
-	cp $@ $@_shipped
-
-endif
-
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 368ae30..c9ec4d6 100644
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
-	gperf < $< > $@
-	cp $@ $@_shipped
-
-endif
-- 
1.7.3.4.574.g608b.dirty

