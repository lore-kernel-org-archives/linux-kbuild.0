Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:35105 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753089Ab3GBPXf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jul 2013 11:23:35 -0400
Received: by mail-ee0-f52.google.com with SMTP id c50so2856603eek.11
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2013 08:23:33 -0700 (PDT)
From: davidgraeff <david.graeff@web.de>
Subject: [PATCH 3/9] kconfig: gtk interface port to Gtk3
Date: Tue,  2 Jul 2013 17:22:24 +0200
Message-Id: <1372778550-22110-4-git-send-email-david.graeff@web.de>
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

libglade is deprecated: use GtkBuilder and ui files instead.
Remove some global variables.
Use new gtk signals.
---
 scripts/kconfig/POTFILES.in         |   2 +-
 scripts/kconfig/gconfig/Makefile    |  14 +-
 scripts/kconfig/gconfig/gconf.c     | 416 +++++++++++------------
 scripts/kconfig/gconfig/gconf.glade | 661 ------------------------------------
 scripts/kconfig/gconfig/gconf.ui    | 534 +++++++++++++++++++++++++++++
 5 files changed, 741 insertions(+), 886 deletions(-)
 delete mode 100644 scripts/kconfig/gconfig/gconf.glade
 create mode 100644 scripts/kconfig/gconfig/gconf.ui

diff --git a/scripts/kconfig/POTFILES.in b/scripts/kconfig/POTFILES.in
index 4984825..2e44446 100644
--- a/scripts/kconfig/POTFILES.in
+++ b/scripts/kconfig/POTFILES.in
@@ -6,7 +6,7 @@ scripts/kconfig/lxdialog/util.c
 scripts/kconfig/lxdialog/yesno.c
 scripts/kconfig/lxdialog/mconf.c
 scripts/kconfig/gkonfig/gconf.c
-scripts/kconfig/gkonfig/gconf.glade.h
+[type: gettext/glade]scripts/kconfig/gkonfig/gconf.ui
 scripts/kconfig/qconfig/qconf.cc
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
index cf0c32b..282c500 100644
--- a/scripts/kconfig/gconfig/Makefile
+++ b/scripts/kconfig/gconfig/Makefile
@@ -26,8 +26,8 @@ endif
 clean-files	+= zconf.tab.c gconfig/gconf.glade.h gconf
 
 
-HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
-HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
+HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-3.0 gmodule-2.0`
+HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-3.0 gmodule-2.0` \
                           -Wno-missing-prototypes -DGTK_DISABLE_SINGLE_INCLUDES \
                           -DGDK_DISABLE_DEPRECATED -DGTK_DISABLE_DEPRECATED \
                           -DGSEAL_ENABLE
@@ -39,20 +39,20 @@ ifeq ($(gconf-target),1)
 
 # GTK needs some extra effort, too...
 $(obj)/gconfig/.tmp_gtkcheck:
-	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
-		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
+	@if `pkg-config --exists gtk+-3.0`; then		\
+		if `pkg-config --atleast-version=3.0.0 gtk+-3.0`; then			\
 			touch $@;								\
 		else									\
 			echo >&2 "*"; 							\
-			echo >&2 "* GTK+ is present but version >= 2.0.0 is required.";	\
+			echo >&2 "* GTK+ is present but version >= 3.0.0 is required.";	\
 			echo >&2 "*";							\
 			false;								\
 		fi									\
 	else										\
 		echo >&2 "*"; 								\
 		echo >&2 "* Unable to find the GTK+ installation. Please make sure that"; 	\
-		echo >&2 "* the GTK+ 2.0 development package is correctly installed..."; 	\
-		echo >&2 "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
+		echo >&2 "* the GTK+ 3.0 development package is correctly installed..."; 	\
+		echo >&2 "* You need gtk+-3.0 and glib-2.0."; 		\
 		echo >&2 "*"; 								\
 		false;									\
 	fi
diff --git a/scripts/kconfig/gconfig/gconf.c b/scripts/kconfig/gconfig/gconf.c
index 36bad03..5eb765c 100644
--- a/scripts/kconfig/gconfig/gconf.c
+++ b/scripts/kconfig/gconfig/gconf.c
@@ -11,19 +11,18 @@
 #endif
 
 #include <stdlib.h>
-#include "../lkc.h"
-#include "../images.c"
+#include <locale.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <time.h>
 
-#include <glade/glade.h>
 #include <gtk/gtk.h>
 #include <glib.h>
 #include <gdk/gdk.h>
-#include <gdk/gdkkeysyms.h>
 
-#include <stdio.h>
-#include <string.h>
-#include <unistd.h>
-#include <time.h>
+#include "../lkc.h"
+#include "../images.c"
 
 //#define DEBUG
 
@@ -55,8 +54,6 @@ GtkWidget *save_menu_item = NULL;
 GtkTextTag *tag1, *tag2;
 GdkColor color;
 
-GtkTreeStore *tree1, *tree2, *tree;
-GtkTreeModel *model1, *model2;
 static GtkTreeIter *parents[256];
 static gint indent;
 
@@ -71,10 +68,10 @@ enum {
 };
 
 static void display_list(void);
-static void display_tree(struct menu *menu);
+static void display_tree(struct menu *menu, GtkTreeStore* tree);
 static void display_tree_part(void);
-static void update_tree(struct menu *src, GtkTreeIter * dst);
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row);
+static void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree);
+static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree);
 static gchar **fill_row(struct menu *menu);
 static void conf_changed(void);
 
@@ -110,7 +107,7 @@ const char *dbg_sym_flags(int val)
 	return buf;
 }
 
