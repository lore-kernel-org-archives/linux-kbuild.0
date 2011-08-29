Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:63989 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754806Ab1H2X6r (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Aug 2011 19:58:47 -0400
Received: by iabu26 with SMTP id u26so971269iab.19
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Aug 2011 16:58:47 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH 1/5] scripts/kconfig/nconf: fix typo: unknow => unknown
Date: Mon, 29 Aug 2011 16:56:00 -0700
Message-Id: <1314662164-8565-1-git-send-email-crquan@gmail.com>
In-Reply-To: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 scripts/kconfig/nconf.gui.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index f8137b3..d3af04e 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -461,7 +461,7 @@ int dialog_inputbox(WINDOW *main_window,
 				result[cursor_position] = res;
 				cursor_position++;
 			} else {
-				mvprintw(0, 0, "unknow key: %d\n", res);
+				mvprintw(0, 0, "unknown key: %d\n", res);
 			}
 			break;
 		}
-- 
1.7.6

