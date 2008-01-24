Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37465 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757393AbYAXWEG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:06 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 47/77] kconfig: missing macros in gconfig
Date: Thu, 24 Jan 2008 23:03:28 +0100
Message-Id: <1201212238-4369-47-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

This patch adds missing gettext macros.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/gconf.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index df910cb..dfe748c 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -455,11 +455,15 @@ static void text_insert_help(struct menu *menu)
 {
 	GtkTextBuffer *buffer;
 	GtkTextIter start, end;
-	const char *prompt = menu_get_prompt(menu);
+	const char *prompt = _(menu_get_prompt(menu));
 	gchar *name;
 	const char *help;
 
-	help = _(menu_get_help(menu));
+	help = menu_get_help(menu);
+
+	/* Gettextize if the help text not empty */
+	if ((help != 0) && (help[0] != 0))
+		help = _(help);
 
 	if (menu->sym && menu->sym->name)
 		name = g_strdup_printf(_(menu->sym->name));
@@ -1169,7 +1173,7 @@ static gchar **fill_row(struct menu *menu)
 	bzero(row, sizeof(row));
 
 	row[COL_OPTION] =
-	    g_strdup_printf("%s %s", menu_get_prompt(menu),
+	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
 			    sym && sym_has_value(sym) ? "(NEW)" : "");
 
 	if (show_all && !menu_is_visible(menu))
@@ -1219,7 +1223,7 @@ static gchar **fill_row(struct menu *menu)
 
 		if (def_menu)
 			row[COL_VALUE] =
-			    g_strdup(menu_get_prompt(def_menu));
+			    g_strdup(_(menu_get_prompt(def_menu)));
 	}
 	if (sym->flags & SYMBOL_CHOICEVAL)
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
-- 
1.5.4.rc3.14.g44397

