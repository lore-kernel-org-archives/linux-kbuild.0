Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef001-v.nifty.com ([210.131.4.238]:55730 "EHLO
	condef001-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753365AbbGXFUX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 01:20:23 -0400
Received: from conuserg010-v.nifty.com ([10.16.229.197])by condef001-v.nifty.com with ESMTP id t6O5JNHf003884
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2015 14:19:23 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] kbuild: fixdep: optimize code slightly
Date: Fri, 24 Jul 2015 14:18:45 +0900
Message-Id: <1437715126-6421-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
References: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

If the target string matches "CONFIG_", move the pointer p
forward.  This saves several 7-chars adjustments.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index b304068..46cc1b3 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -251,7 +251,8 @@ static void parse_config_file(const char *map, size_t len)
 			continue;
 		if (memcmp(p, "CONFIG_", 7))
 			continue;
-		for (q = p + 7; q < map + len; q++) {
+		p += 7;
+		for (q = p; q < map + len; q++) {
 			if (!(isalnum(*q) || *q == '_'))
 				goto found;
 		}
@@ -260,9 +261,9 @@ static void parse_config_file(const char *map, size_t len)
 	found:
 		if (!memcmp(q - 7, "_MODULE", 7))
 			q -= 7;
-		if( (q-p-7) < 0 )
+		if (q - p < 0)
 			continue;
-		use_config(p+7, q-p-7);
+		use_config(p, q - p);
 	}
 }
 
-- 
1.9.1

