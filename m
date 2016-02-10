Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:21848 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751456AbcBJFIj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Feb 2016 00:08:39 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v2 3/6] fixdep: minor cleanup
Date: Wed, 10 Feb 2016 00:08:25 -0500
Message-id: <1455080908-22272-4-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1455080908-22272-1-git-send-email-nicolas.pitre@linaro.org>
References: <1455080908-22272-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

Simple code reorganization to make coming changes more obvious.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 scripts/basic/fixdep.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 5b327c67a8..63f129021d 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -236,21 +236,20 @@ static void parse_config_file(const char *map, size_t len)
 			continue;
 		p += 7;
 		for (q = p; q < map + len; q++) {
-			if (!(isalnum(*q) || *q == '_'))
-				goto found;
+			if (!(isalnum(*q) || *q == '_')) {
+				if (!memcmp(q - 7, "_MODULE", 7))
+					q -= 7;
+				if (q - p > 0)
+					use_config(p, q - p);
+				break;
+			}
 		}
 		continue;
 
-	found:
-		if (!memcmp(q - 7, "_MODULE", 7))
-			q -= 7;
-		if (q - p < 0)
-			continue;
-		use_config(p, q - p);
 	}
 }
 
-/* test is s ends in sub */
+/* test if s ends in sub */
 static int strrcmp(const char *s, const char *sub)
 {
 	int slen = strlen(s);
-- 
2.5.0

