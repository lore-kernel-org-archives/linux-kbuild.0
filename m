Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail01d.mail.t-online.hu ([84.2.42.6]:57825 "EHLO
	mail01d.mail.t-online.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759877AbYAKWws (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 17:52:48 -0500
Subject: [PATCH 5/10] kconfig: missing macros in gconfig
From: EGRY Gabor <gaboregry1@t-online.hu>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 23:47:58 +0100
Message-Id: <1200091678.10603.42.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@zh-kernel.org


This patch adds missing gettext macros.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 kbuild-szilard/scripts/kconfig/gconf.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff -puN scripts/kconfig/gconf.c~kconfig-i18n-10-gconfig-missing scripts/kconfig/gconf.c
--- kbuild/scripts/kconfig/gconf.c~kconfig-i18n-10-gconfig-missing	2008-01-11 22:27:12.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/gconf.c	2008-01-11 22:27:33.000000000 +0100
@@ -455,11 +455,15 @@ static void text_insert_help(struct menu
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
@@ -1169,7 +1173,7 @@ static gchar **fill_row(struct menu *men
 	bzero(row, sizeof(row));
 
 	row[COL_OPTION] =
-	    g_strdup_printf("%s %s", menu_get_prompt(menu),
+	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
 			    sym && sym_has_value(sym) ? "(NEW)" : "");
 
 	if (show_all && !menu_is_visible(menu))
@@ -1219,7 +1223,7 @@ static gchar **fill_row(struct menu *men
 
 		if (def_menu)
 			row[COL_VALUE] =
-			    g_strdup(menu_get_prompt(def_menu));
+			    g_strdup(_(menu_get_prompt(def_menu)));
 	}
 	if (sym->flags & SYMBOL_CHOICEVAL)
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
_

