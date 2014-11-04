Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:65250 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753285AbaKDKAM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 4 Nov 2014 05:00:12 -0500
From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
Subject: [PATCH] =?UTF-8?q?kconfig:=20Fix=20warning=20"=E2=80=98jump?= =?UTF-8?q?=E2=80=99=20may=20be=20used=20uninitialized"?=
Date: Tue,  4 Nov 2014 11:00:02 +0100
Message-Id: <1415095202-19556-1-git-send-email-syntheticpp@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>

Signed-off-by: Peter Kümmel <syntheticpp@gmx.net>
---
 scripts/kconfig/menu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a26cc5d..bb08960 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -548,7 +548,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 {
 	int i, j;
 	struct menu *submenu[8], *menu, *location = NULL;
-	struct jump_key *jump;
+	struct jump_key *jump = NULL;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
 	menu = prop->menu->parent;
@@ -586,7 +586,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		str_printf(r, _("  Location:\n"));
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
-			if (head && location && menu == location)
+			if (head && location && menu == location && jump)
 				jump->offset = strlen(r->s);
 			str_printf(r, "%*c-> %s", j, ' ',
 				   _(menu_get_prompt(menu)));
-- 
1.9.1

