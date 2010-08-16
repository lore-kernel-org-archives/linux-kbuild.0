Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:64883 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750797Ab0HPE7m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 00:59:42 -0400
Received: by gyg10 with SMTP id 10so1734776gyg.19
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Aug 2010 21:59:42 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [RFC 1/2] kbuild: genericizes package name
Date: Mon, 16 Aug 2010 00:54:16 -0400
Message-Id: <1281934457-4225-2-git-send-email-lacombar@gmail.com>
In-Reply-To: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

---
 scripts/kconfig/conf.c              |   12 ++++++------
 scripts/kconfig/confdata.c          |    8 ++++----
 scripts/kconfig/gconf.c             |    4 ++--
 scripts/kconfig/lkc.h               |    7 ++++++-
 scripts/kconfig/mconf.c             |   34 +++++++++++++++++-----------------
 scripts/kconfig/nconf.c             |   20 +++++++++-----------
 scripts/kconfig/qconf.cc            |    6 +++---
 scripts/kconfig/zconf.tab.c_shipped |    2 +-
 scripts/kconfig/zconf.y             |    2 +-
 9 files changed, 49 insertions(+), 46 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5b7c86e..8233d85 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -508,8 +508,8 @@ int main(int ac, char **av)
 		name = conf_get_configname();
 		if (stat(name, &tmpstat)) {
 			fprintf(stderr, _("***\n"
-				"*** You have not yet configured your kernel!\n"
-				"*** (missing kernel config file \"%s\")\n"
+				"*** Configuration file \"%s\" not found!\n"
+				"*** " PACKAGE_LONG " has not yet been configured.\n"
 				"***\n"
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
 				"*** \"make menuconfig\" or \"make xconfig\").\n"
@@ -571,7 +571,7 @@ int main(int ac, char **av)
 			name = getenv("KCONFIG_NOSILENTUPDATE");
 			if (name && *name) {
 				fprintf(stderr,
-					_("\n*** Kernel configuration requires explicit update.\n\n"));
+					_("\n*** " PACKAGE_LONG " configuration requires explicit update.\n\n"));
 				return 1;
 			}
 		}
@@ -623,11 +623,11 @@ int main(int ac, char **av)
 		 * All other commands are only used to generate a config.
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the " PACKAGE_LONG " configuration.\n\n"));
 			exit(1);
 		}
 		if (conf_write_autoconf()) {
-			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during update of the " PACKAGE_LONG " configuration.\n\n"));
 			return 1;
 		}
 	} else if (input_mode == savedefconfig) {
@@ -638,7 +638,7 @@ int main(int ac, char **av)
 		}
 	} else if (input_mode != listnewconfig) {
 		if (conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the " PACKAGE_LONG " configuration.\n\n"));
 			exit(1);
 		}
 	}
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c39327e..74327c3 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -579,7 +579,7 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	sym = sym_lookup("KERNELVERSION", 0);
+	sym = sym_lookup("PROJECTVERSION", 0);
 	sym_calc_value(sym);
 	time(&now);
 	env = getenv("KCONFIG_NOTIMESTAMP");
@@ -588,7 +588,7 @@ int conf_write(const char *name)
 
 	fprintf(out, _("#\n"
 		       "# Automatically generated make config: don't edit\n"
-		       "# Linux kernel version: %s\n"
+		       "# " PACKAGE_LONG " version: %s\n"
 		       "%s%s"
 		       "#\n"),
 		     sym_get_string_value(sym),
@@ -807,7 +807,7 @@ int conf_write_autoconf(void)
 	time(&now);
 	fprintf(out, "#\n"
 		     "# Automatically generated make config: don't edit\n"
-		     "# Linux kernel version: %s\n"
+		     "# " PACKAGE_LONG " version: %s\n"
 		     "# %s"
 		     "#\n",
 		     sym_get_string_value(sym), ctime(&now));
@@ -816,7 +816,7 @@ int conf_write_autoconf(void)
 			  "\n");
 	fprintf(out_h, "/*\n"
 		       " * Automatically generated C config: don't edit\n"
-		       " * Linux kernel version: %s\n"
+		       " * " PACKAGE_LONG " version: %s\n"
 		       " * %s"
 		       " */\n"
 		       "#define AUTOCONF_INCLUDED\n",
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index d669882..0f93dc6 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -210,8 +210,8 @@ void init_main_window(const gchar * glade_file)
 					  /*"style", PANGO_STYLE_OBLIQUE, */
 					  NULL);
 
