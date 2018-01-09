Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:27298 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751145AbeAIIb7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jan 2018 03:31:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] fixdep: use existing helper to check modular CONFIG options
Date: Tue,  9 Jan 2018 17:30:50 +0900
Message-Id: <1515486650-1141-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515486650-1141-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

str_ends_with() (it was strrcmp() before) was introduced to check if
the given token ends with a particular string.  Currently, it is used
to check file paths without $(srctree).

Actually, we have one more place where this helper is useful.  Use it
to check if CONFIG option ends with _MODULE.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 3881bf1..9642302 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -230,6 +230,17 @@ static void use_config(const char *m, int slen)
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
@@ -239,7 +250,7 @@ static void parse_config_file(const char *p)
 		q = p;
 		while (*q && (isalnum(*q) || *q == '_'))
 			q++;
-		if (memcmp(q - 7, "_MODULE", 7) == 0)
+		if (str_ends_with(p, q - p, "_MODULE"))
 			r = q - 7;
 		else
 			r = q;
@@ -249,17 +260,6 @@ static void parse_config_file(const char *p)
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
 static void *load_file(const char *filename)
 {
 	struct stat st;
-- 
2.7.4

