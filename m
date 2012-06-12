Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:43546 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805Ab2FLA3r (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jun 2012 20:29:47 -0400
Received: by vcbf11 with SMTP id f11so2491627vcb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jun 2012 17:29:46 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] kconfig/nconf: fix compile with ncurses reentrant API
Date: Mon, 11 Jun 2012 19:29:41 -0500
Message-Id: <1339460981-7568-1-git-send-email-yselkowitz@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

ESCDELAY is a global variable which is replaced by getter and setter
functions with NCURSES_REENTRANT.  This fixes the following error:

nconf.c: In function ‘main’:
nconf.c:1506:2: error: lvalue required as left operand of assignment

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
 scripts/kconfig/nconf.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 73070cb..eb9b87a 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1503,7 +1503,11 @@ int main(int ac, char **av)
 	}
 
 	notimeout(stdscr, FALSE);
+#if NCURSES_REENTRANT
+	set_escdelay(1);
+#else
 	ESCDELAY = 1;
+#endif
 
 	/* set btns menu */
 	curses_menu = new_menu(curses_menu_items);
-- 
1.7.9

