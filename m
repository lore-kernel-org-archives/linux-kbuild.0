Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ee0-f52.google.com ([74.125.83.52]:44142 "EHLO
	mail-ee0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753087Ab3GBPXb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Jul 2013 11:23:31 -0400
Received: by mail-ee0-f52.google.com with SMTP id c50so2811149eek.39
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2013 08:23:30 -0700 (PDT)
From: davidgraeff <david.graeff@web.de>
Subject: [PATCH 2/9] kconfig: Update gtk interface codebase.
Date: Tue,  2 Jul 2013 17:22:23 +0200
Message-Id: <1372778550-22110-3-git-send-email-david.graeff@web.de>
In-Reply-To: <1372778550-22110-1-git-send-email-david.graeff@web.de>
References: <kconfig-port-gtk-qt>
 <1372778550-22110-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, davidgraeff <david.graeff@web.de>

Use only non-deprecated functions, use accessor functions instead of
direct access. A port to gtk3 should be easy now.
---
 scripts/kconfig/gconfig/Makefile |   4 +-
 scripts/kconfig/gconfig/gconf.c  | 177 +++++++++++++--------------------------
 2 files changed, 63 insertions(+), 118 deletions(-)

diff --git a/scripts/kconfig/gconfig/Makefile b/scripts/kconfig/gconfig/Makefile
index 1ce47a6..cf0c32b 100644
--- a/scripts/kconfig/gconfig/Makefile
+++ b/scripts/kconfig/gconfig/Makefile
@@ -28,7 +28,9 @@ clean-files	+= zconf.tab.c gconfig/gconf.glade.h gconf
 
 HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
-                          -Wno-missing-prototypes
+                          -Wno-missing-prototypes -DGTK_DISABLE_SINGLE_INCLUDES \
+                          -DGDK_DISABLE_DEPRECATED -DGTK_DISABLE_DEPRECATED \
+                          -DGSEAL_ENABLE
 
 $(obj)/gconfig/gconf.o: $(obj)/gconfig/.tmp_gtkcheck
 
diff --git a/scripts/kconfig/gconfig/gconf.c b/scripts/kconfig/gconfig/gconf.c
index aab4abf..36bad03 100644
--- a/scripts/kconfig/gconfig/gconf.c
+++ b/scripts/kconfig/gconfig/gconf.c
@@ -17,6 +17,7 @@
 #include <glade/glade.h>
 #include <gtk/gtk.h>
 #include <glib.h>
+#include <gdk/gdk.h>
 #include <gdk/gdkkeysyms.h>
 
 #include <stdio.h>
@@ -109,20 +110,17 @@ const char *dbg_sym_flags(int val)
 	return buf;
 }
 
-void replace_button_icon(GladeXML * xml, GdkDrawable * window,
-			 GtkStyle * style, gchar * btn_name, gchar ** xpm)
+void replace_button_icon(GladeXML * xml,
+			 gchar * btn_name, const char ** xpm)
 {
-	GdkPixmap *pixmap;
-	GdkBitmap *mask;
+	GdkPixbuf * pixmap;
 	GtkToolButton *button;
 	GtkWidget *image;
 
-	pixmap = gdk_pixmap_create_from_xpm_d(window, &mask,
-					      &style->bg[GTK_STATE_NORMAL],
-					      xpm);
+	pixmap = gdk_pixbuf_new_from_xpm_data(xpm);
 
 	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
-	image = gtk_image_new_from_pixmap(pixmap, mask);
+	image = gtk_image_new_from_pixbuf(pixmap);
 	gtk_widget_show(image);
 	gtk_tool_button_set_icon_widget(button, image);
 }
@@ -133,7 +131,6 @@ void init_main_window(const gchar * glade_file)
 	GladeXML *xml;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
-	GtkStyle *style;
 
 	xml = glade_xml_new(glade_file, "window1", NULL);
 	if (!xml)
@@ -166,40 +163,12 @@ void init_main_window(const gchar * glade_file)
 	save_menu_item = glade_xml_get_widget(xml, "save1");
 	conf_set_changed_callback(conf_changed);
 
-	style = gtk_widget_get_style(main_wnd);
 	widget = glade_xml_get_widget(xml, "toolbar1");
 
-#if 0	/* Use stock Gtk icons instead */
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button1", (gchar **) xpm_back);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button2", (gchar **) xpm_load);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button3", (gchar **) xpm_save);
-#endif
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button4", (gchar **) xpm_single_view);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button5", (gchar **) xpm_split_view);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button6", (gchar **) xpm_tree_view);
-
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
+	replace_button_icon(xml, "button4", xpm_single_view);
+	replace_button_icon(xml, "button5", xpm_split_view);
+	replace_button_icon(xml, "button6", xpm_tree_view);
+
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
 					  "foreground", "red",
@@ -436,7 +405,6 @@ static void text_insert_msg(const char *title, const char *message)
 
 /* Main Windows Callbacks */
 
