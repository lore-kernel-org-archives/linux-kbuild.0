Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38269 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbeLUId3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 03:33:29 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/5] kconfig: add static qualifiers to fix gconf warnings
Date: Fri, 21 Dec 2018 17:33:06 +0900
Message-Id: <1545381188-514-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Add "static" to functions that are locally used in gconf.c
This fixes some "no previous prototype for ..." warnings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/gconf.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 14fc0fa..2d4e5a1 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -76,7 +76,7 @@ static void conf_changed(void);
 
 /* Helping/Debugging Functions */
 
-const char *dbg_sym_flags(int val)
+static const char *dbg_sym_flags(int val)
 {
 	static char buf[256];
 
@@ -106,8 +106,8 @@ const char *dbg_sym_flags(int val)
 	return buf;
 }
 
-void replace_button_icon(GladeXML * xml, GdkDrawable * window,
-			 GtkStyle * style, gchar * btn_name, gchar ** xpm)
+static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
+				GtkStyle *style, gchar *btn_name, gchar **xpm)
 {
 	GdkPixmap *pixmap;
 	GdkBitmap *mask;
@@ -125,7 +125,7 @@ void replace_button_icon(GladeXML * xml, GdkDrawable * window,
 }
 
 /* Main Window Initialization */
-void init_main_window(const gchar * glade_file)
+static void init_main_window(const gchar *glade_file)
 {
 	GladeXML *xml;
 	GtkWidget *widget;
@@ -187,7 +187,7 @@ void init_main_window(const gchar * glade_file)
 	gtk_widget_show(main_wnd);
 }
 
-void init_tree_model(void)
+static void init_tree_model(void)
 {
 	gint i;
 
@@ -217,7 +217,7 @@ void init_tree_model(void)
 	model1 = GTK_TREE_MODEL(tree1);
 }
 
-void init_left_tree(void)
+static void init_left_tree(void)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
 	GtkCellRenderer *renderer;
@@ -259,7 +259,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 			    const gchar * path_string,
 			    const gchar * new_text, gpointer user_data);
 
-void init_right_tree(void)
+static void init_right_tree(void)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(tree2_w);
 	GtkCellRenderer *renderer;
@@ -1209,8 +1209,8 @@ static GtkTreeIter found;
 /*
  * Find a menu in the GtkTree starting at parent.
  */
-GtkTreeIter *gtktree_iter_find_node(GtkTreeIter * parent,
-				    struct menu *tofind)
+static GtkTreeIter *gtktree_iter_find_node(GtkTreeIter *parent,
+					   struct menu *tofind)
 {
 	GtkTreeIter iter;
 	GtkTreeIter *child = &iter;
@@ -1421,7 +1421,7 @@ static void display_list(void)
 	tree = tree2;
 }
 
-void fixup_rootmenu(struct menu *menu)
+static void fixup_rootmenu(struct menu *menu)
 {
 	struct menu *child;
 	static int menu_cnt = 0;
-- 
2.7.4
