Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:36462 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753941Ab1EWILO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 May 2011 04:11:14 -0400
Received: by iyb14 with SMTP id 14so4457137iyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2011 01:11:14 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFCv2 11/13] dtc: include the lexer from the parser
Date: Mon, 23 May 2011 04:10:37 -0400
Message-Id: <1306138239-13440-12-git-send-email-lacombar@gmail.com>
In-Reply-To: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
References: <1306138239-13440-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, David Gibson <david@gibson.dropbear.id.au>

Cc: David Gibson <david@gibson.dropbear.id.au>
---
 scripts/dtc/dtc-lexer.l  |    1 -
 scripts/dtc/dtc-parser.y |    2 ++
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
index e866ea5..9fc1a95 100644
--- a/scripts/dtc/dtc-lexer.l
+++ b/scripts/dtc/dtc-lexer.l
@@ -36,7 +36,6 @@ LINECOMMENT	"//".*\n
 %{
 #include "dtc.h"
 #include "srcpos.h"
-#include "dtc-parser.tab.h"
 
 YYLTYPE yylloc;
 
diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
index 5e84a67..42bd7a3 100644
--- a/scripts/dtc/dtc-parser.y
+++ b/scripts/dtc/dtc-parser.y
@@ -343,3 +343,5 @@ static unsigned long long eval_literal(const char *s, int base, int bits)
 		print_error("bad literal");
 	return val;
 }
+
+#include "dtc-lexer.lex.c"
-- 
1.7.3.4.574.g608b.dirty