-void replace_button_icon(GladeXML * xml,
+void replace_button_icon(GtkBuilder * builder,
 			 gchar * btn_name, const char ** xpm)
 {
 	GdkPixbuf * pixmap;
@@ -119,55 +116,58 @@ void replace_button_icon(GladeXML * xml,
 
 	pixmap = gdk_pixbuf_new_from_xpm_data(xpm);
 
-	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
+	button = GTK_TOOL_BUTTON(gtk_builder_get_object(builder, btn_name));
 	image = gtk_image_new_from_pixbuf(pixmap);
 	gtk_widget_show(image);
 	gtk_tool_button_set_icon_widget(button, image);
 }
 
 /* Main Window Initialization */
-void init_main_window(const gchar * glade_file)
+void init_main_window(const gchar * ui_file)
 {
-	GladeXML *xml;
+	GtkBuilder *builder;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
 
-	xml = glade_xml_new(glade_file, "window1", NULL);
-	if (!xml)
+	builder = gtk_builder_new();
+	int result = gtk_builder_add_from_file(builder, ui_file, NULL);
+	if (!result)
 		g_error(_("GUI loading failed !\n"));
-	glade_xml_signal_autoconnect(xml);
+	gtk_builder_connect_signals (builder, NULL);
 
-	main_wnd = glade_xml_get_widget(xml, "window1");
-	hpaned = glade_xml_get_widget(xml, "hpaned1");
-	vpaned = glade_xml_get_widget(xml, "vpaned1");
-	tree1_w = glade_xml_get_widget(xml, "treeview1");
-	tree2_w = glade_xml_get_widget(xml, "treeview2");
-	text_w = glade_xml_get_widget(xml, "textview3");
+	main_wnd = GTK_WIDGET(gtk_builder_get_object(builder, "window1"));
+	hpaned = GTK_WIDGET(gtk_builder_get_object(builder, "hpaned1"));
+	vpaned = GTK_WIDGET(gtk_builder_get_object(builder, "vpaned1"));
+	tree1_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview1"));
+	tree2_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview2"));
+	text_w = GTK_WIDGET(gtk_builder_get_object(builder, "textview3"));
 
-	back_btn = glade_xml_get_widget(xml, "button1");
+	back_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button1"));
 	gtk_widget_set_sensitive(back_btn, FALSE);
 
-	widget = glade_xml_get_widget(xml, "show_name1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_name1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_name);
 
-	widget = glade_xml_get_widget(xml, "show_range1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_range1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_range);
 
-	widget = glade_xml_get_widget(xml, "show_data1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_data1"));
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_value);
 
-	save_btn = glade_xml_get_widget(xml, "button3");
-	save_menu_item = glade_xml_get_widget(xml, "save1");
+	save_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button3"));
+	save_menu_item = GTK_WIDGET(gtk_builder_get_object(builder, "save1"));
 	conf_set_changed_callback(conf_changed);
 
-	widget = glade_xml_get_widget(xml, "toolbar1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "toolbar1"));
 
-	replace_button_icon(xml, "button4", xpm_single_view);
-	replace_button_icon(xml, "button5", xpm_split_view);
-	replace_button_icon(xml, "button6", xpm_tree_view);
+	replace_button_icon(builder, "button4", xpm_single_view);
+	replace_button_icon(builder, "button5", xpm_split_view);
+	replace_button_icon(builder, "button6", xpm_tree_view);
+	
+	g_object_unref (G_OBJECT (builder));
 
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
@@ -183,34 +183,44 @@ void init_main_window(const gchar * glade_file)
 	gtk_widget_show(main_wnd);
 }
 
-void init_tree_model(void)
+/**
+ * Called by main() and load..(). Display data depending on the view mode
+ * and changes the layout.
+ */
+void show_data(void)
 {
-	gint i;
-
-	tree = tree2 = gtk_tree_store_new(COL_NUMBER,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_POINTER, GDK_TYPE_COLOR,
-					  G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN);
-	model2 = GTK_TREE_MODEL(tree2);
-
-	for (parents[0] = NULL, i = 1; i < 256; i++)
-		parents[i] = (GtkTreeIter *) g_malloc(sizeof(GtkTreeIter));
+	switch (view_mode) {
+		case SINGLE_VIEW:
+			gtk_widget_hide(tree1_w);
+			current = &rootmenu;
+			display_tree_part();
+			break;
+		case SPLIT_VIEW:
+		{
+			gtk_widget_show(tree1_w);
+			gint w, h;
+			gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
+			gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
+			// Clear right frame, the user has to choose a subtree first
+			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+			gtk_tree_store_clear(tree2);
+			// Display tree in left frame
+			display_list();
 
-	tree1 = gtk_tree_store_new(COL_NUMBER,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
-				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				   G_TYPE_BOOLEAN);
-	model1 = GTK_TREE_MODEL(tree1);
+			/* Disable back btn, like in full mode. */
+			gtk_widget_set_sensitive(back_btn, FALSE);
+			break;
+		}
+		case FULL_VIEW:
+		{
+			gtk_widget_hide(tree1_w);
+			GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+			gtk_tree_store_clear(tree2);
+			display_tree(&rootmenu, tree2);
+			gtk_widget_set_sensitive(back_btn, FALSE);
+			break;
+		}
+	}
 }
 
 void init_left_tree(void)
@@ -220,6 +230,19 @@ void init_left_tree(void)
 	GtkTreeSelection *sel;
 	GtkTreeViewColumn *column;
 
+	GtkTreeStore *tree1;
+	GtkTreeModel *model1;
+	tree1 = gtk_tree_store_new(COL_NUMBER,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_POINTER, GDK_TYPE_COLOR,
+				G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				G_TYPE_BOOLEAN);
+	model1 = GTK_TREE_MODEL(tree1);
+	
 	gtk_tree_view_set_model(view, model1);
 	gtk_tree_view_set_headers_visible(view, TRUE);
 	gtk_tree_view_set_rules_hint(view, TRUE);
@@ -262,6 +285,19 @@ void init_right_tree(void)
 	GtkTreeSelection *sel;
 	GtkTreeViewColumn *column;
 	gint i;
+	
+	GtkTreeStore *tree2;
+	GtkTreeModel *model2;
+	tree2 = gtk_tree_store_new(COL_NUMBER,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_STRING, G_TYPE_STRING,
+				G_TYPE_POINTER, GDK_TYPE_COLOR,
+				G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				G_TYPE_BOOLEAN);
+	model2 = GTK_TREE_MODEL(tree2);
 
 	gtk_tree_view_set_model(view, model2);
 	gtk_tree_view_set_headers_visible(view, TRUE);
@@ -436,7 +472,7 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 	switch (result) {
 	case GTK_RESPONSE_YES:
 		if (conf_write(NULL))
-			text_insert_msg(_("Error"), _("Unable to save configuration !"));
+			text_insert_msg(_("Error"), _("Unable to save configuration on exit!"));
 		return FALSE;
 	case GTK_RESPONSE_NO:
 		return FALSE;
@@ -451,35 +487,12 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 }
 
 
-void on_window1_destroy(GtkObject * object, gpointer user_data)
+void on_window1_destroy(GObject * object, gpointer user_data)
 {
 	gtk_main_quit();
 }
 
 
-void
-on_window1_size_request(GtkWidget * widget,
-			GtkRequisition * requisition, gpointer user_data)
-{
-	static gint old_h;
-	int w, h;
-	GdkWindow * window = gtk_widget_get_window(widget);
-
-	if (window == NULL)
-		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-	else {
-		w = gdk_window_get_width(window);
-		h = gdk_window_get_height(window);
-	}
-
-	if (h == old_h)
-		return;
-	old_h = h;
-
-	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
-}
-
-
 /* Menu & Toolbar Callbacks */
 
 void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
@@ -498,12 +511,17 @@ void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
 		if (conf_read(filename))
 			text_insert_msg(_("Error"), _("Unable to load configuration !"));
 		else
-			display_tree(&rootmenu);
+			show_data();
 		g_free (filename);
 	}
 	gtk_widget_destroy (dialog);
 }
 
+void on_save_activate(GtkMenuItem * menuitem, gpointer user_data)
+{
+	if (conf_write(NULL))
+		text_insert_msg(_("Error"), _("Unable to save configuration !"));
+}
 
 void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
@@ -580,8 +598,9 @@ void
 on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_NORMAL;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
 
 
@@ -589,8 +608,9 @@ void
 on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_ALL;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
 
 
@@ -598,8 +618,9 @@ void
 on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	opt_mode = OPT_PROMPT;
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(&rootmenu, tree2);	/* instead of update_tree to speed-up */
 }
 
 
@@ -627,9 +648,9 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", intro_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
+	g_signal_connect(dialog, "response",
 				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
+				 dialog);
 	gtk_widget_show_all(dialog);
 }
 
