Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef009-v.nifty.com ([210.131.4.246]:40084 "EHLO
	condef009-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751053AbbGXFVx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 24 Jul 2015 01:21:53 -0400
Received: from conuserg010-v.nifty.com ([10.16.229.197])by condef009-v.nifty.com with ESMTP id t6O5JNW6021264
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Jul 2015 14:19:23 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: fixdep: drop meaningless hash table initialization
Date: Fri, 24 Jul 2015 14:18:46 +0900
Message-Id: <1437715126-6421-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
References: <1437715126-6421-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The clear_config() is called just once at the beginning of this
program, but the global variable hashtab[] is already zero-filled
at the start-up.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/fixdep.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 46cc1b3..c68fd61 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -192,23 +192,6 @@ static void define_config(const char *name, int len, unsigned int hash)
 }
 
 /*
- * Clear the set of configuration strings.
- */
-static void clear_config(void)
-{
-	struct item *aux, *next;
-	unsigned int i;
-
-	for (i = 0; i < HASHSZ; i++) {
-		for (aux = hashtab[i]; aux; aux = next) {
-			next = aux->next;
-			free(aux);
-		}
-		hashtab[i] = NULL;
-	}
-}
-
-/*
  * Record the use of a CONFIG_* word.
  */
 static void use_config(const char *m, int slen)
@@ -325,8 +308,6 @@ static void parse_dep_file(void *map, size_t len)
 	int saw_any_target = 0;
 	int is_first_dep = 0;
 
-	clear_config();
-
 	while (m < end) {
 		/* Skip any "white space" */
 		while (m < end && (*m == ' ' || *m == '\\' || *m == '\n'))
-- 
1.9.1