-void on_save_activate(GtkMenuItem * menuitem, gpointer user_data);
 gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 				 gpointer user_data)
 {
@@ -461,13 +429,14 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 					GTK_RESPONSE_CANCEL);
 
 	label = gtk_label_new(_("\nSave configuration ?\n"));
-	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
+	gtk_container_add(GTK_CONTAINER(gtk_dialog_get_content_area(GTK_DIALOG(dialog))), label);
 	gtk_widget_show(label);
 
 	result = gtk_dialog_run(GTK_DIALOG(dialog));
 	switch (result) {
 	case GTK_RESPONSE_YES:
-		on_save_activate(NULL, NULL);
+		if (conf_write(NULL))
+			text_insert_msg(_("Error"), _("Unable to save configuration !"));
 		return FALSE;
 	case GTK_RESPONSE_NO:
 		return FALSE;
@@ -493,12 +462,15 @@ on_window1_size_request(GtkWidget * widget,
 			GtkRequisition * requisition, gpointer user_data)
 {
 	static gint old_h;
-	gint w, h;
+	int w, h;
+	GdkWindow * window = gtk_widget_get_window(widget);
 
-	if (widget->window == NULL)
+	if (window == NULL)
 		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-	else
-		gdk_window_get_size(widget->window, &w, &h);
+	else {
+		w = gdk_window_get_width(window);
+		h = gdk_window_get_height(window);
+	}
 
 	if (h == old_h)
 		return;
@@ -510,79 +482,50 @@ on_window1_size_request(GtkWidget * widget,
 
 /* Menu & Toolbar Callbacks */
 
-
-static void
-load_filename(GtkFileSelection * file_selector, gpointer user_data)
-{
-	const gchar *fn;
-
-	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
-					     (user_data));
-
-	if (conf_read(fn))
-		text_insert_msg(_("Error"), _("Unable to load configuration !"));
-	else
-		display_tree(&rootmenu);
-}
-
 void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
-	GtkWidget *fs;
-
-	fs = gtk_file_selection_new(_("Load file..."));
-	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
-			 "clicked",
-			 G_CALLBACK(load_filename), (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->ok_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->cancel_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	gtk_widget_show(fs);
-}
-
-
-void on_save_activate(GtkMenuItem * menuitem, gpointer user_data)
-{
-	if (conf_write(NULL))
-		text_insert_msg(_("Error"), _("Unable to save configuration !"));
+	GtkWidget *dialog;
+	dialog = gtk_file_chooser_dialog_new (_("Load file..."),
+						GTK_WINDOW(main_wnd),
+						GTK_FILE_CHOOSER_ACTION_OPEN,
+						GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
+						GTK_STOCK_OPEN, GTK_RESPONSE_ACCEPT,
+						NULL);
+	if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT)
+	{
+		char *filename;
+		filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));
+		if (conf_read(filename))
+			text_insert_msg(_("Error"), _("Unable to load configuration !"));
+		else
+			display_tree(&rootmenu);
+		g_free (filename);
+	}
+	gtk_widget_destroy (dialog);
 }
 
 
-static void
-store_filename(GtkFileSelection * file_selector, gpointer user_data)
-{
-	const gchar *fn;
-
-	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
-					     (user_data));
-
-	if (conf_write(fn))
-		text_insert_msg(_("Error"), _("Unable to save configuration !"));
-
-	gtk_widget_destroy(GTK_WIDGET(user_data));
-}
-
 void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
-	GtkWidget *fs;
-
-	fs = gtk_file_selection_new(_("Save file as..."));
-	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
-			 "clicked",
-			 G_CALLBACK(store_filename), (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->ok_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->cancel_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	gtk_widget_show(fs);
+	GtkWidget *dialog;
+
+	dialog = gtk_file_chooser_dialog_new (_("Save File as..."),
+				      GTK_WINDOW(main_wnd),
+				      GTK_FILE_CHOOSER_ACTION_SAVE,
+				      GTK_STOCK_CANCEL, GTK_RESPONSE_CANCEL,
+				      GTK_STOCK_SAVE, GTK_RESPONSE_ACCEPT,
+				      NULL);
+	gtk_file_chooser_set_do_overwrite_confirmation (GTK_FILE_CHOOSER (dialog), TRUE);
+	
+	if (gtk_dialog_run (GTK_DIALOG (dialog)) == GTK_RESPONSE_ACCEPT)
+	{
+		char *filename;
+		filename = gtk_file_chooser_get_filename (GTK_FILE_CHOOSER (dialog));
+		if (conf_write(filename))
+			text_insert_msg(_("Error"), _("Unable to save configuration !"));
+		g_free (filename);
+	}
+	gtk_widget_destroy (dialog);
 }
 
 
@@ -597,7 +540,7 @@ void on_show_name1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_name = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_name = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NAME);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_name);
@@ -608,7 +551,7 @@ void on_show_range1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_range = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_range = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NO);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_range);
@@ -626,7 +569,7 @@ void on_show_data1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_value = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_value = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_VALUE);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_value);
-- 
1.8.1.2

