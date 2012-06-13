Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:43803 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551Ab2FMAFH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jun 2012 20:05:07 -0400
Received: by vcbf11 with SMTP id f11so3200347vcb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jun 2012 17:05:05 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] kconfig: check ncursesw headers first in check-lxdialog
Date: Tue, 12 Jun 2012 19:05:02 -0500
Message-Id: <1339545902-8812-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Commit 8c41e5e363db55d91aa3b1cdce4ab02ad9821de7 added a check for
ncursesw/curses.h for the case where ncurses and ncursesw are build
separately but only one is installed.  But if both are installed,
the headers ncurses/curses.h and ncursesw/curses.h differ, and since
libncursesw will be found first, so should ncursesw/curses.h.

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
Also applies to all 3.x stable branches

 scripts/kconfig/lxdialog/check-lxdialog.sh |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
index 82cc3a8..b75820b 100644
--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
+++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
@@ -19,12 +19,12 @@ ldflags()
 # Where is ncurses.h?
 ccflags()
 {
-	if [ -f /usr/include/ncurses/ncurses.h ]; then
+	if [ -f /usr/include/ncursesw/curses.h ]; then
+		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncursesw/curses.h>"'
+	elif [ -f /usr/include/ncurses/ncurses.h ]; then
 		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"'
 	elif [ -f /usr/include/ncurses/curses.h ]; then
 		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses/curses.h>"'
-	elif [ -f /usr/include/ncursesw/curses.h ]; then
-		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncursesw/curses.h>"'
 	elif [ -f /usr/include/ncurses.h ]; then
 		echo '-DCURSES_LOC="<ncurses.h>"'
 	else
-- 
1.7.9

