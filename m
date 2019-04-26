Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54552 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfDZWWn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 18:22:43 -0400
From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] unicode: fix dereference of a potentially null pointer
Date: Fri, 26 Apr 2019 23:22:37 +0100
Message-Id: <20190426222237.13209-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'tree' is deferenced when assigning pointer 'trie', however
trie is being null checked a few lines later, so it could potentially
be null. Fix the potential null pointer dereference by only dereferencing
it after it has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: b08fcacaaaf4 ("unicode: introduce UTF-8 character database")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 scripts/mkutf8data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mkutf8data.c b/scripts/mkutf8data.c
index 12ce94b43be6..0563ba679bbb 100644
--- a/scripts/mkutf8data.c
+++ b/scripts/mkutf8data.c
@@ -2706,7 +2706,7 @@ static utf8leaf_t *utf8hangul(const char *str, unsigned char *hangul)
 static utf8leaf_t *utf8nlookup(struct tree *tree, unsigned char *hangul,
 			       const char *s, size_t len)
 {
-	utf8trie_t	*trie = utf8data + tree->index;
+	utf8trie_t	*trie;
 	int		offlen;
 	int		offset;
 	int		mask;
@@ -2716,6 +2716,7 @@ static utf8leaf_t *utf8nlookup(struct tree *tree, unsigned char *hangul,
 		return NULL;
 	if (len == 0)
 		return NULL;
+	trie = utf8data + tree->index;
 	node = 1;
 	while (node) {
 		offlen = (*trie & OFFLEN) >> OFFLEN_SHIFT;
-- 
2.20.1
