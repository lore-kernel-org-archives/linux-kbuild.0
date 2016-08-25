Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:36028 "EHLO
        mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932568AbcHYJx1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Aug 2016 05:53:27 -0400
Received: by mail-pa0-f67.google.com with SMTP id ez1so2834969pab.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Aug 2016 02:53:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] kbuild: genksyms fix for typeof handling
Date: Thu, 25 Aug 2016 19:53:08 +1000
Message-Id: <20160825095308.23937-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Jan Beulich <jbeulich@suse.com>

The tokenizer misses counting an open-parenthesis when parsing a
non-trivial typeof beginning with an open-parenthesis. This function
in include/linux/ceph/libceph.h

static type *lookup_##name(struct rb_root *root,
                           typeof(((type *)0)->keyfld) key)

When instantiated in net/ceph/mon_client.c, causes subsequent symbols
including an EXPORT_SYMBOL in that file to be lost.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

---
 scripts/genksyms/lex.l | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index e583565..5235aa5 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -289,6 +289,23 @@ repeat:
 	}
       break;
 
+    case ST_TYPEOF_1:
+      if (token == IDENT)
+	{
+	  if (is_reserved_word(yytext, yyleng)
+	      || find_symbol(yytext, SYM_TYPEDEF, 1))
+	    {
+	      yyless(0);
+	      unput('(');
+	      lexstate = ST_NORMAL;
+	      token = TYPEOF_KEYW;
+	      break;
+	    }
+	  _APP("(", 1);
+	}
+	lexstate = ST_TYPEOF;
+	/* FALLTHRU */
+
     case ST_TYPEOF:
       switch (token)
 	{
@@ -313,24 +330,6 @@ repeat:
 	}
       break;
 
-    case ST_TYPEOF_1:
-      if (token == IDENT)
-	{
-	  if (is_reserved_word(yytext, yyleng)
-	      || find_symbol(yytext, SYM_TYPEDEF, 1))
-	    {
-	      yyless(0);
-	      unput('(');
-	      lexstate = ST_NORMAL;
-	      token = TYPEOF_KEYW;
-	      break;
-	    }
-	  _APP("(", 1);
-	}
-	APP;
-	lexstate = ST_TYPEOF;
-	goto repeat;
-
     case ST_BRACKET:
       APP;
       switch (token)
-- 
2.9.3

