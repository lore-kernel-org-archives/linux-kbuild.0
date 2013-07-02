Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:40884 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753094Ab3GBPXf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jul 2013 11:23:35 -0400
Received: by mail-ee0-f42.google.com with SMTP id c4so2811971eek.29
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2013 08:23:34 -0700 (PDT)
From: davidgraeff <david.graeff@web.de>
Subject: [PATCH 4/9] kconfig: gtk interface: fix splitview, split code into two files
Date: Tue,  2 Jul 2013 17:22:25 +0200
Message-Id: <1372778550-22110-5-git-send-email-david.graeff@web.de>
In-Reply-To: <1372778550-22110-1-git-send-email-david.graeff@web.de>
References: <kconfig-port-gtk-qt>
 <1372778550-22110-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, davidgraeff <david.graeff@web.de>

Split code into gconf.c and gconf_treeview_model. gconf.c now
only contains ui init and ui signal callback code, all tree/model
code is in the second file.

Issues with split view are fixed.
---
 scripts/kconfig/gconfig/Makefile               |   10 +-
 scripts/kconfig/gconfig/gconf.c                | 1103 +++++-------------------
 scripts/kconfig/gconfig/gconf.h                |   80 ++
 scripts/kconfig/gconfig/gconf.ui               |   16 +-
 scripts/kconfig/gconfig/gconf_treeview_model.c |  714 +++++++++++++++
 scripts/kconfig/gconfig/gconf_treeview_model.h |   43 +
 scripts/kconfig/gconfig/util.h                 |   33 +
 7 files changed, 1082 insertions(+), 917 deletions(-)
 create mode 100644 scripts/kconfig/gconfig/gconf.h
 create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.c
 create mode 100644 scripts/kconfig/gconfig/gconf_treeview_model.h
 create mode 100644 scripts/kconfig/gconfig/util.h

diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
index 282c500..f2ca18e 100644
--- a/scripts/kconfig/gconfig/Makefile
+++ b/scripts/kconfig/gconfig/Makefile
@@ -13,7 +13,7 @@ gconfig: $(obj)/gconf
 #         Based on GTK which needs to be installed to compile it
 # object files used by all kconfig flavours listed above
 
-gconf-objs	:= gconfig/gconf.o zconf.tab.o
+gconf-objs	:= gconfig/gconf.o gconfig/gconf_treeview_model.o zconf.tab.o
 
 ifeq ($(MAKECMDGOALS),gconfig)
 	gconf-target := 1
@@ -30,8 +30,12 @@ HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-3.0 gmodule-2.0`
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-3.0 gmodule-2.0` \
                           -Wno-missing-prototypes -DGTK_DISABLE_SINGLE_INCLUDES \
                           -DGDK_DISABLE_DEPRECATED -DGTK_DISABLE_DEPRECATED \
-                          -DGSEAL_ENABLE
-
+                          -DGSEAL_ENABLE -std=c99
+HOSTCFLAGS_gconf_treeview_model.o	= `pkg-config --cflags gtk+-3.0 gmodule-2.0` \
+                          -Wno-missing-prototypes -DGTK_DISABLE_SINGLE_INCLUDES \
+                          -DGDK_DISABLE_DEPRECATED -DGTK_DISABLE_DEPRECATED \
+                          -DGSEAL_ENABLE -std=c99
+                          
 $(obj)/gconfig/gconf.o: $(obj)/gconfig/.tmp_gtkcheck
 
 ifeq ($(gconf-target),1)
diff --git a/scripts/kconfig/gconfig/gconf.c b/scripts/kconfig/gconfig/gconf.c
index 5eb765c..9d7825e 100644
--- a/scripts/kconfig/gconfig/gconf.c
+++ b/scripts/kconfig/gconfig/gconf.c
@@ -1,113 +1,21 @@
-/* Hey EMACS -*- linux-c -*- */
 /*
  *
+ * Copyright (C) 2013 David Gräff <david.graeff@web.de>
  * Copyright (C) 2002-2003 Romain Lievin <roms@tilp.info>
  * Released under the terms of the GNU GPL v2.0.
  *
  */
 
-#ifdef HAVE_CONFIG_H
-#  include <config.h>
-#endif
-
-#include <stdlib.h>
-#include <locale.h>
-#include <stdio.h>
-#include <string.h>
-#include <unistd.h>
-#include <time.h>
-
-#include <gtk/gtk.h>
-#include <glib.h>
-#include <gdk/gdk.h>
-
-#include "../lkc.h"
+#include "gconf.h"
+#include "gconf_treeview_model.h"
+#define IMAGES_TOOLBAR
 #include "../images.c"
 
-//#define DEBUG
-
-enum {
-	SINGLE_VIEW, SPLIT_VIEW, FULL_VIEW
-};
-
-enum {
-	OPT_NORMAL, OPT_ALL, OPT_PROMPT
-};
-
-static gint view_mode = FULL_VIEW;
-static gboolean show_name = TRUE;
-static gboolean show_range = TRUE;
-static gboolean show_value = TRUE;
-static gboolean resizeable = FALSE;
-static int opt_mode = OPT_NORMAL;
-
-GtkWidget *main_wnd = NULL;
-GtkWidget *tree1_w = NULL;	// left  frame
-GtkWidget *tree2_w = NULL;	// right frame
-GtkWidget *text_w = NULL;
-GtkWidget *hpaned = NULL;
-GtkWidget *vpaned = NULL;
-GtkWidget *back_btn = NULL;
-GtkWidget *save_btn = NULL;
-GtkWidget *save_menu_item = NULL;
-
+enum view_mode_enum view_mode = FULL_VIEW;
+struct gconfwindow_s gconfwindow;
 GtkTextTag *tag1, *tag2;
-GdkColor color;
-
-static GtkTreeIter *parents[256];
-static gint indent;
-
-static struct menu *current; // current node for SINGLE view
-static struct menu *browsed; // browsed node for SPLIT view
-
-enum {
-	COL_OPTION, COL_NAME, COL_NO, COL_MOD, COL_YES, COL_VALUE,
-	COL_MENU, COL_COLOR, COL_EDIT, COL_PIXBUF,
-	COL_PIXVIS, COL_BTNVIS, COL_BTNACT, COL_BTNINC, COL_BTNRAD,
-	COL_NUMBER
-};
-
-static void display_list(void);
-static void display_tree(struct menu *menu, GtkTreeStore* tree);
-static void display_tree_part(void);
-static void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree);
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree);
-static gchar **fill_row(struct menu *menu);
-static void conf_changed(void);
-
-/* Helping/Debugging Functions */
-
-const char *dbg_sym_flags(int val)
-{
-	static char buf[256];
-
-	bzero(buf, 256);
-
-	if (val & SYMBOL_CONST)
-		strcat(buf, "const/");
-	if (val & SYMBOL_CHECK)
-		strcat(buf, "check/");
-	if (val & SYMBOL_CHOICE)
-		strcat(buf, "choice/");
-	if (val & SYMBOL_CHOICEVAL)
-		strcat(buf, "choiceval/");
-	if (val & SYMBOL_VALID)
-		strcat(buf, "valid/");
-	if (val & SYMBOL_OPTIONAL)
-		strcat(buf, "optional/");
-	if (val & SYMBOL_WRITE)
-		strcat(buf, "write/");
-	if (val & SYMBOL_CHANGED)
-		strcat(buf, "changed/");
-	if (val & SYMBOL_AUTO)
-		strcat(buf, "auto/");
-
-	buf[strlen(buf) - 1] = '\0';
-
-	return buf;
-}
 
-void replace_button_icon(GtkBuilder * builder,
+static void replace_button_icon(GtkBuilder * builder,
 			 gchar * btn_name, const char ** xpm)
 {
 	GdkPixbuf * pixmap;
@@ -122,12 +30,26 @@ void replace_button_icon(GtkBuilder * builder,
 	gtk_tool_button_set_icon_widget(button, image);
 }
 
+static void conf_changed(void)
+{
+	bool changed = conf_get_changed();
+	gtk_widget_set_sensitive(gconfwindow.save_btn, changed);
+	gtk_widget_set_sensitive(gconfwindow.save_menu_item, changed);
+}
+
 /* Main Window Initialization */
-void init_main_window(const gchar * ui_file)
+static void init_main_window(const gchar * ui_file)
 {
 	GtkBuilder *builder;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
+	
+	// init default values for options
+	gconfwindow.show_name = TRUE;
+	gconfwindow.show_range = TRUE;
+	gconfwindow.show_value = TRUE;
+	gconfwindow.resizeable = FALSE;
+	gconfwindow.opt_mode = OPT_NORMAL;
 
 	builder = gtk_builder_new();
 	int result = gtk_builder_add_from_file(builder, ui_file, NULL);
@@ -135,30 +57,29 @@ void init_main_window(const gchar * ui_file)
 		g_error(_("GUI loading failed !\n"));
 	gtk_builder_connect_signals (builder, NULL);
 
-	main_wnd = GTK_WIDGET(gtk_builder_get_object(builder, "window1"));
-	hpaned = GTK_WIDGET(gtk_builder_get_object(builder, "hpaned1"));
-	vpaned = GTK_WIDGET(gtk_builder_get_object(builder, "vpaned1"));
-	tree1_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview1"));
-	tree2_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview2"));
-	text_w = GTK_WIDGET(gtk_builder_get_object(builder, "textview3"));
+	gconfwindow.main_wnd = GTK_WIDGET(gtk_builder_get_object(builder, "window1"));
+	gconfwindow.hpaned = GTK_WIDGET(gtk_builder_get_object(builder, "hpaned1"));
+	gconfwindow.tree1_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview1"));
+	gconfwindow.tree2_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview2"));
+	gconfwindow.text_w = GTK_WIDGET(gtk_builder_get_object(builder, "textview3"));
 
-	back_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button1"));
-	gtk_widget_set_sensitive(back_btn, FALSE);
+	gconfwindow.back_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button1"));
+	gtk_widget_set_sensitive(gconfwindow.back_btn, FALSE);
 
 	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_name1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_name);
+				       gconfwindow.show_name);
 
 	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_range1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_range);
+				       gconfwindow.show_range);
 
 	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_data1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_value);
+				       gconfwindow.show_value);
 