-	sprintf(title, _("Linux Kernel v%s Configuration"),
-		getenv("KERNELVERSION"));
+	sprintf(title, _("%s v%s Configuration"),
+		PACKAGE_LONG, getenv("KERNELVERSION"));
 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
 
 	gtk_widget_show(main_wnd);
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bdf71bd..1fcd756 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -31,7 +31,12 @@ extern "C" {
 
 #define SRCTREE "srctree"
 
-#define PACKAGE "linux"
+#define PACKAGE			"linux"
+#define PACKAGE_LONG		"Linux Kernel"
+
+#define KBUILD_PREFIX		"CONFIG_"
+#define KBUILD_PREFIX_LEN	(sizeof(KBUILD_PREFIX) - 1)
+
 #define LOCALEDIR "/usr/share/locale"
 
 #define _(text) gettext(text)
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index d2f6e05..c2caf0c 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -25,10 +25,10 @@
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some kernel features may be built directly into the kernel.\n"
+"Some " PACKAGE_LONG " features may be built directly into it.\n"
 "Some may be made into loadable runtime modules.  Some features\n"
 "may be completely removed altogether.  There are also certain\n"
-"kernel parameters which are not really features, but must be\n"
+PACKAGE_LONG " parameters which are not really features, but must be\n"
 "entered in as decimal or hexadecimal numbers or possibly text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
@@ -117,7 +117,7 @@ static const char mconf_readme[] = N_(
 "-----------------------------\n"
 "Menuconfig supports the use of alternate configuration files for\n"
 "those who, for various reasons, find it necessary to switch\n"
-"between different kernel configurations.\n"
+"between different " PACKAGE_LONG " configurations.\n"
 "\n"
 "At the end of the main menu you will find two options.  One is\n"
 "for saving the current configuration to a file of your choosing.\n"
@@ -150,7 +150,7 @@ static const char mconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the kernel options listed in a single\n"
+"If you prefer to have all of the " PACKAGE_LONG " options listed in a single\n"
 "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
 "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
 "\n"
@@ -207,11 +207,11 @@ load_config_text[] = N_(
 	"last retrieved.  Leave blank to abort."),
 load_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep several different kernel\n"
+	"For various reasons, one may wish to keep several different " PACKAGE_LONG "\n"
 	"configurations available on a single machine.\n"
 	"\n"
 	"If you have saved a previous configuration in a file other than the\n"
-	"kernel's default, entering the name of the file here will allow you\n"
+	PACKAGE_LONG "'s default, entering the name of the file here will allow you\n"
 	"to modify that configuration.\n"
 	"\n"
 	"If you are uncertain, then you have probably never used alternate\n"
@@ -221,7 +221,7 @@ save_config_text[] = N_(
 	"as an alternate.  Leave blank to abort."),
 save_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep different kernel\n"
+	"For various reasons, one may wish to keep different " PACKAGE_LONG "\n"
 	"configurations available on a single machine.\n"
 	"\n"
 	"Entering a file name here will allow you to later retrieve, modify\n"
@@ -265,9 +265,9 @@ search_help[] = N_(
 	"Only relevant lines are shown.\n"
 	"\n\n"
 	"Search examples:\n"
-	"Examples: USB	=> find all CONFIG_ symbols containing USB\n"
-	"          ^USB => find all CONFIG_ symbols starting with USB\n"
-	"          USB$ => find all CONFIG_ symbols ending with USB\n"
+	"Examples: USB	=> find all " KBUILD_PREFIX " symbols containing USB\n"
+	"          ^USB => find all " KBUILD_PREFIX " symbols starting with USB\n"
+	"          USB$ => find all " KBUILD_PREFIX " symbols ending with USB\n"
 	"\n");
 
 static int indent;
@@ -292,10 +292,10 @@ static void set_config_filename(const char *config_filename)
 	int size;
 	struct symbol *sym;
 
-	sym = sym_lookup("KERNELVERSION", 0);
+	sym = sym_lookup("PROJECTVERSION", 0);
 	sym_calc_value(sym);
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-	                _("%s - Linux Kernel v%s Configuration"),
+	                _("%s - %s v%s Configuration"), PACKAGE_LONG,
 		        config_filename, sym_get_string_value(sym));
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
@@ -834,7 +834,7 @@ int main(int ac, char **av)
 		if (conf_get_changed())
 			res = dialog_yesno(NULL,
 					   _("Do you wish to save your "
-					     "new kernel configuration?\n"
+					     "new configuration?\n"
 					     "<ESC><ESC> to continue."),
 					   6, 60);
 		else
@@ -846,20 +846,20 @@ int main(int ac, char **av)
 	case 0:
 		if (conf_write(filename)) {
 			fprintf(stderr, _("\n\n"
-				"Error during writing of the kernel configuration.\n"
-				"Your kernel configuration changes were NOT saved."
+				"Error while writing of the configuration.\n"
+				"Your " PACKAGE_LONG " configuration changes were NOT saved."
 				"\n\n"));
 			return 1;
 		}
 	case -1:
 		printf(_("\n\n"
-			"*** End of Linux kernel configuration.\n"
+			"*** End of " PACKAGE_LONG " configuration.\n"
 			"*** Execute 'make' to build the kernel or try 'make help'."
 			"\n\n"));
 		break;
 	default:
 		fprintf(stderr, _("\n\n"
-			"Your kernel configuration changes were NOT saved."
+			"Your " PACKAGE_LONG " configuration changes were NOT saved."
 			"\n\n"));
 	}
 
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 2ba71bc..f5550a9 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -12,10 +12,10 @@
 static const char nconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some kernel features may be built directly into the kernel.\n"
