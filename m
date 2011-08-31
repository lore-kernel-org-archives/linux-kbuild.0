Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:38180 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754615Ab1HaHsN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 03:48:13 -0400
Received: by mail-iy0-f174.google.com with SMTP id u26so499798iab.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 00:48:13 -0700 (PDT)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH V2 1/6] scripts/kconfig/nconf: fix typo: unknow => unknown
Date: Wed, 31 Aug 2011 00:46:08 -0700
Message-Id: <1314776773-9560-2-git-send-email-crquan@gmail.com>
In-Reply-To: <1314776773-9560-1-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314776773-9560-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Nir Tzachar <nir.tzachar@gmail.com>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

Signed-off-by: Cheng Renquan <crquan@gmail.com>
Acked-by: Arnaud Lacombe <lacombar@gmail.com>
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

