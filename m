Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:47481 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752826Ab0IVRMF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Sep 2010 13:12:05 -0400
Received: by ywh1 with SMTP id 1so242497ywh.19
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Sep 2010 10:12:04 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [DIFF] kbuild-generic-v6 -> kbuild/kconfig/kbuild-generic-v7
Date: Wed, 22 Sep 2010 13:07:54 -0400
Message-Id: <1285175274-10232-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284264744-27530-1-git-send-email-lacombar@gmail.com>
References: <1284264744-27530-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

Changes since branch `kbuild-generic-v6' are:
 - rebase against `kbuild/kconfig'
 - extra parens/column fixes after Michal's comments
 - delayed window initialization for gconf in order to wait for rootmenu
   initialization.
 - commit tagging

Note that I kept the grammar change and parser regeneration in two separate
commits, one after the other.

This branch merge without conflict with 2.6.36-rc5 and the next-20100921 tree.
Tested with {x,n,menu}config on i386, sh and um.

The updated series is available in the git repository at:

 git://github.com/lacombar/linux-2.6.git kbuild/kconfig/kbuild-generic-v7

Thanks,
 - Arnaud

---
 scripts/kconfig/gconf.c  |   12 ++++++------
 scripts/kconfig/nconf.c  |    2 +-
 scripts/kconfig/qconf.cc |    2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 7d48a51..4558961 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1527,12 +1527,6 @@ int main(int ac, char *av[])
 	else
 		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".glade", NULL);
 
-	/* Load the interface and connect signals */
-	init_main_window(glade_file);
-	init_tree_model();
-	init_left_tree();
-	init_right_tree();
-
 	/* Conf stuffs */
 	if (ac > 1 && av[1][0] == '-') {
 		switch (av[1][1]) {
@@ -1552,6 +1546,12 @@ int main(int ac, char *av[])
 	fixup_rootmenu(&rootmenu);
 	conf_read(NULL);
 
+	/* Load the interface and connect signals */
+	init_main_window(glade_file);
+	init_tree_model();
+	init_left_tree();
+	init_right_tree();
+
 	switch (view_mode) {
 	case SINGLE_VIEW:
 		display_tree_part();
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index ed93dd0..545e1af 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -702,7 +702,7 @@ static int do_exit(void)
 			char buf[1024];
 			snprintf(buf, 1024,
 				_("Configuration written to %s\n"
-				  "End of the configuration.\n":
+				  "End of the configuration.\n"
 				  "Execute 'make' to start the build or try"
 				  " 'make help'."), filename);
 			btn_dialog(
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 902086f..06dd2e3 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1274,7 +1274,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
-	snprintf(title, sizeof(title), "%s%s"),
+	snprintf(title, sizeof(title), "%s%s",
 		rootmenu.prompt->text,
 #if QT_VERSION < 0x040000
 		" (Qt3)"
-- 
1.7.2.30.gc37d7.dirty

