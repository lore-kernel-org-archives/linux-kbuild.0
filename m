Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:54929 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755678Ab0EYAvJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 May 2010 20:51:09 -0400
From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH] kbuild: kallsysms: throw away result of fgets()
Date: Tue, 25 May 2010 01:51:00 +0100
Message-Id: <1274748661-15253-3-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1274748661-15253-1-git-send-email-ben-linux@fluff.org>
References: <1274748661-15253-1-git-send-email-ben-linux@fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

fgets() is being used to skip a line, so throw the result away
to remove the following warning:

scripts/kallsyms.c: In function ‘read_symbol’:
scripts/kallsyms.c:112: warning: ignoring return value of ‘fgets’, declared with attribute warn_unused_result

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

tmp-fix-kallsysms
---
 scripts/kallsyms.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 86c3896..87c3d38 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -109,7 +109,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	if (rc != 3) {
 		if (rc != EOF) {
 			/* skip line */
-			fgets(str, 500, in);
+			char *tmp = fgets(str, 500, in);
+
+			/* shut unused-result warning up */
+			if (!tmp)
+				str[0] = '\0';
 		}
 		return -1;
 	}
-- 
1.6.3.3

