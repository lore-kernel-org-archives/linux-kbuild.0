Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:34638 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755086Ab1H2X6D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 19:58:03 -0400
Received: by mail-gy0-f174.google.com with SMTP id 6so5229544gya.19
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 16:58:03 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 5/5] scripts/kconfig/nconf: add KEY_HOME / KEY_END for dialog_inputbox
Date: Mon, 29 Aug 2011 16:56:04 -0700
Message-Id: <1314662164-8565-5-git-send-email-crquan@gmail.com>
In-Reply-To: <1314662164-8565-4-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314662164-8565-1-git-send-email-crquan@gmail.com>
 <1314662164-8565-2-git-send-email-crquan@gmail.com>
 <1314662164-8565-3-git-send-email-crquan@gmail.com>
 <1314662164-8565-4-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

to make it better when editing long strings;

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/nconf.gui.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 62a41d1..909c85f 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -468,6 +468,14 @@ int dialog_inputbox(WINDOW *main_window,
 				cursor_form_win--;
 			}
 			break;
+		case KEY_HOME:
+			cursor_position = 0;
+			cursor_form_win = 0;
+			break;
+		case KEY_END:
+			cursor_position = len;
+			cursor_form_win = min(cursor_position, prompt_width-1);
+			break;
 		default:
 			if ((isgraph(res) || isspace(res))) {
 				/* one for new char, one for '\0' */
-- 
1.7.6