@@ -638,16 +659,17 @@ void on_about1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *about_text =
-	    _("gkc is copyright (c) 2002 Romain Lievin <roms@lpg.ticalc.org>.\n"
+	    _("Updated to gtk3, copyright (c) 2013 David Gräff <david.graeff@udo.edu>.\n"
+		  "gkc is copyright (c) 2002 Romain Lievin <roms@lpg.ticalc.org>.\n"
 	      "Based on the source code from Roman Zippel.\n");
 
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", about_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
+	g_signal_connect(dialog, "response",
 				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
+				 dialog);
 	gtk_widget_show_all(dialog);
 }
 
@@ -664,9 +686,9 @@ void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
 					GTK_BUTTONS_CLOSE, "%s", license_text);
-	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
+	g_signal_connect(dialog, "response",
 				 G_CALLBACK(gtk_widget_destroy),
-				 GTK_OBJECT(dialog));
+				 dialog);
 	gtk_widget_show_all(dialog);
 }
 
@@ -695,36 +717,21 @@ void on_load_clicked(GtkButton * button, gpointer user_data)
 void on_single_clicked(GtkButton * button, gpointer user_data)
 {
 	view_mode = SINGLE_VIEW;
-	gtk_widget_hide(tree1_w);
-	current = &rootmenu;
-	display_tree_part();
+	show_data();
 }
 
 
 void on_split_clicked(GtkButton * button, gpointer user_data)
 {
-	gint w, h;
 	view_mode = SPLIT_VIEW;
-	gtk_widget_show(tree1_w);
-	gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-	gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
-	if (tree2)
-		gtk_tree_store_clear(tree2);
-	display_list();
-
-	/* Disable back btn, like in full mode. */
-	gtk_widget_set_sensitive(back_btn, FALSE);
+	show_data();
 }
 
 
 void on_full_clicked(GtkButton * button, gpointer user_data)
 {
 	view_mode = FULL_VIEW;
-	gtk_widget_hide(tree1_w);
-	if (tree2)
-		gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);
-	gtk_widget_set_sensitive(back_btn, FALSE);
+	show_data();
 }
 
 
@@ -752,6 +759,9 @@ static void renderer_edited(GtkCellRendererText * cell,
 	const char *old_def, *new_def;
 	struct menu *menu;
 	struct symbol *sym;
+	
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
+	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
 
 	if (!gtk_tree_model_get_iter(model2, &iter, path))
 		return;
@@ -764,13 +774,13 @@ static void renderer_edited(GtkCellRendererText * cell,
 
 	sym_set_string_value(sym, new_def);
 
-	update_tree(&rootmenu, NULL);
+	update_tree(&rootmenu, NULL, tree2);
 
 	gtk_tree_path_free(path);
 }
 
 /* Change the value of a symbol and update the tree */
-static void change_sym_value(struct menu *menu, gint col)
+static void change_sym_value(struct menu *menu, gint col, GtkTreeStore* tree)
 {
 	struct symbol *sym = menu->sym;
 	tristate newval;
@@ -794,9 +804,9 @@ static void change_sym_value(struct menu *menu, gint col)
 			newval = yes;
 		sym_set_tristate_value(sym, newval);
 		if (view_mode == FULL_VIEW)
-			update_tree(&rootmenu, NULL);
+			update_tree(&rootmenu, NULL, tree);
 		else if (view_mode == SPLIT_VIEW) {
-			update_tree(browsed, NULL);
+			update_tree(browsed, NULL, tree);
 			display_list();
 		}
 		else if (view_mode == SINGLE_VIEW)
@@ -810,16 +820,16 @@ static void change_sym_value(struct menu *menu, gint col)
 	}
 }
 
-static void toggle_sym_value(struct menu *menu)
+static void toggle_sym_value(struct menu *menu, GtkTreeStore* tree)
 {
 	if (!menu->sym)
 		return;
 
 	sym_toggle_tristate_value(menu->sym);
 	if (view_mode == FULL_VIEW)
-		update_tree(&rootmenu, NULL);
+		update_tree(&rootmenu, NULL, tree);
 	else if (view_mode == SPLIT_VIEW) {
-		update_tree(browsed, NULL);
+		update_tree(browsed, NULL, tree);
 		display_list();
 	}
 	else if (view_mode == SINGLE_VIEW)
@@ -848,22 +858,16 @@ on_treeview2_button_press_event(GtkWidget * widget,
 				GdkEventButton * event, gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(view);
+	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
 	GtkTreePath *path;
 	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
 	struct menu *menu;
 	gint col;
+	
 
-#if GTK_CHECK_VERSION(2,1,4) // bug in ctree with earlier version of GTK
-	gint tx = (gint) event->x;
-	gint ty = (gint) event->y;
-	gint cx, cy;
-
-	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, &cx,
-				      &cy);
-#else
 	gtk_tree_view_get_cursor(view, &path, &column);
-#endif
 	if (path == NULL)
 		return FALSE;
 
@@ -882,16 +886,16 @@ on_treeview2_button_press_event(GtkWidget * widget,
 			display_tree_part();
 			gtk_widget_set_sensitive(back_btn, TRUE);
 		} else if ((col == COL_OPTION)) {
-			toggle_sym_value(menu);
+			toggle_sym_value(menu, tree2);
 			gtk_tree_view_expand_row(view, path, TRUE);
 		}
 	} else {
 		if (col == COL_VALUE) {
-			toggle_sym_value(menu);
+			toggle_sym_value(menu, tree2);
 			gtk_tree_view_expand_row(view, path, TRUE);
 		} else if (col == COL_NO || col == COL_MOD
 			   || col == COL_YES) {
-			change_sym_value(menu, col);
+			change_sym_value(menu, col, tree2);
 			gtk_tree_view_expand_row(view, path, TRUE);
 		}
 	}
@@ -905,6 +909,8 @@ on_treeview2_key_press_event(GtkWidget * widget,
 			     GdkEventKey * event, gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(view);
+	GtkTreeStore* tree2 = GTK_TREE_STORE(model2);
 	GtkTreePath *path;
 	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
@@ -915,14 +921,14 @@ on_treeview2_key_press_event(GtkWidget * widget,
 	if (path == NULL)
 		return FALSE;
 
-	if (event->keyval == GDK_space) {
+	if (event->keyval == GDK_KEY_space) {
 		if (gtk_tree_view_row_expanded(view, path))
 			gtk_tree_view_collapse_row(view, path);
 		else
 			gtk_tree_view_expand_row(view, path, FALSE);
 		return TRUE;
 	}
-	if (event->keyval == GDK_KP_Enter) {
+	if (event->keyval == GDK_KEY_KP_Enter) {
 	}
 	if (widget == tree1_w)
 		return FALSE;
@@ -938,7 +944,7 @@ on_treeview2_key_press_event(GtkWidget * widget,
 		col = COL_YES;
 	else
 		col = -1;
-	change_sym_value(menu, col);
+	change_sym_value(menu, col, tree2);
 
 	return FALSE;
 }
@@ -946,57 +952,39 @@ on_treeview2_key_press_event(GtkWidget * widget,
 
 /* Row selection changed: update help */
 void
-on_treeview2_cursor_changed(GtkTreeView * treeview, gpointer user_data)
+on_treeview2_selection_changed(GtkTreeSelection *selection, gpointer user_data)
 {
-	GtkTreeSelection *selection;
 	GtkTreeIter iter;
 	struct menu *menu;
 
-	selection = gtk_tree_view_get_selection(treeview);
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
 	if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
 		gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
 		text_insert_help(menu);
 	}
 }
 
-
 /* User click: display sub-tree in the right frame. */
-gboolean
-on_treeview1_button_press_event(GtkWidget * widget,
-				GdkEventButton * event, gpointer user_data)
+void
+on_treeview1_selection_changed(GtkTreeSelection *selection, gpointer user_data)
 {
-	GtkTreeView *view = GTK_TREE_VIEW(widget);
-	GtkTreePath *path;
-	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
 	struct menu *menu;
 
-	gint tx = (gint) event->x;
-	gint ty = (gint) event->y;
-	gint cx, cy;
-
-	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, &cx,
-				      &cy);
-	if (path == NULL)
-		return FALSE;
-
-	gtk_tree_model_get_iter(model1, &iter, path);
-	gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1);
-
-	if (event->type == GDK_2BUTTON_PRESS) {
-		toggle_sym_value(menu);
-		current = menu;
-		display_tree_part();
-	} else {
+	GtkTreeModel* model1 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w));
+	if (gtk_tree_selection_get_selected(selection, &model1, &iter)) {
+		gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1);
+			
+		text_insert_help(menu);
+		
+// 		GtkTreeStore* tree1 = GTK_TREE_STORE(model1);
+		
 		browsed = menu;
 		display_tree_part();
-	}
-
-	gtk_widget_realize(tree2_w);
-	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
-	gtk_widget_grab_focus(tree2_w);
 
-	return FALSE;
+// 		gtk_widget_realize(tree2_w);
+		gtk_widget_grab_focus(tree2_w);
+	}
 }
 
 
