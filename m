Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36227 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752331AbbBXPjN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Feb 2015 10:39:13 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 2/3] kconfig: Remove dead code
Date: Tue, 24 Feb 2015 16:39:02 +0100
Message-Id: <1424792343-25621-2-git-send-email-mmarek@suse.cz>
In-Reply-To: <1424792343-25621-1-git-send-email-mmarek@suse.cz>
References: <1424792343-25621-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/expr.c  |  4 ----
 scripts/kconfig/gconf.c | 24 ------------------------
 scripts/kconfig/lkc.h   |  1 -
 scripts/kconfig/util.c  | 10 ----------
 4 files changed, 39 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index d662652..4b4cf8e 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -978,9 +978,6 @@ tristate expr_calc_value(struct expr *e)
 
 int expr_compare_type(enum expr_type t1, enum expr_type t2)
 {
-#if 0
-	return 1;
-#else
 	if (t1 == t2)
 		return 0;
 	switch (t1) {
@@ -1005,7 +1002,6 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	}
 	printf("[%dgt%d?]", t1, t2);
 	return 0;
-#endif
 }
 
 static inline struct expr *
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index d0a35b2..344b9e3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -169,14 +169,6 @@ void init_main_window(const gchar * glade_file)
 	style = gtk_widget_get_style(main_wnd);
 	widget = glade_xml_get_widget(xml, "toolbar1");
 
-#if 0	/* Use stock Gtk icons instead */
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button1", (gchar **) xpm_back);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button2", (gchar **) xpm_load);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button3", (gchar **) xpm_save);
-#endif
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button4", (gchar **) xpm_single_view);
 	replace_button_icon(xml, main_wnd->window, style,
@@ -184,22 +176,6 @@ void init_main_window(const gchar * glade_file)
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button6", (gchar **) xpm_tree_view);
 
-#if 0
-	switch (view_mode) {
-	case SINGLE_VIEW:
-		widget = glade_xml_get_widget(xml, "button4");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	case SPLIT_VIEW:
-		widget = glade_xml_get_widget(xml, "button5");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	case FULL_VIEW:
-		widget = glade_xml_get_widget(xml, "button6");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	}
-#endif
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
 					  "foreground", "red",
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index e418a30..9f845ea 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -135,7 +135,6 @@ struct gstr {
 	int max_width;
 };
 struct gstr str_new(void);
-struct gstr str_assign(const char *s);
 void str_free(struct gstr *gs);
 void str_append(struct gstr *gs, const char *s);
 void str_printf(struct gstr *gs, const char *fmt, ...);
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 94f9c83..0e76042 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -88,16 +88,6 @@ struct gstr str_new(void)
 	return gs;
 }
 
-/* Allocate and assign growable string */
-struct gstr str_assign(const char *s)
-{
-	struct gstr gs;
-	gs.s = strdup(s);
-	gs.len = strlen(s) + 1;
-	gs.max_width = 0;
-	return gs;
-}
-
 /* Free storage for growable string */
 void str_free(struct gstr *gs)
 {
-- 
2.1.2

