Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44747 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753933Ab1EWILP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:15 -0400
Received: by mail-iw0-f174.google.com with SMTP id 34so4551646iwn.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:15 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 12/13] dtc: migrate parser to implicit rules
Date: Mon, 23 May 2011 04:10:38 -0400
Message-Id: <1306138239-13440-13-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Cc: David Gibson <david@gibson.dropbear.id.au>
---
 scripts/dtc/Makefile |   29 ++---------------------------
 1 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 04a31c1..e448fb1 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -5,7 +5,7 @@ always		:= $(hostprogs-y)
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
-dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
+dtc-objs	+= dtc-parser.tab.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 
@@ -21,35 +21,10 @@ HOSTCFLAGS_srcpos.o := $(HOSTCFLAGS_DTC)
 HOSTCFLAGS_treesource.o := $(HOSTCFLAGS_DTC)
 HOSTCFLAGS_util.o := $(HOSTCFLAGS_DTC)
 
-HOSTCFLAGS_dtc-lexer.lex.o := $(HOSTCFLAGS_DTC)
 HOSTCFLAGS_dtc-parser.tab.o := $(HOSTCFLAGS_DTC)
 
 # dependencies on generated files need to be listed explicitly
-$(obj)/dtc-parser.tab.o: $(obj)/dtc-parser.tab.c $(obj)/dtc-parser.tab.h
-$(obj)/dtc-lexer.lex.o:  $(obj)/dtc-lexer.lex.c $(obj)/dtc-parser.tab.h
+$(obj)/dtc-parser.tab.o: $(obj)/dtc-lexer.lex.c
 
 targets += dtc-parser.tab.c dtc-lexer.lex.c
 
-clean-files += dtc-parser.tab.h
-
-# GENERATE_PARSER := 1		# Uncomment to rebuild flex/bison output
-
-ifdef GENERATE_PARSER
-
-BISON = bison
-FLEX = flex
-
-quiet_cmd_bison = BISON   $@
-      cmd_bison = $(BISON) -o$@ -d $<; cp $@ $@_shipped
-quiet_cmd_flex = FLEX    $@
-      cmd_flex = $(FLEX) -o$@ $<; cp $@ $@_shipped
-
-$(obj)/dtc-parser.tab.c: $(src)/dtc-parser.y FORCE
-        $(call if_changed,bison)
-
-$(obj)/dtc-parser.tab.h: $(obj)/dtc-parser.tab.c
-
-$(obj)/dtc-lexer.lex.c: $(src)/dtc-lexer.l FORCE
-        $(call if_changed,flex)
-
-endif
-- 
1.7.3.4.574.g608b.dirty

