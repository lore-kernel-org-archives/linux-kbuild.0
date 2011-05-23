Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45855 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752713Ab1EWILF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:05 -0400
Received: by mail-iy0-f174.google.com with SMTP id 14so4457027iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:05 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 02/13] genksyms: include the lexer from the parser
Date: Mon, 23 May 2011 04:10:28 -0400
Message-Id: <1306138239-13440-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/genksyms/lex.l   |    3 ---
 scripts/genksyms/parse.y |    2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index e4ddd49..adf75b6 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -28,9 +28,6 @@
 #include <string.h>
 #include <ctype.h>
 
-#include "genksyms.h"
-#include "parse.h"
-
 /* We've got a two-level lexer here.  We let flex do basic tokenization
    and then we categorize those basic tokens in the second stage.  */
 #define YY_DECL		static int yylex1(void)
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index ba5c242..c15e353 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -497,3 +497,5 @@ yyerror(const char *e)
 {
   error_with_pos("%s", e);
 }
+
+#include "lex.lex.c"
-- 
1.7.3.4.574.g608b.dirty