-	save_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button3"));
-	save_menu_item = GTK_WIDGET(gtk_builder_get_object(builder, "save1"));
+	gconfwindow.save_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button3"));
+	gconfwindow.save_menu_item = GTK_WIDGET(gtk_builder_get_object(builder, "save1"));
 	conf_set_changed_callback(conf_changed);
 
 	widget = GTK_WIDGET(gtk_builder_get_object(builder, "toolbar1"));
@@ -169,7 +90,7 @@ void init_main_window(const gchar * ui_file)
 	
 	g_object_unref (G_OBJECT (builder));
 
-	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
+	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(gconfwindow.text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
 					  "foreground", "red",
 					  "weight", PANGO_WEIGHT_BOLD,
@@ -178,9 +99,9 @@ void init_main_window(const gchar * ui_file)
 					  /*"style", PANGO_STYLE_OBLIQUE, */
 					  NULL);
 
-	gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
+	gtk_window_set_title(GTK_WINDOW(gconfwindow.main_wnd), rootmenu.prompt->text);
 
-	gtk_widget_show(main_wnd);
+	gtk_widget_show(gconfwindow.main_wnd);
 }
 
 /**
@@ -191,205 +112,37 @@ void show_data(void)
 {
 	switch (view_mode) {
 		case SINGLE_VIEW:
-			gtk_widget_hide(tree1_w);
-			current = &rootmenu;
-			display_tree_part();
+			gtk_widget_hide(gconfwindow.tree1_w);
+			display_tree_part(&rootmenu);
 			break;
 		case SPLIT_VIEW:
 		{
-			gtk_widget_show(tree1_w);
+			gtk_widget_show(gconfwindow.tree1_w);
 			gint w, h;
-			gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-			gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
+			gtk_window_get_default_size(GTK_WINDOW(gconfwindow.main_wnd), &w, &h);
+			gtk_paned_set_position(GTK_PANED(gconfwindow.hpaned), w / 2);
 			// Clear right frame, the user has to choose a subtree first
-			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
 			gtk_tree_store_clear(tree2);
 			// Display tree in left frame
 			display_list();
 
 			/* Disable back btn, like in full mode. */
-			gtk_widget_set_sensitive(back_btn, FALSE);
+			gtk_widget_set_sensitive(gconfwindow.back_btn, FALSE);
 			break;
 		}
 		case FULL_VIEW:
 		{
-			gtk_widget_hide(tree1_w);
-			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+			gtk_widget_hide(gconfwindow.tree1_w);
+			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
 			gtk_tree_store_clear(tree2);
 			display_tree(&rootmenu, tree2);
-			gtk_widget_set_sensitive(back_btn, FALSE);
+			gtk_widget_set_sensitive(gconfwindow.back_btn, FALSE);
 			break;
 		}
 	}
 }
 
-void init_left_tree(void)
-{
-	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
-	GtkCellRenderer *renderer;
-	GtkTreeSelection *sel;
-	GtkTreeViewColumn *column;
-
-	GtkTreeStore *tree1;
-	GtkTreeModel *model1;
-	tree1 = gtk_tree_store_new(COL_NUMBER,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_POINTER, GDK_TYPE_COLOR,
-				G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				G_TYPE_BOOLEAN);
-	model1 = GTK_TREE_MODEL(tree1);
-	
-	gtk_tree_view_set_model(view, model1);
-	gtk_tree_view_set_headers_visible(view, TRUE);
-	gtk_tree_view_set_rules_hint(view, TRUE);
-
-	column = gtk_tree_view_column_new();
-	gtk_tree_view_append_column(view, column);
-	gtk_tree_view_column_set_title(column, _("Options"));
-
-	renderer = gtk_cell_renderer_toggle_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "active", COL_BTNACT,
-					    "inconsistent", COL_BTNINC,
-					    "visible", COL_BTNVIS,
-					    "radio", COL_BTNRAD, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "text", COL_OPTION,
-					    "foreground-gdk",
-					    COL_COLOR, NULL);
-
-	sel = gtk_tree_view_get_selection(view);
-	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
-	gtk_widget_realize(tree1_w);
-}
-
-static void renderer_edited(GtkCellRendererText * cell,
-			    const gchar * path_string,
-			    const gchar * new_text, gpointer user_data);
-
-void init_right_tree(void)
-{
-	GtkTreeView *view = GTK_TREE_VIEW(tree2_w);
-	GtkCellRenderer *renderer;
-	GtkTreeSelection *sel;
-	GtkTreeViewColumn *column;
-	gint i;
-	
-	GtkTreeStore *tree2;
-	GtkTreeModel *model2;
-	tree2 = gtk_tree_store_new(COL_NUMBER,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_STRING, G_TYPE_STRING,
-				G_TYPE_POINTER, GDK_TYPE_COLOR,
-				G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				G_TYPE_BOOLEAN);
-	model2 = GTK_TREE_MODEL(tree2);
-
-	gtk_tree_view_set_model(view, model2);
-	gtk_tree_view_set_headers_visible(view, TRUE);
-	gtk_tree_view_set_rules_hint(view, TRUE);
-
-	column = gtk_tree_view_column_new();
-	gtk_tree_view_append_column(view, column);
-	gtk_tree_view_column_set_title(column, _("Options"));
-
-	renderer = gtk_cell_renderer_pixbuf_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "pixbuf", COL_PIXBUF,
-					    "visible", COL_PIXVIS, NULL);
-	renderer = gtk_cell_renderer_toggle_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "active", COL_BTNACT,
-					    "inconsistent", COL_BTNINC,
-					    "visible", COL_BTNVIS,
-					    "radio", COL_BTNRAD, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "text", COL_OPTION,
-					    "foreground-gdk",
-					    COL_COLOR, NULL);
-
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    _("Name"), renderer,
-						    "text", COL_NAME,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "N", renderer,
-						    "text", COL_NO,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "M", renderer,
-						    "text", COL_MOD,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "Y", renderer,
-						    "text", COL_YES,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    _("Value"), renderer,
-						    "text", COL_VALUE,
-						    "editable",
-						    COL_EDIT,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	g_signal_connect(G_OBJECT(renderer), "edited",
-			 G_CALLBACK(renderer_edited), NULL);
-
-	column = gtk_tree_view_get_column(view, COL_NAME);
-	gtk_tree_view_column_set_visible(column, show_name);
-	column = gtk_tree_view_get_column(view, COL_NO);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_MOD);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_YES);
-	gtk_tree_view_column_set_visible(column, show_range);
-	column = gtk_tree_view_get_column(view, COL_VALUE);
-	gtk_tree_view_column_set_visible(column, show_value);
-
-	if (resizeable) {
-		for (i = 0; i < COL_VALUE; i++) {
-			column = gtk_tree_view_get_column(view, i);
-			gtk_tree_view_column_set_resizable(column, TRUE);
-		}
-	}
-
-	sel = gtk_tree_view_get_selection(view);
-	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
-}
-
-
 /* Utility Functions */
 
 
@@ -402,10 +155,10 @@ static void text_insert_help(struct menu *menu)
 
 	menu_get_ext_help(menu, &help);
 
-	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
+	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(gconfwindow.text_w));
 	gtk_text_buffer_get_bounds(buffer, &start, &end);
 	gtk_text_buffer_delete(buffer, &start, &end);
-	gtk_text_view_set_left_margin(GTK_TEXT_VIEW(text_w), 15);
+	gtk_text_view_set_left_margin(GTK_TEXT_VIEW(gconfwindow.text_w), 15);
 
 	gtk_text_buffer_get_end_iter(buffer, &end);
 	gtk_text_buffer_insert_with_tags(buffer, &end, prompt, -1, tag1,
@@ -424,10 +177,10 @@ static void text_insert_msg(const char *title, const char *message)
 	GtkTextIter start, end;
 	const char *msg = message;
 
-	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
+	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(gconfwindow.text_w));
 	gtk_text_buffer_get_bounds(buffer, &start, &end);
 	gtk_text_buffer_delete(buffer, &start, &end);
-	gtk_text_view_set_left_margin(GTK_TEXT_VIEW(text_w), 15);
+	gtk_text_view_set_left_margin(GTK_TEXT_VIEW(gconfwindow.text_w), 15);
 
 	gtk_text_buffer_get_end_iter(buffer, &end);
 	gtk_text_buffer_insert_with_tags(buffer, &end, title, -1, tag1,
@@ -451,7 +204,7 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 		return FALSE;
 
 	dialog = gtk_dialog_new_with_buttons(_("Warning !"),
-					     GTK_WINDOW(main_wnd),
+					     GTK_WINDOW(gconfwindow.main_wnd),
 					     (GtkDialogFlags)
 					     (GTK_DIALOG_MODAL |
 					      GTK_DIALOG_DESTROY_WITH_PARENT),
@@ -499,7 +252,7 @@ void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	dialog = gtk_file_chooser_dialog_new (_("Load file..."),
-						GTK_WINDOW(main_wnd),
+						GTK_WINDOW(gconfwindow.main_wnd),
 						GTK_FILE_CHOOSER_ACTION_OPEN,
 						GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
 						GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT,
@@ -528,7 +281,7 @@ void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	GtkWidget *dialog;
 
 	dialog = gtk_file_chooser_dialog_new (_("Save File as..."),
-				      GTK_WINDOW(main_wnd),
+				      GTK_WINDOW(gconfwindow.main_wnd),
 				      GTK_FILE_CHOOSER_ACTION_SAVE,
 				      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
 				      GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT,
@@ -550,7 +303,7 @@ void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 void on_quit1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	if (!on_window1_delete_event(NULL, NULL, NULL))
-		gtk_widget_destroy(GTK_WIDGET(main_wnd));
+		gtk_widget_destroy(GTK_WIDGET(gconfwindow.main_wnd));
 }
 
 
@@ -558,10 +311,10 @@ void on_show_name1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_name = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
-	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NAME);
+	gconfwindow.show_name = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
+	col = gtk_tree_view_get_column(GTK_TREE_VIEW(gconfwindow.tree2_w), COL_NAME);
 	if (col)
-		gtk_tree_view_column_set_visible(col, show_name);
+		gtk_tree_view_column_set_visible(col, gconfwindow.show_name);
 }
 
 
@@ -569,16 +322,16 @@ void on_show_range1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_range = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
-	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NO);
+	gconfwindow.show_range = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
+	col = gtk_tree_view_get_column(GTK_TREE_VIEW(gconfwindow.tree2_w), COL_NO);
 	if (col)
