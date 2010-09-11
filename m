Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48531 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:06 -0400
Received: by mail-gy0-f174.google.com with SMTP id 8so1615205gyd.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:06 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 09/15] kconfig: replace KERNELVERSION usage by the mainmenu's prompt
Date: Sat, 11 Sep 2010 11:51:16 -0400
Message-Id: <1284220282-3500-10-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/confdata.c |   12 ++++--------
 scripts/kconfig/gconf.c    |    5 +----
 scripts/kconfig/mconf.c    |    6 +-----
 scripts/kconfig/nconf.c    |    6 +-----
 scripts/kconfig/qconf.cc   |    4 ++--
 5 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9f3c889..fbe571a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -574,8 +574,6 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	sym = sym_lookup("KERNELVERSION", 0);
-	sym_calc_value(sym);
 	time(&now);
 	env = getenv("KCONFIG_NOTIMESTAMP");
 	if (env && *env)
@@ -583,10 +581,10 @@ int conf_write(const char *name)
 
 	fprintf(out, _("#\n"
 		       "# Automatically generated make config: don't edit\n"
-		       "# Linux kernel version: %s\n"
+		       "# %s\n"
 		       "%s%s"
 		       "#\n"),
-		     sym_get_string_value(sym),
+		     rootmenu.prompt->text,
 		     use_timestamp ? "# " : "",
 		     use_timestamp ? ctime(&now) : "");
 
@@ -797,15 +795,13 @@ int conf_write_autoconf(void)
 		return 1;
 	}
 
-	sym = sym_lookup("KERNELVERSION", 0);
-	sym_calc_value(sym);
 	time(&now);
 	fprintf(out, "#\n"
 		     "# Automatically generated make config: don't edit\n"
-		     "# Linux kernel version: %s\n"
+		     "# %s\n"
 		     "# %s"
 		     "#\n",
-		     sym_get_string_value(sym), ctime(&now));
+		     rootmenu.prompt->text, ctime(&now));
 	fprintf(tristate, "#\n"
 			  "# Automatically generated - do not edit\n"
 			  "\n");
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 1636213..7d48a51 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -133,7 +133,6 @@ void init_main_window(const gchar * glade_file)
 	GladeXML *xml;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
-	char title[256];
 	GtkStyle *style;
 
 	xml = glade_xml_new(glade_file, "window1", NULL);
@@ -210,9 +209,7 @@ void init_main_window(const gchar * glade_file)
 					  /*"style", PANGO_STYLE_OBLIQUE, */
 					  NULL);
 
-	sprintf(title, _("Linux Kernel v%s Configuration"),
-		getenv("KERNELVERSION"));
-	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
+	gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
 
 	gtk_widget_show(main_wnd);
 }
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 037443b..09d7a23 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -288,13 +288,9 @@ static void set_config_filename(const char *config_filename)
 {
 	static char menu_backtitle[PATH_MAX+128];
 	int size;
-	struct symbol *sym;
 
-	sym = sym_lookup("KERNELVERSION", 0);
-	sym_calc_value(sym);
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-	                _("%s - Linux Kernel v%s Configuration"),
-		        config_filename, sym_get_string_value(sym));
+	                "%s - %s", config_filename, rootmenu.prompt->text);
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
 	set_dialog_backtitle(menu_backtitle);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 6cc3a6e..c7fe9f0 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -633,13 +633,9 @@ static char menu_backtitle[PATH_MAX+128];
 static const char *set_config_filename(const char *config_filename)
 {
 	int size;
-	struct symbol *sym;
 
-	sym = sym_lookup("KERNELVERSION", 0);
-	sym_calc_value(sym);
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-			_("%s - Linux Kernel v%s Configuration"),
-			config_filename, sym_get_string_value(sym));
+			"%s - %s", config_filename, rootmenu.prompt->text);
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index fe18f7e..902086f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1274,8 +1274,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
-	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration%s"),
-		getenv("KERNELVERSION"),
+	snprintf(title, sizeof(title), "%s%s"),
+		rootmenu.prompt->text,
 #if QT_VERSION < 0x040000
 		" (Qt3)"
 #else
-- 
1.7.2.30.gc37d7.dirty

