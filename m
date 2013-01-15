Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:37811 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934126Ab3AOXNJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Jan 2013 18:13:09 -0500
Received: by mail-pa0-f52.google.com with SMTP id fb1so403123pad.39
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Jan 2013 15:13:09 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 2/3] menuconfig: Get rid of the top-level entries for "Load an Alternate/Save an Alternate"
Date: Wed, 16 Jan 2013 00:12:54 +0100
Message-Id: <1bdbac478a858d2aa73a6784c7c2e09de0f6d06b.1358291451.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1358291451.git.yann.morin.1998@free.fr>
References: <cover.1358291451.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1358291451.git.yann.morin.1998@free.fr>
References: <cover.1358291451.git.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, Wang YanQing <udknight@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

From: Wang YanQing <udknight@gmail.com>

Now we have Load/Save buttons to do the Load/Save
in the convenient place, so we can drop the
top-level entries.

Signed-off-by: Wang YanQing <udknight@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/mconf.c |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 88e8068..680135e 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -599,14 +599,6 @@ static void conf(struct menu *menu, struct menu *active_menu)
 		build_conf(menu);
 		if (!child_count)
 			break;
-		if (menu == &rootmenu) {
-			item_make("--- ");
-			item_set_tag(':');
-			item_make(_("    Load an Alternate Configuration File"));
-			item_set_tag('L');
-			item_make(_("    Save an Alternate Configuration File"));
-			item_set_tag('S');
-		}
 		dialog_clear();
 		res = dialog_menu(prompt ? _(prompt) : _("Main Menu"),
 				  _(menu_instructions),
@@ -643,12 +635,6 @@ static void conf(struct menu *menu, struct menu *active_menu)
 			case 's':
 				conf_string(submenu);
 				break;
-			case 'L':
-				conf_load();
-				break;
-			case 'S':
-				conf_save();
-				break;
 			}
 			break;
 		case 2:
-- 
1.7.2.5