-		gtk_tree_view_column_set_visible(col, show_range);
-	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_MOD);
+		gtk_tree_view_column_set_visible(col, gconfwindow.show_range);
+	col = gtk_tree_view_get_column(GTK_TREE_VIEW(gconfwindow.tree2_w), COL_MOD);
 	if (col)
-		gtk_tree_view_column_set_visible(col, show_range);
-	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_YES);
+		gtk_tree_view_column_set_visible(col, gconfwindow.show_range);
+	col = gtk_tree_view_get_column(GTK_TREE_VIEW(gconfwindow.tree2_w), COL_YES);
 	if (col)
-		gtk_tree_view_column_set_visible(col, show_range);
+		gtk_tree_view_column_set_visible(col, gconfwindow.show_range);
 
 }
 
@@ -587,18 +340,18 @@ void on_show_data1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_value = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
-	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_VALUE);
+	gconfwindow.show_value = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
+	col = gtk_tree_view_get_column(GTK_TREE_VIEW(gconfwindow.tree2_w), COL_VALUE);
 	if (col)
-		gtk_tree_view_column_set_visible(col, show_value);
+		gtk_tree_view_column_set_visible(col, gconfwindow.show_value);
 }
 
 
 void
 on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	opt_mode = OPT_NORMAL;
-	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+	gconfwindow.opt_mode = OPT_NORMAL;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
@@ -607,8 +360,8 @@ on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 void
 on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	opt_mode = OPT_ALL;
-	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+	gconfwindow.opt_mode = OPT_ALL;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
@@ -617,8 +370,8 @@ on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
 void
 on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	opt_mode = OPT_PROMPT;
-	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+	gconfwindow.opt_mode = OPT_PROMPT;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
@@ -644,7 +397,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	    "Toggling Show Debug Info under the Options menu will show \n"
 	    "the dependencies, which you can then match by examining other options.");
 
-	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
+	dialog = gtk_message_dialog_new(GTK_WINDOW(gconfwindow.main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", intro_text);
@@ -663,7 +416,7 @@ void on_about1_activate(GtkMenuItem * menuitem, gpointer user_data)
 		  "gkc is copyright (c) 2002 Romain Lievin <roms@lpg.ticalc.org>.\n"
 	      "Based on the source code from Roman Zippel.\n");
 
-	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
+	dialog = gtk_message_dialog_new(GTK_WINDOW(gconfwindow.main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", about_text);
@@ -682,7 +435,7 @@ void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	      "For more information, please see the source code or\n"
 	      "visit http://www.fsf.org/licenses/licenses.html\n");
 
-	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
+	dialog = gtk_message_dialog_new(GTK_WINDOW(gconfwindow.main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", license_text);
@@ -697,14 +450,15 @@ void on_back_clicked(GtkButton * button, gpointer user_data)
 {
 	enum prop_type ptype;
 
-	current = current->parent;
+	struct menu *current = getCurrentMenu()->parent;
 	ptype = current->prompt ? current->prompt->type : P_UNKNOWN;
 	if (ptype != P_MENU)
 		current = current->parent;
-	display_tree_part();
-
+	
 	if (current == &rootmenu)
-		gtk_widget_set_sensitive(back_btn, FALSE);
+		gtk_widget_set_sensitive(gconfwindow.back_btn, FALSE);
+
+	display_tree_part(current);
 }
 
 
@@ -737,175 +491,70 @@ void on_full_clicked(GtkButton * button, gpointer user_data)
 
 void on_collapse_clicked(GtkButton * button, gpointer user_data)
 {
-	gtk_tree_view_collapse_all(GTK_TREE_VIEW(tree2_w));
+	gtk_tree_view_collapse_all(GTK_TREE_VIEW(gconfwindow.tree2_w));
 }
 
 
 void on_expand_clicked(GtkButton * button, gpointer user_data)
 {
-	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
+	gtk_tree_view_expand_all(GTK_TREE_VIEW(gconfwindow.tree2_w));
 }
 
-
-/* CTree Callbacks */
-
-/* Change hex/int/string value in the cell */
-static void renderer_edited(GtkCellRendererText * cell,
-			    const gchar * path_string,
-			    const gchar * new_text, gpointer user_data)
+/**
+ * If you click on one of the columns N|M|Y this method is called
+ * by the toggle signal handler (via a proxy methods below)
+ */
+void changeEnabledToogle(int colChangable, int colValue, gchar *path_str)
 {
-	GtkTreePath *path = gtk_tree_path_new_from_string(path_string);
-	GtkTreeIter iter;
-	const char *old_def, *new_def;
+	GtkTreeIter  iter;
 	struct menu *menu;
-	struct symbol *sym;
-	
-	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
-	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
-
-	if (!gtk_tree_model_get_iter(model2, &iter, path))
-		return;
-
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
-	sym = menu->sym;
-
-	gtk_tree_model_get(model2, &iter, COL_VALUE, &old_def, -1);
-	new_def = new_text;
-
-	sym_set_string_value(sym, new_def);
-
-	update_tree(&rootmenu, NULL, tree2);
-
-	gtk_tree_path_free(path);
-}
-
-/* Change the value of a symbol and update the tree */
-static void change_sym_value(struct menu *menu, gint col, GtkTreeStore* tree)
-{
-	struct symbol *sym = menu->sym;
-	tristate newval;
-
-	if (!sym)
+	GtkTreePath *path = gtk_tree_path_new_from_string (path_str);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w));
+	gtk_tree_model_get_iter (model2, &iter, path);
+	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1); // get menu data
+	// get changable state
+	gboolean enabled;
+	gtk_tree_model_get(model2, &iter, colChangable, &enabled, -1);
+	if (!enabled) // not changable, do nothing
 		return;
-
-	if (col == COL_NO)
-		newval = no;
-	else if (col == COL_MOD)
-		newval = mod;
-	else if (col == COL_YES)
-		newval = yes;
+	
+	if (colValue != -1)
+		change_sym_value(menu, colValue, GTK_TREE_STORE(model2));
 	else
-		return;
-
-	switch (sym_get_type(sym)) {
-	case S_BOOLEAN:
-	case S_TRISTATE:
-		if (!sym_tristate_within_range(sym, newval))
-			newval = yes;
-		sym_set_tristate_value(sym, newval);
-		if (view_mode == FULL_VIEW)
-			update_tree(&rootmenu, NULL, tree);
-		else if (view_mode == SPLIT_VIEW) {
-			update_tree(browsed, NULL, tree);
-			display_list();
-		}
-		else if (view_mode == SINGLE_VIEW)
-			display_tree_part();	//fixme: keep exp/coll
-		break;
-	case S_INT:
-	case S_HEX:
-	case S_STRING:
-	default:
-		break;
-	}
+		toggle_sym_value(menu, GTK_TREE_STORE(model2));
+	
+	gtk_tree_view_expand_row(GTK_TREE_VIEW (gconfwindow.tree2_w), path, TRUE);
+	gtk_tree_path_free (path);
 }
 
-static void toggle_sym_value(struct menu *menu, GtkTreeStore* tree)
+void on_treeview2_makeDisable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data)
 {
-	if (!menu->sym)
-		return;
-
-	sym_toggle_tristate_value(menu->sym);
-	if (view_mode == FULL_VIEW)
-		update_tree(&rootmenu, NULL, tree);
-	else if (view_mode == SPLIT_VIEW) {
-		update_tree(browsed, NULL, tree);
-		display_list();
-	}
-	else if (view_mode == SINGLE_VIEW)
-		display_tree_part();	//fixme: keep exp/coll
-}
+	changeEnabledToogle(COL_NO_EN, COL_NO, path_str);
+};
 
-static gint column2index(GtkTreeViewColumn * column)
+void on_treeview2_makeModule_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data)
 {
-	gint i;
-
-	for (i = 0; i < COL_NUMBER; i++) {
-		GtkTreeViewColumn *col;
-
-		col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), i);
-		if (col == column)
-			return i;
-	}
-
-	return -1;
-}
-
+	changeEnabledToogle(COL_MOD_EN, COL_MOD, path_str);
+};
 
-/* User click: update choice (full) or goes down (single) */
-gboolean
-on_treeview2_button_press_event(GtkWidget * widget,
-				GdkEventButton * event, gpointer user_data)
+void on_treeview2_makeEnable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data)
 {
-	GtkTreeView *view = GTK_TREE_VIEW(widget);
-	GtkTreeModel* model2 = gtk_tree_view_get_model(view);
-	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
-	GtkTreePath *path;
-	GtkTreeViewColumn *column;
-	GtkTreeIter iter;
-	struct menu *menu;
-	gint col;
-	
-
-	gtk_tree_view_get_cursor(view, &path, &column);
-	if (path == NULL)
-		return FALSE;
-
-	if (!gtk_tree_model_get_iter(model2, &iter, path))
-		return FALSE;
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
-
-	col = column2index(column);
-	if (event->type == GDK_2BUTTON_PRESS) {
-		enum prop_type ptype;
-		ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-
-		if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
-			// goes down into menu
-			current = menu;
-			display_tree_part();
-			gtk_widget_set_sensitive(back_btn, TRUE);
-		} else if ((col == COL_OPTION)) {
-			toggle_sym_value(menu, tree2);
-			gtk_tree_view_expand_row(view, path, TRUE);
-		}
-	} else {
-		if (col == COL_VALUE) {
-			toggle_sym_value(menu, tree2);
-			gtk_tree_view_expand_row(view, path, TRUE);
-		} else if (col == COL_NO || col == COL_MOD
-			   || col == COL_YES) {
-			change_sym_value(menu, col, tree2);
-			gtk_tree_view_expand_row(view, path, TRUE);
-		}
-	}
+	changeEnabledToogle(COL_YES_EN, COL_YES, path_str);
+};
 
-	return FALSE;
+void
+on_treeview2_toggleEnable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data)
+{
+	changeEnabledToogle(COL_BTNVISIBLE, -1, path_str);
 }
 
 /* Key pressed: update choice */
 gboolean
