Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:42540 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703AbZGFEHY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jul 2009 00:07:24 -0400
Received: by mail-fx0-f218.google.com with SMTP id 18so3686080fxm.37
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jul 2009 21:07:28 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 6 Jul 2009 00:07:28 -0400
Message-ID: <1a69a9d80907052107n5b76f218nb79bd7200dcc3533@mail.gmail.com>
Subject: [PATCH 2/2] Kconfig: initialize the screen before using curses(3)
	functions
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>

This is needed on non ncurses based implementation to get a properly
initialized `stdscr' in main().
---
 scripts/kconfig/mconf.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 3bcacb4..25b60bc 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -888,6 +888,8 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}

+	initscr();
+
 	getyx(stdscr, saved_y, saved_x);
 	if (init_dialog(NULL)) {
 		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
-- 
1.6.3.3.385.g60647.dirty
