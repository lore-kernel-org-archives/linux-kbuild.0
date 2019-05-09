Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:56164 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfEICqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 22:46:52 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: remove trailing whitespaces
Date: Thu,  9 May 2019 11:46:31 +0900
Message-Id: <20190509024631.14406-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

There are still some trailing whitespaces under scripts/kconfig/tests/,
but they must be kept. Otherwise, "make testconfig" would break.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/gconf.c                  | 2 +-
 scripts/kconfig/lxdialog/BIG.FAT.WARNING | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5d4ecf309ee4..e36b342f1065 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -638,7 +638,7 @@ on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
-	const gchar *intro_text = 
+	const gchar *intro_text =
 	    "Welcome to gkc, the GTK+ graphical configuration tool\n"
 	    "For each option, a blank box indicates the feature is disabled, a\n"
 	    "check indicates it is enabled, and a dot indicates that it is to\n"
diff --git a/scripts/kconfig/lxdialog/BIG.FAT.WARNING b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
index a8999d82bdb3..7cb5a7ec93d2 100644
--- a/scripts/kconfig/lxdialog/BIG.FAT.WARNING
+++ b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
@@ -1,4 +1,4 @@
 This is NOT the official version of dialog.  This version has been
 significantly modified from the original.  It is for use by the Linux
-kernel configuration script.  Please do not bother Savio Lam with 
+kernel configuration script.  Please do not bother Savio Lam with
 questions about this program.
-- 
2.17.1
