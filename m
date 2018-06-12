Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37470 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933313AbeFLTIn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 15:08:43 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH v2] nconf: respect i-search pattern boundaries
Date: Tue, 12 Jun 2018 21:06:04 +0200
Message-Id: <20180612190604.4889-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: Dirk Gouders <dirk@gouders.net>

This patch adds boundary checks for nconf's i-search pattern.

Further, the pattern buffer is always bzero'ed when '/' is
pressed, so the second line in the code below was not needed (and
otherwise wouldn't have worked as expected):

	state->pattern[strlen(state->pattern)] = c;
	state->pattern[strlen(state->pattern)] = '\0';

Finally, the pattern length was reduced to a length that still
seems sufficient but will not fill more than the top line of the
screen, thus eliminating special treatment needs on resizes or normal
exit of i-search.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
---
Changes in v2: Correct S-O-B line, remove double search from subject.
---
 scripts/kconfig/nconf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 97b78445584b..0e224528aaf9 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1007,11 +1007,12 @@ static void adj_match_dir(match_f *match_direction)
 	/* else, do no change.. */
 }
 
+#define PATTERN_LENGTH 64
 struct match_state
 {
 	int in_search;
 	match_f match_direction;
-	char pattern[256];
+	char pattern[PATTERN_LENGTH];
 };
 
 /* Return 0 means I have handled the key. In such a case, ans should hold the
@@ -1035,8 +1036,8 @@ static int do_match(int key, struct match_state *state, int *ans)
 		return 1;
 
 	if (isalnum(c) || isgraph(c) || c == ' ') {
-		state->pattern[strlen(state->pattern)] = c;
-		state->pattern[strlen(state->pattern)] = '\0';
+		if (strlen(state->pattern) + 1 < PATTERN_LENGTH)
+			state->pattern[strlen(state->pattern)] = c;
 		adj_match_dir(&state->match_direction);
 		*ans = get_mext_match(state->pattern,
 				state->match_direction);
@@ -1049,7 +1050,8 @@ static int do_match(int key, struct match_state *state, int *ans)
 		*ans = get_mext_match(state->pattern,
 				state->match_direction);
 	} else if (key == KEY_BACKSPACE || key == 127) {
-		state->pattern[strlen(state->pattern)-1] = '\0';
+		if (state->pattern[0] != '\0')
+			state->pattern[strlen(state->pattern)-1] = '\0';
 		adj_match_dir(&state->match_direction);
 	} else
 		terminate_search = 1;
-- 
2.16.4

