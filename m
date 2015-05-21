Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:34297 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422772AbbEUTyv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 May 2015 15:54:51 -0400
From: "Leonid V. Fedorenchik" <leonidsbox@gmail.com>
Subject: [PATCH] gconf: Unify exit dialog with the one from qconf
Date: Thu, 21 May 2015 22:53:18 +0300
Message-Id: <1432237998-30330-1-git-send-email-leonidsbox@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, "Leonid V. Fedorenchik" <leonidsbox@gmail.com>

Make exit dialog more user-friendly and, at the same time, make it
similar to the one from qconf.

Signed-off-by: Leonid V. Fedorenchik <leonidsbox@gmail.com>
---
 scripts/kconfig/gconf.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 26d208b..9348c9f 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -422,21 +422,21 @@ gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
 	if (!conf_get_changed())
 		return FALSE;
 
-	dialog = gtk_dialog_new_with_buttons(_("Warning !"),
+	dialog = gtk_dialog_new_with_buttons(_("gconf"),
 					     GTK_WINDOW(main_wnd),
 					     (GtkDialogFlags)
 					     (GTK_DIALOG_MODAL |
 					      GTK_DIALOG_DESTROY_WITH_PARENT),
-					     GTK_STOCK_OK,
+					     _("Save Changes"),
 					     GTK_RESPONSE_YES,
-					     GTK_STOCK_NO,
+					     _("Discard Changes"),
 					     GTK_RESPONSE_NO,
-					     GTK_STOCK_CANCEL,
+					     _("Cancel Exit"),
 					     GTK_RESPONSE_CANCEL, NULL);
 	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
 					GTK_RESPONSE_CANCEL);
 
-	label = gtk_label_new(_("\nSave configuration ?\n"));
+	label = gtk_label_new(_("\nSave configuration?\n"));
 	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
 	gtk_widget_show(label);
 
-- 
2.4.1.217.g6c1249c

