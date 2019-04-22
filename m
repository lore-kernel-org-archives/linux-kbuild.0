Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730203AbfDVTrU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Apr 2019 15:47:20 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 64/68] kconfig/[mn]conf: handle backspace (^H) key
Date: Mon, 22 Apr 2019 15:45:12 -0400
Message-Id: <20190422194516.11634-64-sashal@kernel.org>
In-Reply-To: <20190422194516.11634-1-sashal@kernel.org>
References: <20190422194516.11634-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Changbin Du <changbin.du@gmail.com>

[ Upstream commit 9c38f1f044080392603c497ecca4d7d09876ff99 ]

Backspace is not working on some terminal emulators which do not send the
key code defined by terminfo. Terminals either send '^H' (8) or '^?' (127).
But currently only '^?' is handled. Let's also handle '^H' for those
terminals.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 scripts/kconfig/lxdialog/inputbox.c | 3 ++-
 scripts/kconfig/nconf.c             | 2 +-
 scripts/kconfig/nconf.gui.c         | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index fe82ff6d744e..b15c8d1744f5 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -126,7 +126,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 			case KEY_DOWN:
 				break;
 			case KEY_BACKSPACE:
-			case 127:
+			case 8:   /* ^H */
+			case 127: /* ^? */
 				if (pos) {
 					wattrset(dialog, dlg.inputbox.atr);
 					if (input_x == 0) {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 1ef232ae5ab9..c8ff1c99dd5c 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1049,7 +1049,7 @@ static int do_match(int key, struct match_state *state, int *ans)
 		state->match_direction = FIND_NEXT_MATCH_UP;
 		*ans = get_mext_match(state->pattern,
 				state->match_direction);
-	} else if (key == KEY_BACKSPACE || key == 127) {
+	} else if (key == KEY_BACKSPACE || key == 8 || key == 127) {
 		state->pattern[strlen(state->pattern)-1] = '\0';
 		adj_match_dir(&state->match_direction);
 	} else
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 88874acfda36..820fc9256532 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -440,7 +440,8 @@ int dialog_inputbox(WINDOW *main_window,
 		case KEY_F(F_EXIT):
 		case KEY_F(F_BACK):
 			break;
-		case 127:
+		case 8:   /* ^H */
+		case 127: /* ^? */
 		case KEY_BACKSPACE:
 			if (cursor_position > 0) {
 				memmove(&result[cursor_position-1],
-- 
2.19.1