@@ -1126,18 +1114,17 @@ static gchar **fill_row(struct menu *menu)
 
 
 /* Set the node content with a row of strings */
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row)
+static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row, GtkTreeStore* tree)
 {
 	GdkColor color;
-	gboolean success;
 	GdkPixbuf *pix;
 
 	pix = gdk_pixbuf_new_from_xpm_data((const char **)
 					   row[COL_PIXBUF]);
 
-	gdk_color_parse(row[COL_COLOR], &color);
-	gdk_colormap_alloc_colors(gdk_colormap_get_system(), &color, 1,
-				  FALSE, FALSE, &success);
+ 	gdk_color_parse(row[COL_COLOR], &color);
+// 	gdk_colormap_alloc_colors(gdk_colormap_get_system(), &color, 1,
+// 				  FALSE, FALSE, &success);
 
 	gtk_tree_store_set(tree, node,
 			   COL_OPTION, row[COL_OPTION],
@@ -1162,13 +1149,13 @@ static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row)
 
 
 /* Add a node to the tree */
-static void place_node(struct menu *menu, char **row)
+static void place_node(struct menu *menu, char **row, GtkTreeStore* tree)
 {
 	GtkTreeIter *parent = parents[indent - 1];
 	GtkTreeIter *node = parents[indent];
 
 	gtk_tree_store_append(tree, node, parent);
-	set_node(node, menu, row);
+	set_node(node, menu, row, tree);
 }
 
 
@@ -1186,6 +1173,7 @@ GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
 	gboolean valid;
 	GtkTreeIter *ret;
 
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
 	valid = gtk_tree_model_iter_children(model2, child, parent);
 	while (valid) {
 		struct menu *menu;
@@ -1212,7 +1200,7 @@ GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
  * Update the tree by adding/removing entries
  * Does not change other nodes
  */
-static void update_tree(struct menu *src, GtkTreeIter * dst)
+static void update_tree(struct menu *src, GtkTreeIter * dst, GtkTreeStore* tree)
 {
 	struct menu *child1;
 	GtkTreeIter iter, tmp;
@@ -1225,6 +1213,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 	if (src == &rootmenu)
 		indent = 1;
 
+	GtkTreeModel* model2 = gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w));
 	valid = gtk_tree_model_iter_children(model2, child2, dst);
 	for (child1 = src->list; child1; child1 = child1->next) {
 
@@ -1253,7 +1242,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 				memcpy(&tmp, child2, sizeof(GtkTreeIter));
 				valid = gtk_tree_model_iter_next(model2,
 								 child2);
-				gtk_tree_store_remove(tree2, &tmp);
+				gtk_tree_store_remove(tree, &tmp);
 				if (!valid)
 					return;		/* next parent */
 				else
@@ -1268,28 +1257,28 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 					sibling = NULL;
 				else
 					sibling = child2;
-				gtk_tree_store_insert_before(tree2,
+				gtk_tree_store_insert_before(tree,
 							     child2,
 							     dst, sibling);
-				set_node(child2, menu1, fill_row(menu1));
+				set_node(child2, menu1, fill_row(menu1), tree);
 				if (menu2 == NULL)
 					valid = TRUE;
 			} else {	// remove node
 				memcpy(&tmp, child2, sizeof(GtkTreeIter));
 				valid = gtk_tree_model_iter_next(model2,
 								 child2);
-				gtk_tree_store_remove(tree2, &tmp);
+				gtk_tree_store_remove(tree, &tmp);
 				if (!valid)
 					return;	// next parent
 				else
 					goto reparse;	// next child
 			}
 		} else if (sym && (sym->flags & SYMBOL_CHANGED)) {
-			set_node(child2, menu1, fill_row(menu1));
+			set_node(child2, menu1, fill_row(menu1), tree);
 		}
 
 		indent++;
-		update_tree(child1, child2);
+		update_tree(child1, child2, tree);
 		indent--;
 
 		valid = gtk_tree_model_iter_next(model2, child2);
@@ -1298,12 +1287,14 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 
 
 /* Display the whole tree (single/split/full view) */
-static void display_tree(struct menu *menu)
+static void display_tree(struct menu *menu, GtkTreeStore* tree)
 {
 	struct symbol *sym;
 	struct property *prop;
 	struct menu *child;
 	enum prop_type ptype;
+	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w)));
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
 
 	if (menu == &rootmenu) {
 		indent = 1;
@@ -1329,7 +1320,7 @@ static void display_tree(struct menu *menu)
 		if ((opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
 		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
 		    (opt_mode == OPT_ALL    && menu_get_prompt(child)))
-			place_node(child, fill_row(child));
+			place_node(child, fill_row(child), tree);
 #ifdef DEBUG
 		printf("%*c%s: ", indent, ' ', menu_get_prompt(child));
 		printf("%s", child->flags & MENU_ROOT ? "rootmenu | " : "");
@@ -1360,7 +1351,7 @@ static void display_tree(struct menu *menu)
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW)) {
 			indent++;
-			display_tree(child);
+			display_tree(child, tree);
 			indent--;
 		}
 	}
@@ -1369,25 +1360,24 @@ static void display_tree(struct menu *menu)
 /* Display a part of the tree starting at current node (single/split view) */
 static void display_tree_part(void)
 {
-	if (tree2)
-		gtk_tree_store_clear(tree2);
+	GtkTreeStore* tree2 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree2_w)));
+	gtk_tree_store_clear(tree2);
+
 	if (view_mode == SINGLE_VIEW)
-		display_tree(current);
+		display_tree(current, tree2);
 	else if (view_mode == SPLIT_VIEW)
