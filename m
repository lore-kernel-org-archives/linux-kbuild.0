Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]:60882 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755833Ab2JIWqj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Oct 2012 18:46:39 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/3] kconfig: remove CONFIG_ from string constants
Date: Wed, 10 Oct 2012 00:46:31 +0200
Message-Id: <1349822793-1227-2-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
References: <1349822793-1227-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Having the CONFIG_ prefix in string constants gets in the way of
using a run-time-defined CONFIG_ prefix.

Fix that by using temp growable strings (gstr) in which we printf
the text.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/kconfig/mconf.c |   12 +++++++++---
 scripts/kconfig/nconf.c |   11 +++++++++--
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index f584a28..1f64cd1 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -306,14 +306,18 @@ static void search_conf(void)
 {
 	struct symbol **sym_arr;
 	struct gstr res;
+	struct gstr title;
 	char *dialog_input;
 	int dres;
+
+	title = str_new();
+	str_printf( &title, _("Enter %s (sub)string to search for "
+			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter " CONFIG_ " (sub)string to search for "
-				"(with or without \"" CONFIG_ "\")"),
-			      10, 75, "");
+			       str_get(&title), 10, 75, "");
 	switch (dres) {
 	case 0:
 		break;
@@ -321,6 +325,7 @@ again:
 		show_helptext(_("Search Configuration"), search_help);
 		goto again;
 	default:
+		str_free(&title);
 		return;
 	}
 
@@ -334,6 +339,7 @@ again:
 	free(sym_arr);
 	show_textbox(_("Search Results"), str_get(&res), 0, 0);
 	str_free(&res);
+	str_free(&title);
 }
 
 static void build_conf(struct menu *menu)
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 1704a85..8854fd1 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -696,13 +696,18 @@ static void search_conf(void)
 {
 	struct symbol **sym_arr;
 	struct gstr res;
+	struct gstr title;
 	char *dialog_input;
 	int dres;
+
+	title = str_new();
+	str_printf( &title, _("Enter %s (sub)string to search for "
+			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+
 again:
 	dres = dialog_inputbox(main_window,
 			_("Search Configuration Parameter"),
-			_("Enter " CONFIG_ " (sub)string to search for "
-				"(with or without \"" CONFIG_ "\")"),
+			str_get(&title),
 			"", &dialog_input_result, &dialog_input_result_len);
 	switch (dres) {
 	case 0:
@@ -712,6 +717,7 @@ again:
 				_("Search Configuration"), search_help);
 		goto again;
 	default:
+		str_free(&title);
 		return;
 	}
 
@@ -726,6 +732,7 @@ again:
 	show_scroll_win(main_window,
 			_("Search Results"), str_get(&res));
 	str_free(&res);
+	str_free(&title);
 }
 
 
-- 
1.7.2.5