-on_treeview2_key_press_event(GtkWidget * widget,
+on_treeviews_key_press_event(GtkWidget * widget,
 			     GdkEventKey * event, gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
@@ -930,17 +579,17 @@ on_treeview2_key_press_event(GtkWidget * widget,
 	}
 	if (event->keyval == GDK_KEY_KP_Enter) {
 	}
-	if (widget == tree1_w)
+	if (widget == gconfwindow.tree1_w)
 		return FALSE;
 
 	gtk_tree_model_get_iter(model2, &iter, path);
 	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
 
-	if (!strcasecmp(event->string, "n"))
+	if (!strncasecmp(event->string, "n", 1))
 		col = COL_NO;
-	else if (!strcasecmp(event->string, "m"))
+	else if (!strncasecmp(event->string, "m", 1))
 		col = COL_MOD;
-	else if (!strcasecmp(event->string, "y"))
+	else if (!strncasecmp(event->string, "y", 1))
 		col = COL_YES;
 	else
 		col = -1;
@@ -950,453 +599,96 @@ on_treeview2_key_press_event(GtkWidget * widget,
 }
 
 
-/* Row selection changed: update help */
-void
-on_treeview2_selection_changed(GtkTreeSelection *selection, gpointer user_data)
+/* User click: goes down (single) */
+gboolean
+on_treeview2_button_press_event(GtkWidget * widget,
+				GdkEventButton * event, gpointer user_data)
 {
-	GtkTreeIter iter;
-	struct menu *menu;
-
-	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
-	if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
-		gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
-		text_insert_help(menu);
+	if (event->type != GDK_2BUTTON_PRESS || view_mode == FULL_VIEW) {
+		return FALSE;
 	}
-}
-
-/* User click: display sub-tree in the right frame. */
-void
-on_treeview1_selection_changed(GtkTreeSelection *selection, gpointer user_data)
-{
+	
+	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(view);
+	GtkTreePath *path;
+	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
 	struct menu *menu;
 
-	GtkTreeModel* model1 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w));
-	if (gtk_tree_selection_get_selected(selection, &model1, &iter)) {
-		gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1);
-			
-		text_insert_help(menu);
-		
-// 		GtkTreeStore* tree1 = GTK_TREE_STORE(model1);
-		
-		browsed = menu;
-		display_tree_part();
-
-// 		gtk_widget_realize(tree2_w);
-		gtk_widget_grab_focus(tree2_w);
-	}
-}
+	gtk_tree_view_get_cursor(view, &path, &column);
+	if (path == NULL)
+		return FALSE;
 
+	if (!gtk_tree_model_get_iter(model2, &iter, path))
+		return FALSE;
+	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
 
-/* Fill a row of strings */
-static gchar **fill_row(struct menu *menu)
-{
-	static gchar *row[COL_NUMBER];
-	struct symbol *sym = menu->sym;
-	const char *def;
-	int stype;
-	tristate val;
 	enum prop_type ptype;
-	int i;
-
-	for (i = COL_OPTION; i <= COL_COLOR; i++)
-		g_free(row[i]);
-	bzero(row, sizeof(row));
-
-	row[COL_OPTION] =
-	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
-			    sym && !sym_has_value(sym) ? "(NEW)" : "");
-
-	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
-	else if (opt_mode == OPT_PROMPT &&
-			menu_has_prompt(menu) && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
-	else
-		row[COL_COLOR] = g_strdup("Black");
-
 	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-	switch (ptype) {
-	case P_MENU:
-		row[COL_PIXBUF] = (gchar *) xpm_menu;
-		if (view_mode == SINGLE_VIEW)
-			row[COL_PIXVIS] = GINT_TO_POINTER(TRUE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
-	case P_COMMENT:
-		row[COL_PIXBUF] = (gchar *) xpm_void;
-		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
-	default:
-		row[COL_PIXBUF] = (gchar *) xpm_void;
-		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(TRUE);
-		break;
-	}
 
-	if (!sym)
-		return row;
-	row[COL_NAME] = g_strdup(sym->name);
-
-	sym_calc_value(sym);
-	sym->flags &= ~SYMBOL_CHANGED;
-
-	if (sym_is_choice(sym)) {	// parse childs for getting final value
-		struct menu *child;
-		struct symbol *def_sym = sym_get_choice_value(sym);
-		struct menu *def_menu = NULL;
-
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-
-		for (child = menu->list; child; child = child->next) {
-			if (menu_is_visible(child)
-			    && child->sym == def_sym)
-				def_menu = child;
-		}
-
-		if (def_menu)
-			row[COL_VALUE] =
-			    g_strdup(_(menu_get_prompt(def_menu)));
-	}
-	if (sym->flags & SYMBOL_CHOICEVAL)
-		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
-
-	stype = sym_get_type(sym);
-	switch (stype) {
-	case S_BOOLEAN:
-		if (GPOINTER_TO_INT(row[COL_PIXVIS]) == FALSE)
-			row[COL_BTNVIS] = GINT_TO_POINTER(TRUE);
-		if (sym_is_choice(sym))
-			break;
-		/* fall through */
-	case S_TRISTATE:
-		val = sym_get_tristate_value(sym);
-		switch (val) {
-		case no:
-			row[COL_NO] = g_strdup("N");
-			row[COL_VALUE] = g_strdup("N");
-			row[COL_BTNACT] = GINT_TO_POINTER(FALSE);
-			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
-			break;
-		case mod:
-			row[COL_MOD] = g_strdup("M");
-			row[COL_VALUE] = g_strdup("M");
-			row[COL_BTNINC] = GINT_TO_POINTER(TRUE);
-			break;
-		case yes:
-			row[COL_YES] = g_strdup("Y");
-			row[COL_VALUE] = g_strdup("Y");
-			row[COL_BTNACT] = GINT_TO_POINTER(TRUE);
-			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
-			break;
-		}
-
-		if (val != no && sym_tristate_within_range(sym, no))
-			row[COL_NO] = g_strdup("_");
-		if (val != mod && sym_tristate_within_range(sym, mod))
-			row[COL_MOD] = g_strdup("_");
-		if (val != yes && sym_tristate_within_range(sym, yes))
-			row[COL_YES] = g_strdup("_");
-		break;
-	case S_INT:
-	case S_HEX:
-	case S_STRING:
-		def = sym_get_string_value(sym);
-		row[COL_VALUE] = g_strdup(def);
-		row[COL_EDIT] = GINT_TO_POINTER(TRUE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
+	if (ptype == P_MENU) {
+		// goes down into menu
+		display_tree_part(menu);
+		gtk_widget_set_sensitive(gconfwindow.back_btn, TRUE);
 	}
-
-	return row;
-}
-
-
-/* Set the node content with a row of strings */
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree)
-{
-	GdkColor color;
-	GdkPixbuf *pix;
-
-	pix = gdk_pixbuf_new_from_xpm_data((const char **)
-					   row[COL_PIXBUF]);
-
- 	gdk_color_parse(row[COL_COLOR], &color);
-// 	gdk_colormap_alloc_colors(gdk_colormap_get_system(), &color, 1,
-// 				  FALSE, FALSE, &success);
-
-	gtk_tree_store_set(tree, node,
-			   COL_OPTION, row[COL_OPTION],
-			   COL_NAME, row[COL_NAME],
-			   COL_NO, row[COL_NO],
-			   COL_MOD, row[COL_MOD],
-			   COL_YES, row[COL_YES],
-			   COL_VALUE, row[COL_VALUE],
-			   COL_MENU, (gpointer) menu,
-			   COL_COLOR, &color,
-			   COL_EDIT, GPOINTER_TO_INT(row[COL_EDIT]),
-			   COL_PIXBUF, pix,
-			   COL_PIXVIS, GPOINTER_TO_INT(row[COL_PIXVIS]),
-			   COL_BTNVIS, GPOINTER_TO_INT(row[COL_BTNVIS]),
-			   COL_BTNACT, GPOINTER_TO_INT(row[COL_BTNACT]),
-			   COL_BTNINC, GPOINTER_TO_INT(row[COL_BTNINC]),
-			   COL_BTNRAD, GPOINTER_TO_INT(row[COL_BTNRAD]),
-			   -1);
-
-	g_object_unref(pix);
-}
-
-
-/* Add a node to the tree */
-static void place_node(struct menu *menu, char **row, GtkTreeStore* tree)
-{
-	GtkTreeIter *parent = parents[indent - 1];
-	GtkTreeIter *node = parents[indent];
-
-	gtk_tree_store_append(tree, node, parent);
-	set_node(node, menu, row, tree);
+	
+	return FALSE;
 }
 
 
-/* Find a node in the GTK+ tree */
-static GtkTreeIter found;
-
-/*
- * Find a menu in the GtkTree starting at parent.
- */
-GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
-				    struct menu *tofind)
+/* Row selection changed: update help */
+void
+on_treeview2_selection_changed(GtkTreeSelection *selection, gpointer user_data)
 {
 	GtkTreeIter iter;
-	GtkTreeIter *child = &iter;
-	gboolean valid;
-	GtkTreeIter *ret;
-
-	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
-	valid = gtk_tree_model_iter_children(model2, child, parent);
-	while (valid) {
-		struct menu *menu;
-
-		gtk_tree_model_get(model2, child, 6, &menu, -1);
-
-		if (menu == tofind) {
-			memcpy(&found, child, sizeof(GtkTreeIter));
-			return &found;
-		}
-
-		ret = gtktree_iter_find_node(child, tofind);
-		if (ret)
-			return ret;
-
-		valid = gtk_tree_model_iter_next(model2, child);
-	}
-
-	return NULL;
-}
-
-
-/*
- * Update the tree by adding/removing entries
- * Does not change other nodes
- */
-static void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree)
-{
-	struct menu *child1;
-	GtkTreeIter iter, tmp;
-	GtkTreeIter *child2 = &iter;
-	gboolean valid;
-	GtkTreeIter *sibling;
-	struct symbol *sym;
-	struct menu *menu1, *menu2;
-
-	if (src == &rootmenu)
-		indent = 1;
-
-	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
-	valid = gtk_tree_model_iter_children(model2, child2, dst);
-	for (child1 = src->list; child1; child1 = child1->next) {
-
-		sym = child1->sym;
-
-	      reparse:
-		menu1 = child1;
-		if (valid)
-			gtk_tree_model_get(model2, child2, COL_MENU,
-					   &menu2, -1);
-		else
-			menu2 = NULL;	// force adding of a first child
-
-#ifdef DEBUG
-		printf("%*c%s | %s\n", indent, ' ',
-		       menu1 ? menu_get_prompt(menu1) : "nil",
-		       menu2 ? menu_get_prompt(menu2) : "nil");
-#endif
-
-		if ((opt_mode == OPT_NORMAL && !menu_is_visible(child1)) ||
-		    (opt_mode == OPT_PROMPT && !menu_has_prompt(child1)) ||
-		    (opt_mode == OPT_ALL    && !menu_get_prompt(child1))) {
-
-			/* remove node */
-			if (gtktree_iter_find_node(dst, menu1) != NULL) {
-				memcpy(&tmp, child2, sizeof(GtkTreeIter));
-				valid = gtk_tree_model_iter_next(model2,
-								 child2);
-				gtk_tree_store_remove(tree, &tmp);
-				if (!valid)
-					return;		/* next parent */
-				else
-					goto reparse;	/* next child */
-			} else
-				continue;
-		}
-
-		if (menu1 != menu2) {
-			if (gtktree_iter_find_node(dst, menu1) == NULL) {	// add node
-				if (!valid && !menu2)
-					sibling = NULL;
-				else
-					sibling = child2;
-				gtk_tree_store_insert_before(tree,
-							     child2,
-							     dst, sibling);
-				set_node(child2, menu1, fill_row(menu1), tree);
-				if (menu2 == NULL)
-					valid = TRUE;
-			} else {	// remove node
-				memcpy(&tmp, child2, sizeof(GtkTreeIter));
-				valid = gtk_tree_model_iter_next(model2,
-								 child2);
-				gtk_tree_store_remove(tree, &tmp);
-				if (!valid)
-					return;	// next parent
-				else
-					goto reparse;	// next child
-			}
-		} else if (sym && (sym->flags & SYMBOL_CHANGED)) {
-			set_node(child2, menu1, fill_row(menu1), tree);
-		}
-
-		indent++;
-		update_tree(child1, child2, tree);
-		indent--;
+	struct menu *menu;
 
-		valid = gtk_tree_model_iter_next(model2, child2);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w));
+	if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
+		gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+		text_insert_help(menu);
 	}
 }
 
