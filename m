Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46287 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfH0MUl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 08:20:41 -0400
From: Denis Efremov <efremov@linux.com>
Subject: [PATCH] modpost: add NOFAIL to strndup
Date: Tue, 27 Aug 2019 15:20:23 +0300
Message-Id: <20190827122023.15086-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Denis Efremov <efremov@linux.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Add NOFAIL check for the strndup call, because the function
allocates memory and can return NULL. All calls to strdup in
modpost are checked with NOFAIL.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..0255538528fe 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -795,9 +795,9 @@ static int match(const char *sym, const char * const pat[])
 
 		/* "*foo*" */
 		if (*p == '*' && *endp == '*') {
-			char *here, *bare = strndup(p + 1, strlen(p) - 2);
+			char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
+			char *here = strstr(sym, bare);
 
-			here = strstr(sym, bare);
 			free(bare);
 			if (here != NULL)
 				return 1;
-- 
2.21.0
