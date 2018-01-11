Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60577 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932665AbeAKNG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:06:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 7/7] fixdep: use existing helper to check modular CONFIG options
Date: Thu, 11 Jan 2018 22:05:46 +0900
Message-Id: <1515675946-7514-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515675946-7514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

str_ends_with() tests if the given token ends with a particular string.
Currently, it is used to check file paths without $(srctree).

Actually, we have one more place where this helper is useful.  Use it
to check if CONFIG option ends with _MODULE.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/basic/fixdep.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 0abc15778..fa3d39b6 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -219,6 +219,17 @@ static void use_config(const char *m, int slen)
 	print_config(m, slen);
 }
 
+/* test if s ends in sub */
+static int str_ends_with(const char *s, int slen, const char *sub)
+{
+	int sublen = strlen(sub);
+
+	if (sublen > slen)
+		return 0;
+
+	return !memcmp(s + slen - sublen, sub, sublen);
+}
+
 static void parse_config_file(const char *p)
 {
 	const char *q, *r;
@@ -228,7 +239,7 @@ static void parse_config_file(const char *p)
 		q = p;
 		while (*q && (isalnum(*q) || *q == '_'))
 			q++;
-		if (memcmp(q - 7, "_MODULE", 7) == 0)
+		if (str_ends_with(p, q - p, "_MODULE"))
 			r = q - 7;
 		else
 			r = q;
@@ -238,17 +249,6 @@ static void parse_config_file(const char *p)
 	}
 }
 
-/* test if s ends in sub */
-static int str_ends_with(const char *s, int slen, const char *sub)
-{
-	int sublen = strlen(sub);
-
-	if (sublen > slen)
-		return 0;
-
-	return !memcmp(s + slen - sublen, sub, sublen);
-}
-
 static void *read_file(const char *filename)
 {
 	struct stat st;
-- 
2.7.4