-
-/* Display the whole tree (single/split/full view) */
-static void display_tree(struct menu *menu, GtkTreeStore* tree)
+/* User click: display sub-tree in the right frame. */
+void
+on_treeview1_selection_changed(GtkTreeSelection *selection, gpointer user_data)
 {
-	struct symbol *sym;
-	struct property *prop;
-	struct menu *child;
-	enum prop_type ptype;
-	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w)));
-	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
-
-	if (menu == &rootmenu) {
-		indent = 1;
-		current = &rootmenu;
-	}
+	GtkTreeIter iter;
+	struct menu *menu;
 
-	for (child = menu->list; child; child = child->next) {
-		prop = child->prompt;
-		sym = child->sym;
-		ptype = prop ? prop->type : P_UNKNOWN;
-
-		if (sym)
-			sym->flags &= ~SYMBOL_CHANGED;
-
-		if ((view_mode == SPLIT_VIEW)
-		    && !(child->flags & MENU_ROOT) && (tree == tree1))
-			continue;
-
-		if ((view_mode == SPLIT_VIEW) && (child->flags & MENU_ROOT)
-		    && (tree == tree2))
-			continue;
-
-		if ((opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
-		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
-		    (opt_mode == OPT_ALL    && menu_get_prompt(child)))
-			place_node(child, fill_row(child), tree);
-#ifdef DEBUG
-		printf("%*c%s: ", indent, ' ', menu_get_prompt(child));
-		printf("%s", child->flags & MENU_ROOT ? "rootmenu | " : "");
-		printf("%s", prop_get_type_name(ptype));
-		printf(" | ");
-		if (sym) {
-			printf("%s", sym_type_name(sym->type));
-			printf(" | ");
-			printf("%s", dbg_sym_flags(sym->flags));
-			printf("\n");
-		} else
-			printf("\n");
-#endif
-		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
-		    && (tree == tree2))
-			continue;
-/*
-                if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW))*/
+	GtkTreeModel* model1 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree1_w));
+	if (gtk_tree_selection_get_selected(selection, &model1, &iter)) {
+		gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1);
 
-		/* Change paned position if the view is not in 'split mode' */
-		if (view_mode == SINGLE_VIEW || view_mode == FULL_VIEW) {
-			gtk_paned_set_position(GTK_PANED(hpaned), 0);
-		}
+		display_tree_part(menu);
+		text_insert_help(menu);
 
-		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW)) {
-			indent++;
-			display_tree(child, tree);
-			indent--;
-		}
+		gtk_widget_realize(gconfwindow.tree2_w);
+		gtk_widget_grab_focus(gconfwindow.tree2_w);
 	}
 }
 
-/* Display a part of the tree starting at current node (single/split view) */
-static void display_tree_part(void)
-{
-	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
-	gtk_tree_store_clear(tree2);
-
-	if (view_mode == SINGLE_VIEW)
-		display_tree(current, tree2);
-	else if (view_mode == SPLIT_VIEW)
-		display_tree(browsed, tree2);
-	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
-}
-
-/* Display the list in the left frame (split view) */
-static void display_list(void)
-{
-	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w)));
-	gtk_tree_store_clear(tree1);
-
-	display_tree(&rootmenu, tree1);
-	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
-}
-
-void fixup_rootmenu(struct menu *menu)
+/* User clicked on checkbox in treeview 1. */
+void
+on_treeview1_checkbox_toggle(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data)
 {
-	struct menu *child;
-	static int menu_cnt = 0;
-
-	menu->flags |= MENU_ROOT;
-	for (child = menu->list; child; child = child->next) {
-		if (child->prompt && child->prompt->type == P_MENU) {
-			menu_cnt++;
-			fixup_rootmenu(child);
-			menu_cnt--;
-		} else if (!menu_cnt)
-			fixup_rootmenu(child);
-	}
+	GtkTreeIter  iter;
+	struct menu *menu;
+	GtkTreePath *path = gtk_tree_path_new_from_string (path_str);
+	if (path == NULL)
+		return;
+		
+	GtkTreeModel* model1 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree1_w));
+	GtkTreeStore* tree1 = GTK_TREE_STORE(model1);
+	gtk_tree_model_get_iter (model1, &iter, path);
+	gtk_tree_path_free (path);
+	gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1); // get menu data
+	toggle_sym_value(menu, tree1); // toggle value internally
+	display_tree_part(menu); // show new tree
 }
 
-
 /* Main */
 int main(int ac, char *av[])
 {
@@ -1435,21 +727,24 @@ int main(int ac, char *av[])
 			printf("%s <config>\n", av[0]);
 			exit(0);
 		}
+	}
+	
+	if (ac > 2 && av[1][0] == '-') {
 		name = av[2];
-	} else
+	} else if(ac>1) {
 		name = av[1];
+	} else {
+		printf("No config file!\n");
+		exit(0);
+	}
 
 	conf_parse(name);
 	fixup_rootmenu(&rootmenu);
 	conf_read(NULL);
-
-	/* Prepare GtkTreeIter */
-	gint i;
-	for (parents[0] = NULL, i = 1; i < 256; i++)
-		parents[i] = (GtkTreeIter *) g_malloc(sizeof(GtkTreeIter));
 	
 	/* Load the interface and connect signals */
 	init_main_window(ui_file);
+	init_node_parents();
 	init_left_tree();
 	init_right_tree();
 	show_data();
@@ -1459,9 +754,3 @@ int main(int ac, char *av[])
 	return 0;
 }
 
-static void conf_changed(void)
-{
-	bool changed = conf_get_changed();
-	gtk_widget_set_sensitive(save_btn, changed);
-	gtk_widget_set_sensitive(save_menu_item, changed);
-}
diff --git a/scripts/kconfig/gconfig/gconf.h b/scripts/kconfig/gconfig/gconf.h
new file mode 100644
index 0000000..206c154
--- /dev/null
+++ b/scripts/kconfig/gconfig/gconf.h
@@ -0,0 +1,80 @@
+/*
+ *
+ * Copyright (C) 2013 David Gräff <david.graeff@web.de>
+ * Copyright (C) 2002-2003 Romain Lievin <roms@tilp.info>
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ */
+
+#ifndef GCONF_H_
+#define GCONF_H_
+
+#ifdef HAVE_CONFIG_H
+#  include <config.h>
+#endif
+
+#include <stdlib.h>
+#include <locale.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <strings.h>
+#include <time.h>
+
+#include <gtk/gtk.h>
+#include <glib.h>
+#include <gdk/gdk.h>
+
+#include "../lkc.h"
+
+//#define DEBUG
+
+extern enum view_mode_enum {
+	SINGLE_VIEW, SPLIT_VIEW, FULL_VIEW
+} view_mode;
+
+enum {
+	OPT_NORMAL, OPT_ALL, OPT_PROMPT
+};
+enum {
+	COL_OPTION, COL_NAME,
+	COL_NO, COL_MOD, COL_YES,
+	COL_VALUE,
+	COL_MENU, COL_COLOR, COL_EDIT,
+	COL_PIXBUF, COL_PIXVIS,
+	COL_BTNVISIBLE, COL_BTNACT,
+	COL_BTNINC, COL_BTNRAD,
+	COL_NO_EN, COL_MOD_EN, COL_YES_EN,
+	COL_NUMBER
+};
+
+extern struct gconfwindow_s {
+	// widget pointer variables
+	GtkWidget *main_wnd;
+	GtkWidget *tree1_w;	// left  frame
+	GtkWidget *tree2_w;	// right frame
+	GtkWidget *text_w;
+	GtkWidget *hpaned;
+	GtkWidget *back_btn;
+	GtkWidget *save_btn;
+	GtkWidget *save_menu_item;
+	// option variables
+	gboolean show_name;
+	gboolean show_range;
+	gboolean show_value;
+	gboolean resizeable;
+	int opt_mode;
+
+} gconfwindow;
+
+void on_treeview2_makeDisable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data);
+void on_treeview2_makeModule_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data);
+void on_treeview2_makeEnable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data);
+void on_treeview1_checkbox_toggle(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data);
+void on_treeview2_toggleEnable_clicked(GtkCellRendererToggle *cell, gchar *path_str,
+               gpointer data);
+#endif
\ No newline at end of file
diff --git a/scripts/kconfig/gconfig/gconf.ui b/scripts/kconfig/gconfig/gconf.ui
index 6aa29f7..0effd9f 100644
--- a/scripts/kconfig/gconfig/gconf.ui
+++ b/scripts/kconfig/gconfig/gconf.ui
@@ -19,7 +19,7 @@
     <property name="can_focus">False</property>
     <property name="title" translatable="yes">Gtk Kernel Configurator</property>
     <property name="default_width">640</property>