+"Some " PACKAGE_LONG " features may be built directly in it.\n"
 "Some may be made into loadable runtime modules.  Some features\n"
 "may be completely removed altogether.  There are also certain\n"
-"kernel parameters which are not really features, but must be\n"
+PACKAGE_LONG " parameters which are not really features, but must be\n"
 "entered in as decimal or hexadecimal numbers or possibly text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
@@ -695,10 +695,10 @@ static const char *set_config_filename(const char *config_filename)
 	int size;
 	struct symbol *sym;
 
-	sym = sym_lookup("KERNELVERSION", 0);
+	sym = sym_lookup("PROJECTVERSION", 0);
 	sym_calc_value(sym);
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-			_("%s - Linux Kernel v%s Configuration"),
+			_("%s - %s v%s Configuration"), PACKAGE_LONG,
 			config_filename, sym_get_string_value(sym));
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
@@ -739,8 +739,7 @@ static int do_exit(void)
 		return 0;
 	}
 	res = btn_dialog(main_window,
-			_("Do you wish to save your "
-				"new kernel configuration?\n"
+			_("Do you wish to save your new configuration?\n"
 				"<ESC> to cancel and resume nconfig."),
 			2,
 			"   <save>   ",
@@ -759,9 +758,8 @@ static int do_exit(void)
 		if (res)
 			btn_dialog(
 				main_window,
-				_("Error during writing of the kernel "
-				  "configuration.\n"
-				  "Your kernel configuration "
+				_("Error during writing of configuration.\n"
+				  "Your " PACKAGE_LONG " configuration "
 				  "changes were NOT saved."),
 				  1,
 				  "<OK>");
@@ -769,7 +767,7 @@ static int do_exit(void)
 			char buf[1024];
 			snprintf(buf, 1024,
 				_("Configuration written to %s\n"
-				  "End of Linux kernel configuration.\n"
+				  "End of " PACKAGE_LONG " configuration.\n"
 				  "Execute 'make' to build the kernel or try"
 				  " 'make help'."), filename);
 			btn_dialog(
@@ -782,7 +780,7 @@ static int do_exit(void)
 	default:
 		btn_dialog(
 			main_window,
-			_("Your kernel configuration changes were NOT saved."),
+			_("Your " PACKAGE_LONG " configuration changes were NOT saved."),
 			1,
 			"<OK>");
 		break;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 820df2d..9bcf572 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1263,8 +1263,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
-	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
-		getenv("KERNELVERSION"));
+	snprintf(title, sizeof(title), _("%s v%s Configuration"),
+		PACKAGE_LONG, getenv("PROJECTVERSION"));
 	setCaption(title);
 
 	width = configSettings->readNumEntry("/window width", d->width() - 64);
@@ -1633,7 +1633,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
+	static const QString str = _("Welcome to the qconf graphical configuration tool for " PACKAGE_LONG ".\n\n"
 		"For each option, a blank box indicates the feature is disabled, a check\n"
 		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
 		"as a module.  Clicking on the box will cycle through the three states.\n\n"
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index 32a9eef..b8a7dad 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2224,7 +2224,7 @@ void conf_parse(const char *name)
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
+	rootmenu.prompt = menu_add_prompt(P_MENU, PACKAGE_LONG " Configuration", NULL);
 
 #if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 23dfd3b..9dc83e6 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -479,7 +479,7 @@ void conf_parse(const char *name)
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
+	rootmenu.prompt = menu_add_prompt(P_MENU, PACKAGE_LONG " Configuration", NULL);
 
 #if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
-- 
1.7.2.30.gc37d7.dirty

