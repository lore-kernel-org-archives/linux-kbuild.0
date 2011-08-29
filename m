Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:59561 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754806Ab1H2X54 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 19:57:56 -0400
Received: by gxk21 with SMTP id 21so5245969gxk.19
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 16:57:56 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 2/5] scripts/kconfig/nconf: fix memmove's length arg
Date: Mon, 29 Aug 2011 16:56:01 -0700
Message-Id: <1314662164-8565-2-git-send-email-crquan@gmail.com>
In-Reply-To: <1314662164-8565-1-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314662164-8565-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

In case KEY_BACKSPACE or KEY_DC to delete a char, it memmove only
(len-cursor_position+1) bytes;
the default case is to insert a char, it should also memmove only
(len-cursor_position+1) bytes;

the original use of (len+1) is wrong and may access following memory
that doesn't belong to result, may cause SegFault in theroy;

	case KEY_BACKSPACE:
		if (cursor_position > 0) {
			memmove(&result[cursor_position-1],
					&result[cursor_position],
					len-cursor_position+1);
			cursor_position--;
		}
		break;
	case KEY_DC:
		if (cursor_position >= 0 && cursor_position < len) {
			memmove(&result[cursor_position],
					&result[cursor_position+1],
					len-cursor_position+1);
		}
		break;
	default:
		if ((isgraph(res) || isspace(res)) &&
				len-2 < result_len) {
			/* insert the char at the proper position */
			memmove(&result[cursor_position+1],
					&result[cursor_position],
					len-cursor_position+1);
			result[cursor_position] = res;
			cursor_position++;
		}

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/nconf.gui.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index d3af04e..3ce2a7c 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -457,7 +457,7 @@ int dialog_inputbox(WINDOW *main_window,
 				/* insert the char at the proper position */
 				memmove(&result[cursor_position+1],
 						&result[cursor_position],
-						len+1);
+						len-cursor_position+1);
 				result[cursor_position] = res;
 				cursor_position++;
 			} else {
-- 
1.7.6

