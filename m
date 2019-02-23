Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:58797 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbfBWQtM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Feb 2019 11:49:12 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kconfig: fix -Wmissing-prototypes warnings for gconfig
Date: Sun, 24 Feb 2019 01:49:00 +0900
Message-Id: <1550940540-28932-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1550940540-28932-1-git-send-email-yamada.masahiro@socionext.com>
References: <1550940540-28932-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

"make gconfig" produces lots of "warning: no previous prototype".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/gconf.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a316f6a..a108781 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -405,6 +405,8 @@ static void text_insert_msg(const char *title, const char *message)
 
 void on_save_activate(GtkMenuItem * menuitem, gpointer user_data);
 gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
+				 gpointer user_data);
+gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 				 gpointer user_data)
 {
 	GtkWidget *dialog, *label;
@@ -448,12 +450,15 @@ gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 	return FALSE;
 }
 
+void on_window1_destroy(GtkObject *object, gpointer user_data);
 void on_window1_destroy(GtkObject *object, gpointer user_data)
 {
 	gtk_main_quit();
 }
 
 void on_window1_size_request(GtkWidget *widget, GtkRequisition *requisition,
+			     gpointer user_data);
+void on_window1_size_request(GtkWidget *widget, GtkRequisition *requisition,
 			     gpointer user_data)
 {
 	static gint old_h;
@@ -486,6 +491,7 @@ static void load_filename(GtkFileSelection *file_selector, gpointer user_data)
 		display_tree(&rootmenu);
 }
 
+void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *fs;
@@ -524,6 +530,7 @@ static void store_filename(GtkFileSelection *file_selector, gpointer user_data)
 	gtk_widget_destroy(GTK_WIDGET(user_data));
 }
 
+void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *fs;
@@ -542,12 +549,14 @@ void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	gtk_widget_show(fs);
 }
 
+void on_quit1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_quit1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	if (!on_window1_delete_event(NULL, NULL, NULL))
 		gtk_widget_destroy(GTK_WIDGET(main_wnd));
 }
 
+void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
@@ -558,6 +567,7 @@ void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)
 		gtk_tree_view_column_set_visible(col, show_name);
 }
 
+void on_show_range1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_show_range1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
@@ -574,6 +584,7 @@ void on_show_range1_activate(GtkMenuItem *menuitem, gpointer user_data)
 		gtk_tree_view_column_set_visible(col, show_range);
 }
 
+void on_show_data1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_show_data1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
@@ -584,6 +595,7 @@ void on_show_data1_activate(GtkMenuItem *menuitem, gpointer user_data)
 		gtk_tree_view_column_set_visible(col, show_value);
 }
 
+void on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_NORMAL;
@@ -591,6 +603,7 @@ void on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
+void on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_ALL;
@@ -598,6 +611,7 @@ void on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
+void on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_PROMPT;
@@ -605,6 +619,7 @@ void on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
+void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
@@ -635,6 +650,7 @@ void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
+void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
@@ -652,6 +668,7 @@ void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
+void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data);
 void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
@@ -670,6 +687,7 @@ void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
+void on_back_clicked(GtkButton *button, gpointer user_data);
 void on_back_clicked(GtkButton *button, gpointer user_data)
 {
 	enum prop_type ptype;
@@ -684,11 +702,13 @@ void on_back_clicked(GtkButton *button, gpointer user_data)
 		gtk_widget_set_sensitive(back_btn, FALSE);
 }
 
+void on_load_clicked(GtkButton *button, gpointer user_data);
 void on_load_clicked(GtkButton *button, gpointer user_data)
 {
 	on_load1_activate(NULL, user_data);
 }
 
+void on_single_clicked(GtkButton *button, gpointer user_data);
 void on_single_clicked(GtkButton *button, gpointer user_data)
 {
 	view_mode = SINGLE_VIEW;
@@ -697,6 +717,7 @@ void on_single_clicked(GtkButton *button, gpointer user_data)
 	display_tree_part();
 }
 
+void on_split_clicked(GtkButton *button, gpointer user_data);
 void on_split_clicked(GtkButton *button, gpointer user_data)
 {
 	gint w, h;
@@ -713,6 +734,7 @@ void on_split_clicked(GtkButton *button, gpointer user_data)
 	gtk_widget_set_sensitive(back_btn, FALSE);
 }
 
+void on_full_clicked(GtkButton *button, gpointer user_data);
 void on_full_clicked(GtkButton *button, gpointer user_data)
 {
 	view_mode = FULL_VIEW;
@@ -723,11 +745,13 @@ void on_full_clicked(GtkButton *button, gpointer user_data)
 	gtk_widget_set_sensitive(back_btn, FALSE);
 }
 
+void on_collapse_clicked(GtkButton *button, gpointer user_data);
 void on_collapse_clicked(GtkButton *button, gpointer user_data)
 {
 	gtk_tree_view_collapse_all(GTK_TREE_VIEW(tree2_w));
 }
 
+void on_expand_clicked(GtkButton *button, gpointer user_data);
 void on_expand_clicked(GtkButton *button, gpointer user_data)
 {
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
@@ -836,6 +860,9 @@ static gint column2index(GtkTreeViewColumn *column)
 /* User click: update choice (full) or goes down (single) */
 gboolean on_treeview2_button_press_event(GtkWidget *widget,
 					 GdkEventButton *event,
+					 gpointer user_data);
+gboolean on_treeview2_button_press_event(GtkWidget *widget,
+					 GdkEventButton *event,
 					 gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
@@ -892,6 +919,8 @@ gboolean on_treeview2_button_press_event(GtkWidget *widget,
 
 /* Key pressed: update choice */
 gboolean on_treeview2_key_press_event(GtkWidget *widget, GdkEventKey *event,
+				      gpointer user_data);
+gboolean on_treeview2_key_press_event(GtkWidget *widget, GdkEventKey *event,
 				      gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
@@ -934,6 +963,7 @@ gboolean on_treeview2_key_press_event(GtkWidget *widget, GdkEventKey *event,
 }
 
 /* Row selection changed: update help */
+void on_treeview2_cursor_changed(GtkTreeView *treeview, gpointer user_data);
 void on_treeview2_cursor_changed(GtkTreeView *treeview, gpointer user_data)
 {
 	GtkTreeSelection *selection;
@@ -950,6 +980,9 @@ void on_treeview2_cursor_changed(GtkTreeView *treeview, gpointer user_data)
 /* User click: display sub-tree in the right frame. */
 gboolean on_treeview1_button_press_event(GtkWidget *widget,
 					 GdkEventButton *event,
+					 gpointer user_data);
+gboolean on_treeview1_button_press_event(GtkWidget *widget,
+					 GdkEventButton *event,
 					 gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
-- 
2.7.4
