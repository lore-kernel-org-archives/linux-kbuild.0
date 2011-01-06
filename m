Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:39041 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243Ab1AFPmw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 6 Jan 2011 10:42:52 -0500
Received: by wyb28 with SMTP id 28so16513830wyb.19
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jan 2011 07:42:51 -0800 (PST)
From: Peter Korsgaard <jacmet@sunsite.dk>
Subject: [PATCH] nconf: handle comment entries within choice/endchoice
Date: Thu,  6 Jan 2011 16:42:45 +0100
Message-Id: <1294328565-2750-1-git-send-email-jacmet@sunsite.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, nir.tzachar@gmail.com, sam@ravnborg.org, linux-kbuild@vger.kernel.org
Cc: Peter Korsgaard <jacmet@sunsite.dk>

Equivalent to af6c1598 (kconfig: handle comment entries within
choice/endchoice), but for nconfig instead.

Implement support for comment entries within choice groups. Comment entries
are displayed visually distinct from normal configs, and selecting them is
a no-op.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 scripts/kconfig/nconf.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 272a987..f343105 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1266,9 +1266,13 @@ static void conf_choice(struct menu *menu)
 			if (child->sym == sym_get_choice_value(menu->sym))
 				item_make(child, ':', "<X> %s",
 						_(menu_get_prompt(child)));
-			else
+			else if (child->sym)
 				item_make(child, ':', "    %s",
 						_(menu_get_prompt(child)));
+			else
+				item_make(child, ':', "*** %s ***",
+						_(menu_get_prompt(child)));
+
 			if (child->sym == active){
 				last_top_row = top_row(curses_menu);
 				selected_index = i;
@@ -1334,7 +1338,7 @@ static void conf_choice(struct menu *menu)
 			break;
 
 		child = item_data();
-		if (!child || !menu_is_visible(child))
+		if (!child || !menu_is_visible(child) || !child->sym)
 			continue;
 		switch (res) {
 		case ' ':
-- 
1.7.1