-		display_tree(browsed);
+		display_tree(browsed, tree2);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
 /* Display the list in the left frame (split view) */
 static void display_list(void)
 {
-	if (tree1)
-		gtk_tree_store_clear(tree1);
+	GtkTreeStore* tree1 = GTK_TREE_STORE(gtk_tree_view_get_model(GTK_TREE_VIEW (tree1_w)));
+	gtk_tree_store_clear(tree1);
 
-	tree = tree1;
-	display_tree(&rootmenu);
+	display_tree(&rootmenu, tree1);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
-	tree = tree2;
 }
 
 void fixup_rootmenu(struct menu *menu)
@@ -1412,16 +1402,15 @@ int main(int ac, char *av[])
 {
 	const char *name;
 	char *env;
-	gchar *glade_file;
+	gchar *ui_file;
 
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	bind_textdomain_codeset(PACKAGE, "UTF-8");
 	textdomain(PACKAGE);
+	setlocale (LC_ALL, NULL);
 
 	/* GTK stuffs */
-	gtk_set_locale();
 	gtk_init(&ac, &av);
-	glade_init();
 
 	//add_pixmap_directory (PACKAGE_DATA_DIR "/" PACKAGE "/pixmaps");
 	//add_pixmap_directory (PACKAGE_SOURCE_DIR "/pixmaps");
@@ -1429,11 +1418,11 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/scripts/kconfig/gconfig/gconf.glade", NULL);
+		ui_file = g_strconcat(env, "/scripts/kconfig/gconfig/gconf.ui", NULL);
 	else if (av[0][0] == '/')
-		glade_file = g_strconcat(av[0], ".glade", NULL);
+		ui_file = g_strconcat(av[0], ".ui", NULL);
 	else
-		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".glade", NULL);
+		ui_file = g_strconcat(g_get_current_dir(), "/", av[0], ".ui", NULL);
 
 	/* Conf stuffs */
 	if (ac > 1 && av[1][0] == '-') {
@@ -1454,23 +1443,16 @@ int main(int ac, char *av[])
 	fixup_rootmenu(&rootmenu);
 	conf_read(NULL);
 
+	/* Prepare GtkTreeIter */
+	gint i;
+	for (parents[0] = NULL, i = 1; i < 256; i++)
+		parents[i] = (GtkTreeIter *) g_malloc(sizeof(GtkTreeIter));
+	
 	/* Load the interface and connect signals */
-	init_main_window(glade_file);
-	init_tree_model();
+	init_main_window(ui_file);
 	init_left_tree();
 	init_right_tree();
-
-	switch (view_mode) {
-	case SINGLE_VIEW:
-		display_tree_part();
-		break;
-	case SPLIT_VIEW:
-		display_list();
-		break;
-	case FULL_VIEW:
-		display_tree(&rootmenu);
-		break;
-	}
+	show_data();
 
 	gtk_main();
 
diff --git a/scripts/kconfig/gconfig/gconf.glade b/scripts/kconfig/gconfig/gconf.glade
deleted file mode 100644
index aa483cb..0000000
--- a/scripts/kconfig/gconfig/gconf.glade
+++ /dev/null
@@ -1,661 +0,0 @@
-<?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
-
-<glade-interface>
-
-<widget class="GtkWindow" id="window1">
-  <property name="visible">True</property>
-  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
-  <property name="type">GTK_WINDOW_TOPLEVEL</property>
-  <property name="window_position">GTK_WIN_POS_NONE</property>
-  <property name="modal">False</property>
-  <property name="default_width">640</property>
-  <property name="default_height">480</property>
-  <property name="resizable">True</property>
-  <property name="destroy_with_parent">False</property>
-  <property name="decorated">True</property>
-  <property name="skip_taskbar_hint">False</property>
-  <property name="skip_pager_hint">False</property>
-  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
-  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
-  <signal name="destroy" handler="on_window1_destroy" object="window1"/>
-  <signal name="size_request" handler="on_window1_size_request" object="vpaned1" last_modification_time="Fri, 11 Jan 2002 16:17:11 GMT"/>
-  <signal name="delete_event" handler="on_window1_delete_event" object="window1" last_modification_time="Sun, 09 Mar 2003 19:42:46 GMT"/>
-
-  <child>
-    <widget class="GtkVBox" id="vbox1">
-      <property name="visible">True</property>
-      <property name="homogeneous">False</property>
-      <property name="spacing">0</property>
-
-      <child>
-	<widget class="GtkMenuBar" id="menubar1">
-	  <property name="visible">True</property>
-
-	  <child>
-	    <widget class="GtkMenuItem" id="file1">
-	      <property name="visible">True</property>
-	      <property name="label" translatable="yes">_File</property>
-	      <property name="use_underline">True</property>
-
-	      <child>
-		<widget class="GtkMenu" id="file1_menu">
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="load1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Load a config file</property>
-		      <property name="label" translatable="yes">_Load</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_load1_activate"/>
-		      <accelerator key="L" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image39">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-open</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="save1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Save the config in .config</property>
-		      <property name="label" translatable="yes">_Save</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_save_activate"/>
-		      <accelerator key="S" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image40">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-save</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="save_as1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Save the config in a file</property>
-		      <property name="label" translatable="yes">Save _as</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_save_as1_activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image41">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-save-as</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkSeparatorMenuItem" id="separator1">
-		      <property name="visible">True</property>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="quit1">
-		      <property name="visible">True</property>
-		      <property name="label" translatable="yes">_Quit</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_quit1_activate"/>
-		      <accelerator key="Q" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image42">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-quit</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-		</widget>
-	      </child>
-	    </widget>
-	  </child>
-
-	  <child>
-	    <widget class="GtkMenuItem" id="options1">
-	      <property name="visible">True</property>
-	      <property name="label" translatable="yes">_Options</property>
-	      <property name="use_underline">True</property>
-
-	      <child>
-		<widget class="GtkMenu" id="options1_menu">
-
-		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_name1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show name</property>
-		      <property name="label" translatable="yes">Show _name</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_name1_activate"/>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_range1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show range (Y/M/N)</property>
-		      <property name="label" translatable="yes">Show _range</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_range1_activate"/>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_data1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show value of the option</property>
-		      <property name="label" translatable="yes">Show _data</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_data1_activate"/>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkSeparatorMenuItem" id="separator2">
-		      <property name="visible">True</property>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode1">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show normal options</property>
-		      <property name="label" translatable="yes">Show normal options</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">True</property>
-		      <signal name="activate" handler="on_set_option_mode1_activate"/>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode2">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show all options</property>
-		      <property name="label" translatable="yes">Show all _options</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">False</property>
-		      <property name="group">set_option_mode1</property>
-		      <signal name="activate" handler="on_set_option_mode2_activate"/>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode3">
-		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show all options with prompts</property>
-		      <property name="label" translatable="yes">Show all prompt options</property>
-		      <property name="use_underline">True</property>
-		      <property name="active">False</property>
-		      <property name="group">set_option_mode1</property>
-		      <signal name="activate" handler="on_set_option_mode3_activate"/>
-		    </widget>
-		  </child>
-
-		</widget>
-	      </child>
-	    </widget>
-	  </child>
-
-	  <child>
-	    <widget class="GtkMenuItem" id="help1">
-	      <property name="visible">True</property>
-	      <property name="label" translatable="yes">_Help</property>
-	      <property name="use_underline">True</property>
-
-	      <child>
-		<widget class="GtkMenu" id="help1_menu">
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="introduction1">
-		      <property name="visible">True</property>
-		      <property name="label" translatable="yes">_Introduction</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_introduction1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
-		      <accelerator key="I" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image43">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-dialog-question</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="about1">
-		      <property name="visible">True</property>
-		      <property name="label" translatable="yes">_About</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_about1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
-		      <accelerator key="A" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image44">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-properties</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-
-		  <child>
-		    <widget class="GtkImageMenuItem" id="license1">
-		      <property name="visible">True</property>
-		      <property name="label" translatable="yes">_License</property>
-		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_license1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
-
-		      <child internal-child="image">
-			<widget class="GtkImage" id="image45">
-			  <property name="visible">True</property>
-			  <property name="stock">gtk-justify-fill</property>
-			  <property name="icon_size">1</property>
-			  <property name="xalign">0.5</property>
-			  <property name="yalign">0.5</property>
-			  <property name="xpad">0</property>
-			  <property name="ypad">0</property>
-			</widget>
-		      </child>
-		    </widget>
-		  </child>
-		</widget>
-	      </child>
-	    </widget>
-	  </child>
-	</widget>
-	<packing>
-	  <property name="padding">0</property>
-	  <property name="expand">False</property>
-	  <property name="fill">False</property>
-	</packing>
-      </child>
-
-      <child>
-	<widget class="GtkHandleBox" id="handlebox1">
-	  <property name="visible">True</property>
-	  <property name="shadow_type">GTK_SHADOW_OUT</property>
-	  <property name="handle_position">GTK_POS_LEFT</property>
-	  <property name="snap_edge">GTK_POS_TOP</property>
-
-	  <child>
-	    <widget class="GtkToolbar" id="toolbar1">
-	      <property name="visible">True</property>
-	      <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
-	      <property name="toolbar_style">GTK_TOOLBAR_BOTH</property>
-	      <property name="tooltips">True</property>
-	      <property name="show_arrow">True</property>
-
-	      <child>
-		<widget class="GtkToolButton" id="button1">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Goes up of one level (single view)</property>
-		  <property name="label" translatable="yes">Back</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-undo</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_back_clicked"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolItem" id="toolitem1">
-		  <property name="visible">True</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-
-		  <child>
-		    <widget class="GtkVSeparator" id="vseparator1">
-		      <property name="visible">True</property>
-		    </widget>
-		  </child>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">False</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button2">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Load a config file</property>
-		  <property name="label" translatable="yes">Load</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-open</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_load_clicked"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button3">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Save a config file</property>
-		  <property name="label" translatable="yes">Save</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-save</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_save_activate"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolItem" id="toolitem2">
-		  <property name="visible">True</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-
-		  <child>
-		    <widget class="GtkVSeparator" id="vseparator2">
-		      <property name="visible">True</property>
-		    </widget>
-		  </child>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">False</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button4">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Single view</property>
-		  <property name="label" translatable="yes">Single</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-missing-image</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_single_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:39 GMT"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button5">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Split view</property>
-		  <property name="label" translatable="yes">Split</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-missing-image</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_split_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:45 GMT"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button6">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Full view</property>
-		  <property name="label" translatable="yes">Full</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-missing-image</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_full_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:50 GMT"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolItem" id="toolitem3">
-		  <property name="visible">True</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-
-		  <child>
-		    <widget class="GtkVSeparator" id="vseparator3">
-		      <property name="visible">True</property>
-		    </widget>
-		  </child>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">False</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button7">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Collapse the whole tree in the right frame</property>
-		  <property name="label" translatable="yes">Collapse</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-remove</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_collapse_clicked"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkToolButton" id="button8">
-		  <property name="visible">True</property>
-		  <property name="tooltip" translatable="yes">Expand the whole tree in the right frame</property>
-		  <property name="label" translatable="yes">Expand</property>
-		  <property name="use_underline">True</property>
-		  <property name="stock_id">gtk-add</property>
-		  <property name="visible_horizontal">True</property>
-		  <property name="visible_vertical">True</property>
-		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_expand_clicked"/>
-		</widget>
-		<packing>
-		  <property name="expand">False</property>
-		  <property name="homogeneous">True</property>
-		</packing>
-	      </child>
-	    </widget>
-	  </child>
-	</widget>
-	<packing>
-	  <property name="padding">0</property>
-	  <property name="expand">False</property>
-	  <property name="fill">False</property>
-	</packing>
-      </child>
-
-      <child>
-	<widget class="GtkHPaned" id="hpaned1">
-	  <property name="width_request">1</property>
-	  <property name="visible">True</property>
-	  <property name="can_focus">True</property>
-	  <property name="position">0</property>
-
-	  <child>
-	    <widget class="GtkScrolledWindow" id="scrolledwindow1">
-	      <property name="visible">True</property>
-	      <property name="hscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
-	      <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
-	      <property name="shadow_type">GTK_SHADOW_IN</property>
-	      <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
-
-	      <child>
-		<widget class="GtkTreeView" id="treeview1">
-		  <property name="visible">True</property>
-		  <property name="can_focus">True</property>
-		  <property name="headers_visible">True</property>
-		  <property name="rules_hint">False</property>
-		  <property name="reorderable">False</property>
-		  <property name="enable_search">False</property>
-		  <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:58:22 GMT"/>
-		  <signal name="button_press_event" handler="on_treeview1_button_press_event" last_modification_time="Sun, 12 Jan 2003 16:03:52 GMT"/>
-		  <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 16:11:44 GMT"/>
-		</widget>
-	      </child>
-	    </widget>
-	    <packing>
-	      <property name="shrink">True</property>
-	      <property name="resize">False</property>
-	    </packing>
-	  </child>
-
-	  <child>
-	    <widget class="GtkVPaned" id="vpaned1">
-	      <property name="visible">True</property>
-	      <property name="can_focus">True</property>
-	      <property name="position">0</property>
-
-	      <child>
-		<widget class="GtkScrolledWindow" id="scrolledwindow2">
-		  <property name="visible">True</property>
-		  <property name="hscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
-		  <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
-		  <property name="shadow_type">GTK_SHADOW_IN</property>
-		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
-
-		  <child>
-		    <widget class="GtkTreeView" id="treeview2">
-		      <property name="visible">True</property>
-		      <property name="can_focus">True</property>
-		      <property name="has_focus">True</property>
-		      <property name="headers_visible">True</property>
-		      <property name="rules_hint">False</property>
-		      <property name="reorderable">False</property>
-		      <property name="enable_search">False</property>
-		      <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:57:55 GMT"/>
-		      <signal name="button_press_event" handler="on_treeview2_button_press_event" last_modification_time="Sun, 12 Jan 2003 15:57:58 GMT"/>
-		      <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 15:58:01 GMT"/>
-		    </widget>
-		  </child>
-		</widget>
-		<packing>
-		  <property name="shrink">True</property>
-		  <property name="resize">False</property>
-		</packing>
-	      </child>
-
-	      <child>
-		<widget class="GtkScrolledWindow" id="scrolledwindow3">
-		  <property name="visible">True</property>
-		  <property name="hscrollbar_policy">GTK_POLICY_NEVER</property>
-		  <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
-		  <property name="shadow_type">GTK_SHADOW_IN</property>
-		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
-
-		  <child>
-		    <widget class="GtkTextView" id="textview3">
-		      <property name="visible">True</property>
-		      <property name="can_focus">True</property>
-		      <property name="editable">False</property>
-		      <property name="overwrite">False</property>
-		      <property name="accepts_tab">True</property>
-		      <property name="justification">GTK_JUSTIFY_LEFT</property>
-		      <property name="wrap_mode">GTK_WRAP_WORD</property>
-		      <property name="cursor_visible">True</property>
-		      <property name="pixels_above_lines">0</property>
-		      <property name="pixels_below_lines">0</property>
-		      <property name="pixels_inside_wrap">0</property>
-		      <property name="left_margin">0</property>
-		      <property name="right_margin">0</property>
-		      <property name="indent">0</property>
-		      <property name="text" translatable="yes">Sorry, no help available for this option yet.</property>
-		    </widget>
-		  </child>
-		</widget>
-		<packing>
-		  <property name="shrink">True</property>
-		  <property name="resize">True</property>
-		</packing>
-	      </child>
-	    </widget>
-	    <packing>
-	      <property name="shrink">True</property>
-	      <property name="resize">True</property>
-	    </packing>
-	  </child>
-	</widget>
-	<packing>
-	  <property name="padding">0</property>
-	  <property name="expand">True</property>
-	  <property name="fill">True</property>
-	</packing>
-      </child>
-    </widget>
-  </child>
-</widget>
-
-</glade-interface>
diff --git a/scripts/kconfig/gconfig/gconf.ui b/scripts/kconfig/gconfig/gconf.ui
new file mode 100644
index 0000000..6aa29f7
--- /dev/null
+++ b/scripts/kconfig/gconfig/gconf.ui
@@ -0,0 +1,534 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<interface>
+  <!-- interface-requires gtk+ 3.0 -->
+  <object class="GtkImage" id="image1">
+    <property name="visible">True</property>
+    <property name="can_focus">False</property>
+    <property name="yalign">0.47999998927116394</property>
+    <property name="stock">gtk-dialog-question</property>
+  </object>
+  <object class="GtkImage" id="image2">
+    <property name="visible">True</property>
+    <property name="can_focus">False</property>
+    <property name="stock">gtk-justify-fill</property>
+  </object>
+  <object class="GtkTextBuffer" id="textbuffer1">
+    <property name="text">Sorry, no help available for this option yet.</property>
+  </object>
+  <object class="GtkWindow" id="window1">
+    <property name="can_focus">False</property>
+    <property name="title" translatable="yes">Gtk Kernel Configurator</property>
+    <property name="default_width">640</property>
+    <property name="default_height">250</property>
+    <signal name="destroy" handler="on_window1_destroy" swapped="no"/>
+    <signal name="delete-event" handler="on_window1_delete_event" swapped="no"/>
+    <child>
+      <object class="GtkVBox" id="vbox1">
+        <property name="visible">True</property>
+        <property name="can_focus">False</property>
+        <child>
+          <object class="GtkMenuBar" id="menubar1">
+            <property name="visible">True</property>
+            <property name="can_focus">False</property>
+            <child>
+              <object class="GtkMenuItem" id="file1">
+                <property name="visible">True</property>
+                <property name="can_focus">False</property>
+                <property name="label" translatable="yes">_File</property>
+                <property name="use_underline">True</property>
+                <child type="submenu">
+                  <object class="GtkMenu" id="menu1">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkImageMenuItem" id="load1">
+                        <property name="label">gtk-open</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Load a config file</property>
+                        <property name="use_underline">True</property>
+                        <property name="use_stock">True</property>
+                        <signal name="activate" handler="on_load1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkImageMenuItem" id="save1">
+                        <property name="label">gtk-save</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Save the config in .config</property>
+                        <property name="use_underline">True</property>
+                        <property name="use_stock">True</property>
+                        <signal name="activate" handler="on_save_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkImageMenuItem" id="save_as1">
+                        <property name="label">gtk-save-as</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Save the config in a file</property>
+                        <property name="use_underline">True</property>
+                        <property name="use_stock">True</property>
+                        <signal name="activate" handler="on_save_as1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkSeparatorMenuItem" id="separator1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkImageMenuItem" id="quit1">
+                        <property name="label">gtk-quit</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="use_underline">True</property>
+                        <property name="use_stock">True</property>
+                        <signal name="activate" handler="on_quit1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                  </object>
+                </child>
+              </object>
+            </child>
+            <child>
+              <object class="GtkMenuItem" id="options1">
+                <property name="visible">True</property>
+                <property name="can_focus">False</property>
+                <property name="label" translatable="yes">_Options</property>
+                <property name="use_underline">True</property>
+                <child type="submenu">
+                  <object class="GtkMenu" id="options1_menu">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkCheckMenuItem" id="show_name1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show name</property>
+                        <property name="label" translatable="yes">Show _name</property>
+                        <property name="use_underline">True</property>
+                        <signal name="activate" handler="on_show_name1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkCheckMenuItem" id="show_range1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show range (Y/M/N)</property>
+                        <property name="label" translatable="yes">Show _range</property>
+                        <property name="use_underline">True</property>
+                        <signal name="activate" handler="on_show_range1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkCheckMenuItem" id="show_data1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show value of the option</property>
+                        <property name="label" translatable="yes">Show _data</property>
+                        <property name="use_underline">True</property>
+                        <signal name="activate" handler="on_show_data1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkSeparatorMenuItem" id="separator2">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkRadioMenuItem" id="set_option_mode1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show normal options</property>
+                        <property name="label" translatable="yes">Show normal options</property>
+                        <property name="use_underline">True</property>
+                        <property name="active">True</property>
+                        <signal name="activate" handler="on_set_option_mode1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkRadioMenuItem" id="set_option_mode2">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show all options</property>
+                        <property name="label" translatable="yes">Show all _options</property>
+                        <property name="use_underline">True</property>
+                        <property name="group">set_option_mode1</property>
+                        <signal name="activate" handler="on_set_option_mode2_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkRadioMenuItem" id="set_option_mode3">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="tooltip_text" translatable="yes">Show all options with prompts</property>
+                        <property name="label" translatable="yes">Show all prompt options</property>
+                        <property name="use_underline">True</property>
+                        <property name="group">set_option_mode1</property>
+                        <signal name="activate" handler="on_set_option_mode3_activate" swapped="no"/>
+                      </object>
+                    </child>
+                  </object>
+                </child>
+              </object>
+            </child>
+            <child>
+              <object class="GtkMenuItem" id="menuitem4">
+                <property name="visible">True</property>
+                <property name="can_focus">False</property>
+                <property name="label" translatable="yes">_Hilfe</property>
+                <property name="use_underline">True</property>
+                <child type="submenu">
+                  <object class="GtkMenu" id="menu3">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkImageMenuItem" id="introduction1">
+                        <property name="label" translatable="yes">_Introduction</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="use_underline">True</property>
+                        <property name="image">image1</property>
+                        <property name="use_stock">False</property>
+                        <signal name="activate" handler="on_introduction1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkImageMenuItem" id="about1">
+                        <property name="label">gtk-about</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="use_underline">True</property>
+                        <property name="use_stock">True</property>
+                        <signal name="activate" handler="on_about1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                    <child>
+                      <object class="GtkImageMenuItem" id="license1">
+                        <property name="label" translatable="yes">_License</property>
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                        <property name="use_underline">True</property>
+                        <property name="image">image2</property>
+                        <property name="use_stock">False</property>
+                        <signal name="activate" handler="on_license1_activate" swapped="no"/>
+                      </object>
+                    </child>
+                  </object>
+                </child>
+              </object>
+            </child>
+          </object>
+          <packing>
+            <property name="expand">False</property>
+            <property name="fill">True</property>
+            <property name="position">0</property>
+          </packing>
+        </child>
+        <child>
+          <object class="GtkHandleBox" id="handlebox1">
+            <property name="visible">True</property>
+            <property name="can_focus">False</property>
+            <child>
+              <object class="GtkToolbar" id="toolbar1">
+                <property name="visible">True</property>
+                <property name="can_focus">False</property>
+                <property name="toolbar_style">both</property>
+                <child>
+                  <object class="GtkToolButton" id="button1">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Goes up of one level (single view)</property>
+                    <property name="tooltip_text" translatable="yes">Goes up of one level (single view)</property>
+                    <property name="label" translatable="yes">Back</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-undo</property>
+                    <signal name="clicked" handler="on_back_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolItem" id="toolitem1">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkVSeparator" id="vseparator1">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button2">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Load a config file</property>
+                    <property name="tooltip_text" translatable="yes">Load a config file</property>
+                    <property name="label" translatable="yes">Load</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-open</property>
+                    <signal name="clicked" handler="on_load_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button3">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Save a config file</property>
+                    <property name="tooltip_text" translatable="yes">Save a config file</property>
+                    <property name="label" translatable="yes">Save</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-save</property>
+                    <signal name="clicked" handler="on_save_activate" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolItem" id="toolitem2">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkVSeparator" id="vseparator2">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button4">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Single view</property>
+                    <property name="tooltip_text" translatable="yes">Single view</property>
+                    <property name="label" translatable="yes">Single</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-missing-image</property>
+                    <signal name="clicked" handler="on_single_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button5">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Split view</property>
+                    <property name="tooltip_text" translatable="yes">Split view</property>
+                    <property name="label" translatable="yes">Split</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-missing-image</property>
+                    <signal name="clicked" handler="on_split_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button6">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Full view</property>
+                    <property name="tooltip_text" translatable="yes">Full view</property>
+                    <property name="label" translatable="yes">Full</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-missing-image</property>
+                    <signal name="clicked" handler="on_full_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolItem" id="toolitem3">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <child>
+                      <object class="GtkVSeparator" id="vseparator3">
+                        <property name="visible">True</property>
+                        <property name="can_focus">False</property>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button7">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Collapse the whole tree in the right frame</property>
+                    <property name="tooltip_text" translatable="yes">Collapse the whole tree in the right frame</property>
+                    <property name="label" translatable="yes">Collapse</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-remove</property>
+                    <signal name="clicked" handler="on_collapse_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkToolButton" id="button8">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="has_tooltip">True</property>
+                    <property name="tooltip_markup" translatable="yes">Expand the whole tree in the right frame</property>
+                    <property name="tooltip_text" translatable="yes">Expand the whole tree in the right frame</property>
+                    <property name="label" translatable="yes">Expand</property>
+                    <property name="use_underline">True</property>
+                    <property name="stock_id">gtk-add</property>
+                    <signal name="clicked" handler="on_expand_clicked" swapped="no"/>
+                  </object>
+                  <packing>
+                    <property name="expand">False</property>
+                    <property name="homogeneous">True</property>
+                  </packing>
+                </child>
+              </object>
+            </child>
+          </object>
+          <packing>
+            <property name="expand">False</property>
+            <property name="fill">False</property>
+            <property name="position">1</property>
+          </packing>
+        </child>
+        <child>
+          <object class="GtkHPaned" id="hpaned1">
+            <property name="visible">True</property>
+            <property name="can_focus">True</property>
+            <child>
+              <object class="GtkScrolledWindow" id="scrolledwindow1">
+                <property name="width_request">100</property>
+                <property name="visible">True</property>
+                <property name="can_focus">False</property>
+                <property name="margin_right">3</property>
+                <property name="shadow_type">in</property>
+                <property name="min_content_width">150</property>
+                <child>
+                  <object class="GtkTreeView" id="treeview1">
+                    <property name="visible">True</property>
+                    <property name="can_focus">True</property>
+                    <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK | GDK_STRUCTURE_MASK</property>
+                    <property name="headers_clickable">False</property>
+                    <property name="enable_search">False</property>
+                    <signal name="key-press-event" handler="on_treeview2_key_press_event" swapped="no"/>
+                    <child internal-child="selection">
+                      <object class="GtkTreeSelection" id="treeview-selection3">
+                        <signal name="changed" handler="on_treeview1_selection_changed" swapped="no"/>
+                      </object>
+                    </child>
+                  </object>
+                </child>
+              </object>
+              <packing>
+                <property name="resize">True</property>
+                <property name="shrink">True</property>
+              </packing>
+            </child>
+            <child>
+              <object class="GtkVPaned" id="vpaned1">
+                <property name="visible">True</property>
+                <property name="can_focus">True</property>
+                <property name="margin_left">3</property>
+                <property name="hexpand">True</property>
+                <child>
+                  <object class="GtkScrolledWindow" id="scrolledwindow2">
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="vexpand">True</property>
+                    <child>
+                      <object class="GtkTreeView" id="treeview2">
+                        <property name="visible">True</property>
+                        <property name="can_focus">True</property>
+                        <property name="events">GDK_BUTTON_PRESS_MASK | GDK_KEY_PRESS_MASK | GDK_STRUCTURE_MASK</property>
+                        <property name="enable_search">False</property>
+                        <signal name="button-press-event" handler="on_treeview2_button_press_event" swapped="no"/>
+                        <signal name="key-press-event" handler="on_treeview2_key_press_event" swapped="no"/>
+                        <child internal-child="selection">
+                          <object class="GtkTreeSelection" id="treeview-selection4">
+                            <signal name="changed" handler="on_treeview2_selection_changed" swapped="no"/>
+                          </object>
+                        </child>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="resize">True</property>
+                    <property name="shrink">False</property>
+                  </packing>
+                </child>
+                <child>
+                  <object class="GtkScrolledWindow" id="scrolledwindow3">
+                    <property name="height_request">80</property>
+                    <property name="visible">True</property>
+                    <property name="can_focus">False</property>
+                    <property name="hscrollbar_policy">never</property>
+                    <property name="shadow_type">in</property>
+                    <child>
+                      <object class="GtkTextView" id="textview3">
+                        <property name="visible">True</property>
+                        <property name="can_focus">True</property>
+                        <property name="editable">False</property>
+                        <property name="wrap_mode">word</property>
+                        <property name="buffer">textbuffer1</property>
+                      </object>
+                    </child>
+                  </object>
+                  <packing>
+                    <property name="resize">True</property>
+                    <property name="shrink">True</property>
+                  </packing>
+                </child>
+              </object>
+              <packing>
+                <property name="resize">True</property>
+                <property name="shrink">True</property>
+              </packing>
+            </child>
+          </object>
+          <packing>
+            <property name="expand">True</property>
+            <property name="fill">True</property>
+            <property name="position">2</property>
+          </packing>
+        </child>
+      </object>
+    </child>
+  </object>
+</interface>
-- 
1.8.1.2