-    <property name="default_height">250</property>
+    <property name="default_height">480</property>
     <signal name="destroy" handler="on_window1_destroy" swapped="no"/>
     <signal name="delete-event" handler="on_window1_delete_event" swapped="no"/>
     <child>
@@ -437,17 +437,18 @@
                 <property name="width_request">100</property>
                 <property name="visible">True</property>
                 <property name="can_focus">False</property>
-                <property name="margin_right">3</property>
+                <property name="margin_left">3</property>
                 <property name="shadow_type">in</property>
                 <property name="min_content_width">150</property>
                 <child>
                   <object class="GtkTreeView" id="treeview1">
+                    <property name="width_request">100</property>
                     <property name="visible">True</property>
                     <property name="can_focus">True</property>
-                    <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK | GDK_STRUCTURE_MASK</property>
+                    <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK</property>
                     <property name="headers_clickable">False</property>
                     <property name="enable_search">False</property>
-                    <signal name="key-press-event" handler="on_treeview2_key_press_event" swapped="no"/>
+                    <signal name="key-press-event" handler="on_treeviews_key_press_event" swapped="no"/>
                     <child internal-child="selection">
                       <object class="GtkTreeSelection" id="treeview-selection3">
                         <signal name="changed" handler="on_treeview1_selection_changed" swapped="no"/>
@@ -465,7 +466,7 @@
               <object class="GtkVPaned" id="vpaned1">
                 <property name="visible">True</property>
                 <property name="can_focus">True</property>
-                <property name="margin_left">3</property>
+                <property name="margin_right">3</property>
                 <property name="hexpand">True</property>
                 <child>
                   <object class="GtkScrolledWindow" id="scrolledwindow2">
@@ -476,10 +477,10 @@
                       <object class="GtkTreeView" id="treeview2">
                         <property name="visible">True</property>
                         <property name="can_focus">True</property>
-                        <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK | GDK_STRUCTURE_MASK</property>
+                        <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK</property>
                         <property name="enable_search">False</property>
                         <signal name="button-press-event" handler="on_treeview2_button_press_event" swapped="no"/>
-                        <signal name="key-press-event" handler="on_treeview2_key_press_event" swapped="no"/>
+                        <signal name="key-press-event" handler="on_treeviews_key_press_event" swapped="no"/>
                         <child internal-child="selection">
                           <object class="GtkTreeSelection" id="treeview-selection4">
                             <signal name="changed" handler="on_treeview2_selection_changed" swapped="no"/>
@@ -500,6 +501,7 @@
                     <property name="can_focus">False</property>
                     <property name="hscrollbar_policy">never</property>
                     <property name="shadow_type">in</property>
+                    <property name="min_content_height">80</property>
                     <child>
                       <object class="GtkTextView" id="textview3">
                         <property name="visible">True</property>
diff --git a/scripts/kconfig/gconfig/gconf_treeview_model.c b/scripts/kconfig/gconfig/gconf_treeview_model.c
new file mode 100644
index 0000000..c7689b3
--- /dev/null
+++ b/scripts/kconfig/gconfig/gconf_treeview_model.c
@@ -0,0 +1,714 @@
+/*
+ *
+ * Copyright (C) 2013 David Gräff <david.graeff@web.de>
+ * Copyright (C) 2002-2003 Romain Lievin <roms@tilp.info>
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ */
+
+#include "gconf_treeview_model.h"
+#define IMAGES_TREEVIEW
+#include "../images.c"
+
+static GtkTreeIter *parents[256];
+static gint indent;
+
+
+void init_left_tree(void)
+{
+	GtkTreeView *view = GTK_TREE_VIEW(gconfwindow.tree1_w);
+	GtkCellRenderer *renderer;
+	GtkTreeSelection *sel;
+	GtkTreeViewColumn *column;
+
+	GtkTreeStore *tree1;
+	GtkTreeModel *model1;
+	tree1 = gtk_tree_store_new(COL_NUMBER,
+				G_TYPE_STRING, G_TYPE_STRING, //Option, Name
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, // COL_NO, COL_MOD, COL_YES
+				G_TYPE_STRING, // COL_VALUE
+				G_TYPE_POINTER, GDK_TYPE_COLOR, G_TYPE_BOOLEAN, // COL_MENU, COL_COLOR, COL_EDIT
+				GDK_TYPE_PIXBUF, G_TYPE_BOOLEAN, // COL_PIXBUF, COL_PIXVIS
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, //COL_BTNVISIBLE, COL_BTNACT
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, // COL_BTNINC, COL_BTNRAD,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, G_TYPE_BOOLEAN // COL_NO_EN, COL_MOD_EN, COL_YES_EN
+				);
+	model1 = GTK_TREE_MODEL(tree1);
+	
+	gtk_tree_view_set_model(view, model1);
+	gtk_tree_view_set_headers_visible(view, TRUE);
+	gtk_tree_view_set_rules_hint(view, TRUE);
+
+	column = gtk_tree_view_column_new();
+	gtk_tree_view_append_column(view, column);
+	gtk_tree_view_column_set_title(column, _("Options"));
+
+	renderer = gtk_cell_renderer_toggle_new();
+	g_signal_connect (G_OBJECT(renderer), "toggled", G_CALLBACK
+		(on_treeview1_checkbox_toggle), NULL);
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "active", COL_BTNACT,
+					    "inconsistent", COL_BTNINC,
+					    "visible", COL_BTNVISIBLE,
+					    "radio", COL_BTNRAD, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "text", COL_OPTION,
+					    "foreground-gdk",
+					    COL_COLOR, NULL);
+
+	sel = gtk_tree_view_get_selection(view);
+	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
+	gtk_widget_realize(gconfwindow.tree1_w);
+}
+
+void init_right_tree(void)
+{
+	GtkTreeView *view = GTK_TREE_VIEW(gconfwindow.tree2_w);
+	GtkCellRenderer *renderer;
+	GtkTreeViewColumn *column;
+	
+	GtkTreeStore *tree2;
+	GtkTreeModel *model2;
+	tree2 = gtk_tree_store_new(COL_NUMBER,
+				G_TYPE_STRING, G_TYPE_STRING, //Option, Name
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, // COL_NO, COL_MOD, COL_YES
+				G_TYPE_STRING, // COL_VALUE
+				G_TYPE_POINTER, GDK_TYPE_COLOR, G_TYPE_BOOLEAN, // COL_MENU, COL_COLOR, COL_EDIT
+				GDK_TYPE_PIXBUF, G_TYPE_BOOLEAN, // COL_PIXBUF, COL_PIXVIS
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, //COL_BTNVISIBLE, COL_BTNACT
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, // COL_BTNINC, COL_BTNRAD,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN, G_TYPE_BOOLEAN // COL_NO_EN, COL_MOD_EN, COL_YES_EN
+				);
+	model2 = GTK_TREE_MODEL(tree2);
+
+	gtk_tree_view_set_model(view, model2);
+	gtk_tree_view_set_headers_visible(view, TRUE);
+	gtk_tree_view_set_rules_hint(view, TRUE);
+
+	// The option name column with the expand icon and enabled checkbox
+	column = gtk_tree_view_column_new();
+	gtk_tree_view_append_column(view, column);
+	gtk_tree_view_column_set_title(column, _("Options"));
+
+	// The expand icon
+	renderer = gtk_cell_renderer_pixbuf_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "pixbuf", COL_PIXBUF,
+					    "visible", COL_PIXVIS, NULL);
+	// The enabled/module/disabled checkbox
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "active", COL_BTNACT,
+					    "inconsistent", COL_BTNINC,
+					    "visible", COL_BTNVISIBLE,
+					    "radio", COL_BTNRAD, NULL);
+	g_signal_connect (G_OBJECT(renderer), "toggled", G_CALLBACK
+		(on_treeview2_toggleEnable_clicked), NULL);
+	// The options name
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "text", COL_OPTION,
+					    "foreground-gdk",
+					    COL_COLOR, NULL);
+
+	// The internal name column
+	// The internal name
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    _("Name"), renderer,
+						    "text", COL_NAME,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	column = gtk_tree_view_get_column(view, COL_NAME);
+	gtk_tree_view_column_set_visible(column, gconfwindow.show_name);
+	
+	// Range column (Disable)
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "N", renderer,
+							"active", COL_NO,
+							"visible", COL_NO_EN,
+							NULL);
+	column = gtk_tree_view_get_column(view, COL_NO);
+	gtk_tree_view_column_set_visible(column, gconfwindow.show_range);
+	gtk_cell_renderer_toggle_set_radio(GTK_CELL_RENDERER_TOGGLE(renderer), TRUE);
+	g_signal_connect (G_OBJECT(renderer), "toggled", G_CALLBACK
+		(on_treeview2_makeDisable_clicked), NULL);
+	
+	// Range column (Module)
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "M", renderer,
+							"active", COL_MOD,
+							"visible", COL_MOD_EN,
+							NULL);
+	column = gtk_tree_view_get_column(view, COL_MOD);
+	gtk_tree_view_column_set_visible(column, gconfwindow.show_range);
+	gtk_cell_renderer_toggle_set_radio(GTK_CELL_RENDERER_TOGGLE(renderer), TRUE);
+	g_signal_connect (G_OBJECT(renderer), "toggled", G_CALLBACK
+		(on_treeview2_makeModule_clicked), NULL);
+	
+	// Range column (Enable)
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "Y", renderer,
+							"active", COL_YES,
+							"visible", COL_YES_EN,
+							NULL);
+	column = gtk_tree_view_get_column(view, COL_YES);
+	gtk_tree_view_column_set_visible(column, gconfwindow.show_range);
+	gtk_cell_renderer_toggle_set_radio(GTK_CELL_RENDERER_TOGGLE(renderer), TRUE);
+	g_signal_connect (G_OBJECT(renderer), "toggled", G_CALLBACK
+		(on_treeview2_makeEnable_clicked), NULL);
+	
+	// Current value column
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    _("Value"), renderer,
+						    "text", COL_VALUE,
+						    "editable",
+						    COL_EDIT,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	column = gtk_tree_view_get_column(view, COL_VALUE);
+	gtk_tree_view_column_set_visible(column, gconfwindow.show_value);
+	g_signal_connect(G_OBJECT(renderer), "edited",
+			 G_CALLBACK(renderer_edited), NULL);
+
+	if (gconfwindow.resizeable) {
+		for (int i = 0; i < COL_VALUE; i++) {
+			column = gtk_tree_view_get_column(view, i);
+			gtk_tree_view_column_set_resizable(column, TRUE);
+		}
+	}
+
+	GtkTreeSelection *sel = gtk_tree_view_get_selection(view);
+	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
+}
+
+/* CTree Callbacks */
+
+/* Change hex/int/string value in the cell */
+void renderer_edited(GtkCellRendererText * cell,
+			    const gchar * path_string,
+			    const gchar * new_text, gpointer user_data)
+{
+	GtkTreePath *path = gtk_tree_path_new_from_string(path_string);
+	GtkTreeIter iter;
+	const char *old_def, *new_def;
+	struct menu *menu;
+	struct symbol *sym;
+	
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w));
+	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
+
+	if (!gtk_tree_model_get_iter(model2, &iter, path))
+		return;
+
+	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	sym = menu->sym;
+
+	gtk_tree_model_get(model2, &iter, COL_VALUE, &old_def, -1);
+	new_def = new_text;
+
+	sym_set_string_value(sym, new_def);
+
+	update_tree(&rootmenu, NULL, tree2);
+
+	gtk_tree_path_free(path);
+}
+
+struct menu *currentMenu = 0; // currentMenu node
+
+struct menu *getCurrentMenu(void) {
+	return currentMenu;
+}
+
+/* Change the value of a symbol and update the tree */
+void change_sym_value(struct menu *menu, gint col, GtkTreeStore* tree)
+{
+	struct symbol *sym = menu->sym;
+	tristate newval;
+
+	if (!sym)
+		return;
+
+	if (col == COL_NO)
+		newval = no;
+	else if (col == COL_MOD)
+		newval = mod;
+	else if (col == COL_YES)
+		newval = yes;
+	else
+		return;
+
+	switch (sym_get_type(sym)) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		if (!sym_tristate_within_range(sym, newval))
+			newval = yes;
+		sym_set_tristate_value(sym, newval);
+		if (view_mode == FULL_VIEW)
+			update_tree(&rootmenu, NULL, tree);
+		else if (view_mode == SPLIT_VIEW) {
+			update_tree(currentMenu, NULL, tree);
+			display_list();
+		}
+		else if (view_mode == SINGLE_VIEW)
+			display_tree_part(currentMenu);	//fixme: keep exp/coll
+		break;
+	case S_INT:
+	case S_HEX:
+	case S_STRING:
+	default:
+		break;
+	}
+}
+
+void toggle_sym_value(struct menu *menu, GtkTreeStore* tree)
+{
+	if (!menu->sym)
+		return;
+
+	sym_toggle_tristate_value(menu->sym);
+	if (view_mode == FULL_VIEW)
+		update_tree(&rootmenu, NULL, tree);
+	else if (view_mode == SPLIT_VIEW) {
+		update_tree(currentMenu, NULL, tree);
+		display_list();
+	}
+	else if (view_mode == SINGLE_VIEW)
+		display_tree_part(currentMenu);	//fixme: keep exp/coll
+}
+
+
+/* Fill a row of strings */
+gchar **fill_row(struct menu *menu)
+{
+	static gchar *row[COL_NUMBER];
+	struct symbol *sym = menu->sym;
+	const char *def;
+	int stype;
+	tristate val;
+	enum prop_type ptype;
+
+	g_free(row[COL_OPTION]);
+	g_free(row[COL_NAME]);
+	g_free(row[COL_VALUE]);
+	g_free(row[COL_MENU]);
+	g_free(row[COL_COLOR]);
+	
+	bzero(row, sizeof(row));
+
+	row[COL_OPTION] =
+	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
+			    sym && !sym_has_value(sym) ? "(NEW)" : "");
+
+	if (gconfwindow.opt_mode == OPT_ALL && !menu_is_visible(menu))
+		row[COL_COLOR] = g_strdup("DarkGray");
+	else if (gconfwindow.opt_mode == OPT_PROMPT &&
+			menu_has_prompt(menu) && !menu_is_visible(menu))
+		row[COL_COLOR] = g_strdup("DarkGray");
+	else
+		row[COL_COLOR] = g_strdup("Black");
+
+	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
+	switch (ptype) {
+	case P_MENU:
+		row[COL_PIXBUF] = (gchar *) xpm_menu;
+		if (view_mode == SINGLE_VIEW)
+			row[COL_PIXVIS] = GINT_TO_POINTER(TRUE);
+		row[COL_BTNVISIBLE] = GINT_TO_POINTER(FALSE);
+		break;
+	case P_COMMENT:
+		row[COL_PIXBUF] = (gchar *) xpm_void;
+		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
+		row[COL_BTNVISIBLE] = GINT_TO_POINTER(FALSE);
+		break;
+	default:
+		row[COL_PIXBUF] = (gchar *) xpm_void;
+		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
+		row[COL_BTNVISIBLE] = GINT_TO_POINTER(TRUE);
+		break;
+	}
+
+	if (!sym)
+		return row;
+	row[COL_NAME] = g_strdup(sym->name);
+
+	sym_calc_value(sym);
+	sym->flags &= ~SYMBOL_CHANGED;
+
+	if (sym_is_choice(sym)) {	// parse childs for getting final value
+		struct menu *child;
+		struct symbol *def_sym = sym_get_choice_value(sym);
+		struct menu *def_menu = NULL;
+
+		row[COL_BTNVISIBLE] = GINT_TO_POINTER(FALSE);
+
+		for (child = menu->list; child; child = child->next) {
+			if (menu_is_visible(child)
+			    && child->sym == def_sym)
+				def_menu = child;
+		}
+
+		if (def_menu)
+			row[COL_VALUE] =
+			    g_strdup(_(menu_get_prompt(def_menu)));
+	}
+	if (sym->flags & SYMBOL_CHOICEVAL)
+		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
+
+	stype = sym_get_type(sym);
+	switch (stype) {
+	case S_BOOLEAN:
+		if (GPOINTER_TO_INT(row[COL_PIXVIS]) == FALSE)
+			row[COL_BTNVISIBLE] = GINT_TO_POINTER(TRUE);
+		if (sym_is_choice(sym))
+			break;
+		/* fall through */
+	case S_TRISTATE:
+		val = sym_get_tristate_value(sym);
+		switch (val) {
+		case no:
+			row[COL_NO] = GINT_TO_POINTER(TRUE);
+			row[COL_VALUE] = g_strdup("[No]");
+			row[COL_BTNACT] = GINT_TO_POINTER(FALSE);
+			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
+			break;
+		case mod:
+			row[COL_MOD] = GINT_TO_POINTER(TRUE);
+			row[COL_VALUE] = g_strdup("[Module]");
+			row[COL_BTNINC] = GINT_TO_POINTER(TRUE);
+			break;
+		case yes:
+			row[COL_YES] = GINT_TO_POINTER(TRUE);
+			row[COL_VALUE] = g_strdup("[Yes]");
+			row[COL_BTNACT] = GINT_TO_POINTER(TRUE);
+			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
+			break;
+		}
+
+		row[COL_NO_EN] = GINT_TO_POINTER(sym_tristate_within_range(sym, no)); // No is allowed
+		row[COL_MOD_EN] = GINT_TO_POINTER(sym_tristate_within_range(sym, mod)); // Mod is allowed
+		row[COL_YES_EN] = GINT_TO_POINTER(sym_tristate_within_range(sym, yes)); // Yes is allowed
+		break;
+	case S_INT:
+	case S_HEX:
+	case S_STRING:
+		def = sym_get_string_value(sym);
+		row[COL_VALUE] = g_strdup(def);
+		row[COL_EDIT] = GINT_TO_POINTER(TRUE);
+		row[COL_BTNVISIBLE] = GINT_TO_POINTER(FALSE);
+		break;
+	}
+
+	return row;
+}
+
+
+/* Set the node content with a row of strings */
+void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree)
+{
+	GdkColor color;
+	GdkPixbuf *pix;
+
+	pix = gdk_pixbuf_new_from_xpm_data((const char **)
+					   row[COL_PIXBUF]);
+
+ 	gdk_color_parse(row[COL_COLOR], &color);
+// 	gdk_colormap_alloc_colors(gdk_colormap_get_system(), &color, 1,
+// 				  FALSE, FALSE, &success);
+
+	gtk_tree_store_set(tree, node,
+			   COL_OPTION, row[COL_OPTION],
+			   COL_NAME, row[COL_NAME],
+			   COL_NO, row[COL_NO],
+			   COL_MOD, row[COL_MOD],
+			   COL_YES, row[COL_YES],
+			   COL_VALUE, row[COL_VALUE],
+			   COL_MENU, (gpointer) menu,
+			   COL_COLOR, &color,
+			   COL_EDIT, GPOINTER_TO_INT(row[COL_EDIT]),
+			   COL_PIXBUF, pix,
+			   COL_PIXVIS, GPOINTER_TO_INT(row[COL_PIXVIS]),
+			   COL_BTNVISIBLE, GPOINTER_TO_INT(row[COL_BTNVISIBLE]),
+			   COL_BTNACT, GPOINTER_TO_INT(row[COL_BTNACT]),
+			   COL_BTNINC, GPOINTER_TO_INT(row[COL_BTNINC]),
+			   COL_BTNRAD, GPOINTER_TO_INT(row[COL_BTNRAD]),
+			   COL_NO_EN, GPOINTER_TO_INT(row[COL_NO_EN]),
+			   COL_MOD_EN, GPOINTER_TO_INT(row[COL_MOD_EN]),
+			   COL_YES_EN, GPOINTER_TO_INT(row[COL_YES_EN]),
+			   -1);
+
+	g_object_unref(pix);
+}
+
+void init_node_parents(void)
+{
+	/* Prepare GtkTreeIter */
+	gint i;
+	for (parents[0] = NULL, i = 1; i < 256; i++)
+		parents[i] = (GtkTreeIter *) g_malloc(sizeof(GtkTreeIter));
+	
+}
+
+/* Add a node to the tree */
+void place_node(struct menu *menu, char **row, GtkTreeStore* tree)
+{
+	GtkTreeIter *parent = parents[indent - 1];
+	GtkTreeIter *node = parents[indent];
+
+	gtk_tree_store_append(tree, node, parent);
+	set_node(node, menu, row, tree);
+}
+
+/*
+ * Find a menu in the GtkTree starting at parent.
+ */
+GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
+				    struct menu *tofind)
+{
+	static GtkTreeIter found;
+	GtkTreeIter iter;
+	GtkTreeIter *child = &iter;
+	gboolean valid;
+	GtkTreeIter *ret;
+
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w));
+	valid = gtk_tree_model_iter_children(model2, child, parent);
+	while (valid) {
+		struct menu *menu;
+
+		gtk_tree_model_get(model2, child, 6, &menu, -1);
+
+		if (menu == tofind) {
+			memcpy(&found, child, sizeof(GtkTreeIter));
+			return &found;
+		}
+
+		ret = gtktree_iter_find_node(child, tofind);
+		if (ret)
+			return ret;
+
+		valid = gtk_tree_model_iter_next(model2, child);
+	}
+
+	return NULL;
+}
+
+
+/*
+ * Update the tree by adding/removing entries
+ * Does not change other nodes
+ */
+void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree)
+{
+	struct menu *child1;
+	GtkTreeIter iter, tmp;
+	GtkTreeIter *child2 = &iter;
+	gboolean valid;
+	GtkTreeIter *sibling;
+	struct symbol *sym;
+	struct menu *menu1, *menu2;
+
+	if (src == &rootmenu)
+		indent = 1;
+
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w));
+	valid = gtk_tree_model_iter_children(model2, child2, dst);
+	for (child1 = src->list; child1; child1 = child1->next) {
+
+		sym = child1->sym;
+
+	      reparse:
+		menu1 = child1;
+		if (valid)
+			gtk_tree_model_get(model2, child2, COL_MENU,
+					   &menu2, -1);
+		else
+			menu2 = NULL;	// force adding of a first child
+
+#ifdef DEBUG
+		printf("%*c%s | %s\n", indent, ' ',
+		       menu1 ? menu_get_prompt(menu1) : "nil",
+		       menu2 ? menu_get_prompt(menu2) : "nil");
+#endif
+
+		if ((gconfwindow.opt_mode == OPT_NORMAL && !menu_is_visible(child1)) ||
+		    (gconfwindow.opt_mode == OPT_PROMPT && !menu_has_prompt(child1)) ||
+		    (gconfwindow.opt_mode == OPT_ALL    && !menu_get_prompt(child1))) {
+
+			/* remove node */
+			if (gtktree_iter_find_node(dst, menu1) != NULL) {
+				memcpy(&tmp, child2, sizeof(GtkTreeIter));
+				valid = gtk_tree_model_iter_next(model2,
+								 child2);
+				gtk_tree_store_remove(tree, &tmp);
+				if (!valid)
+					return;		/* next parent */
+				else
+					goto reparse;	/* next child */
+			} else
+				continue;
+		}
+
+		if (menu1 != menu2) {
+			if (gtktree_iter_find_node(dst, menu1) == NULL) {	// add node
+				if (!valid && !menu2)
+					sibling = NULL;
+				else
+					sibling = child2;
+				gtk_tree_store_insert_before(tree,
+							     child2,
+							     dst, sibling);
+				set_node(child2, menu1, fill_row(menu1), tree);
+				if (menu2 == NULL)
+					valid = TRUE;
+			} else {	// remove node
+				memcpy(&tmp, child2, sizeof(GtkTreeIter));
+				valid = gtk_tree_model_iter_next(model2,
+								 child2);
+				gtk_tree_store_remove(tree, &tmp);
+				if (!valid)
+					return;	// next parent
+				else
+					goto reparse;	// next child
+			}
+		} else if (sym && (sym->flags & SYMBOL_CHANGED)) {
+			set_node(child2, menu1, fill_row(menu1), tree);
+		}
+
+		indent++;
+		update_tree(child1, child2, tree);
+		indent--;
+
+		valid = gtk_tree_model_iter_next(model2, child2);
+	}
+}
+
+
+/* Display the whole tree (single/split/full view) */
+void display_tree(struct menu *menu, GtkTreeStore* tree)
+{
+	struct symbol *sym;
+	struct property *prop;
+	struct menu *child;
+	enum prop_type ptype;
+	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree1_w)));
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
+
+	if (menu == &rootmenu) {
+		indent = 1;
+		currentMenu = &rootmenu;
+	}
+
+	for (child = menu->list; child; child = child->next) {
+		prop = child->prompt;
+		sym = child->sym;
+		ptype = prop ? prop->type : P_UNKNOWN;
+
+		if (sym)
+			sym->flags &= ~SYMBOL_CHANGED;
+
+		if ((view_mode == SPLIT_VIEW)
+		    && !(child->flags & MENU_ROOT) && (tree == tree1))
+			continue;
+
+		if ((view_mode == SPLIT_VIEW) && (child->flags & MENU_ROOT)
+		    && (tree == tree2))
+			continue;
+
+		if ((gconfwindow.opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
+		    (gconfwindow.opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
+		    (gconfwindow.opt_mode == OPT_ALL    && menu_get_prompt(child)))
+			place_node(child, fill_row(child), tree);
+#ifdef DEBUG
+		printf("%*c%s: ", indent, ' ', menu_get_prompt(child));
+		printf("%s", child->flags & MENU_ROOT ? "rootmenu | " : "");
+		printf("%s", prop_get_type_name(ptype));
+		printf(" | ");
+		if (sym) {
+			printf("%s", sym_type_name(sym->type));
+			printf(" | ");
+			printf("%s", dbg_sym_flags(sym->flags));
+			printf("\n");
+		} else
+			printf("\n");
+#endif
+		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
+		    && (tree == tree2))
+			continue;
+/*
+                if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
+		    || (view_mode == FULL_VIEW)
+		    || (view_mode == SPLIT_VIEW))*/
+
+		/* Change paned position if the view is not in 'split mode' */
+		if (view_mode == SINGLE_VIEW || view_mode == FULL_VIEW) {
+			gtk_paned_set_position(GTK_PANED(gconfwindow.hpaned), 0);
+		}
+
+		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
+		    || (view_mode == FULL_VIEW)
+		    || (view_mode == SPLIT_VIEW)) {
+			indent++;
+			display_tree(child, tree);
+			indent--;
+		}
+	}
+}
+
+/* Display a part of the tree starting at current node (single/split view) */
+void display_tree_part(struct menu *menu)
+{
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree2_w)));
+	gtk_tree_store_clear(tree2);
+	
+	currentMenu = menu;
+
+	display_tree(menu, tree2);
+	gtk_tree_view_expand_all(GTK_TREE_VIEW(gconfwindow.tree2_w));
+}
+
+/* Display the list in the left frame (split view) */
+void display_list(void)
+{
+	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (gconfwindow.tree1_w)));
+	gtk_tree_store_clear(tree1);
+
+	display_tree(&rootmenu, tree1);
+	gtk_tree_view_expand_all(GTK_TREE_VIEW(gconfwindow.tree1_w));
+}
+
+void fixup_rootmenu(struct menu *menu)
+{
+	struct menu *child;
+	static int menu_cnt = 0;
+
+	menu->flags |= MENU_ROOT;
+	for (child = menu->list; child; child = child->next) {
+		if (child->prompt && child->prompt->type == P_MENU) {
+			menu_cnt++;
+			fixup_rootmenu(child);
+			menu_cnt--;
+		} else if (!menu_cnt)
+			fixup_rootmenu(child);
+	}
+}
diff --git a/scripts/kconfig/gconfig/gconf_treeview_model.h b/scripts/kconfig/gconfig/gconf_treeview_model.h
new file mode 100644
index 0000000..7648da2
--- /dev/null
+++ b/scripts/kconfig/gconfig/gconf_treeview_model.h
@@ -0,0 +1,43 @@
+/*
+ *
+ * Copyright (C) 2013 David Gräff <david.graeff@web.de>
+ * Copyright (C) 2002-2003 Romain Lievin <roms@tilp.info>
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ */
+
+#ifndef GCONF_TREEVIEW_MODEL_H_
+#define GCONF_TREEVIEW_MODEL_H_
+
+#include "gconf.h"
+
+// tree and model init
+void init_right_tree(void);
+void init_left_tree(void);
+
+void renderer_edited(GtkCellRendererText * cell,
+			    const gchar * path_string,
+			    const gchar * new_text, gpointer user_data);
+
+// model update operations
+void change_sym_value(struct menu *menu, gint col, GtkTreeStore* tree);
+void toggle_sym_value(struct menu *menu, GtkTreeStore* tree);
+
+// node operations
+void init_node_parents(void);
+void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree);
+void place_node(struct menu *menu, char **row, GtkTreeStore* tree);
+GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
+				    struct menu *tofind);
+gchar **fill_row(struct menu *menu);
+
+// tree operations
+void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree);
+void display_tree(struct menu *menu, GtkTreeStore* tree);
+void display_tree_part(struct menu *menu);
+void display_list(void);
+void fixup_rootmenu(struct menu *menu);
+
+struct menu *getCurrentMenu(void);
+
+#endif
diff --git a/scripts/kconfig/gconfig/util.h b/scripts/kconfig/gconfig/util.h
new file mode 100644
index 0000000..876ec26
--- /dev/null
+++ b/scripts/kconfig/gconfig/util.h
@@ -0,0 +1,33 @@
+ 
+/* Helping/Debugging Functions */
+
+#define bzero(b,len) (memset((b), '\0', (len)), (void) 0)
+const char *dbg_sym_flags(int val)
+{
+	static char buf[256];
+
+	bzero(buf, 256);
+
+	if (val & SYMBOL_CONST)
+		strcat(buf, "const/");
+	if (val & SYMBOL_CHECK)
+		strcat(buf, "check/");
+	if (val & SYMBOL_CHOICE)
+		strcat(buf, "choice/");
+	if (val & SYMBOL_CHOICEVAL)
+		strcat(buf, "choiceval/");
+	if (val & SYMBOL_VALID)
+		strcat(buf, "valid/");
+	if (val & SYMBOL_OPTIONAL)
+		strcat(buf, "optional/");
+	if (val & SYMBOL_WRITE)
+		strcat(buf, "write/");
+	if (val & SYMBOL_CHANGED)
+		strcat(buf, "changed/");
+	if (val & SYMBOL_AUTO)
+		strcat(buf, "auto/");
+
+	buf[strlen(buf) - 1] = '\0';
+
+	return buf;
+}
-- 
1.8.1.2

