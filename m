Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:63279 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPx6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:53:58 -0400
Received: by yxp4 with SMTP id 4so1548933yxp.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:53:57 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 04/15] kconfig: rephrase help texts/comments not to include the package name
Date: Sat, 11 Sep 2010 11:51:11 -0400
Message-Id: <1284220282-3500-5-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/conf.c   |   11 +++++------
 scripts/kconfig/gconf.c  |    3 +--
 scripts/kconfig/mconf.c  |   38 ++++++++++++++++++--------------------
 scripts/kconfig/nconf.c  |   43 +++++++++++++++++++------------------------
 scripts/kconfig/qconf.cc |    2 +-
 5 files changed, 44 insertions(+), 53 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index b62d020..5459a38 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -508,8 +508,7 @@ int main(int ac, char **av)
 		name = conf_get_configname();
 		if (stat(name, &tmpstat)) {
 			fprintf(stderr, _("***\n"
-				"*** You have not yet configured your kernel!\n"
-				"*** (missing kernel config file \"%s\")\n"
+				"*** Configuration file \"%s\" not found!\n"
 				"***\n"
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
 				"*** \"make menuconfig\" or \"make xconfig\").\n"
@@ -571,7 +570,7 @@ int main(int ac, char **av)
 			name = getenv("KCONFIG_NOSILENTUPDATE");
 			if (name && *name) {
 				fprintf(stderr,
-					_("\n*** Kernel configuration requires explicit update.\n\n"));
+					_("\n*** The configuration requires explicit update.\n\n"));
 				return 1;
 			}
 		}
@@ -623,11 +622,11 @@ int main(int ac, char **av)
 		 * All other commands are only used to generate a config.
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));
 			exit(1);
 		}
 		if (conf_write_autoconf()) {
-			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during update of the configuration.\n\n"));
 			return 1;
 		}
 	} else if (input_mode == savedefconfig) {
@@ -638,7 +637,7 @@ int main(int ac, char **av)
 		}
 	} else if (input_mode != listnewconfig) {
 		if (conf_write(NULL)) {
-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
+			fprintf(stderr, _("\n*** Error during writing of the configuration.\n\n"));
 			exit(1);
 		}
 	}
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index d669882..1636213 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -671,8 +671,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *intro_text = _(
-	    "Welcome to gkc, the GTK+ graphical kernel configuration tool\n"
-	    "for Linux.\n"
+	    "Welcome to gkc, the GTK+ graphical configuration tool\n"
 	    "For each option, a blank box indicates the feature is disabled, a\n"
 	    "check indicates it is enabled, and a dot indicates that it is to\n"
 	    "be compiled as a module.  Clicking on the box will cycle through the three states.\n"
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 17ba222..037443b 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -25,11 +25,9 @@
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some kernel features may be built directly into the kernel.\n"
-"Some may be made into loadable runtime modules.  Some features\n"
-"may be completely removed altogether.  There are also certain\n"
-"kernel parameters which are not really features, but must be\n"
-"entered in as decimal or hexadecimal numbers or possibly text.\n"
+"This interface let you select features and parameters for the build\n"
+"Features can either be built-in, modularized, or ignored. Parameters\n"
+"must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
 "  [ ] can be built in or removed\n"
@@ -117,7 +115,7 @@ static const char mconf_readme[] = N_(
 "-----------------------------\n"
 "Menuconfig supports the use of alternate configuration files for\n"
 "those who, for various reasons, find it necessary to switch\n"
-"between different kernel configurations.\n"
+"between different configurations.\n"
 "\n"
 "At the end of the main menu you will find two options.  One is\n"
 "for saving the current configuration to a file of your choosing.\n"
@@ -150,9 +148,9 @@ static const char mconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the kernel options listed in a single\n"
-"menu, rather than the default multimenu hierarchy, run the menuconfig\n"
-"with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
+"If you prefer to have all of the options listed in a single menu, rather\n"
+"than the default multimenu hierarchy, run the menuconfig with\n"
+"MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
 "\n"
 "make MENUCONFIG_MODE=single_menu menuconfig\n"
 "\n"
@@ -207,12 +205,12 @@ load_config_text[] = N_(
 	"last retrieved.  Leave blank to abort."),
 load_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep several different kernel\n"
+	"For various reasons, one may wish to keep several different\n"
 	"configurations available on a single machine.\n"
 	"\n"
 	"If you have saved a previous configuration in a file other than the\n"
-	"kernel's default, entering the name of the file here will allow you\n"
-	"to modify that configuration.\n"
+	"default one, entering its name here will allow you to modify that\n"
+	"configuration.\n"
 	"\n"
 	"If you are uncertain, then you have probably never used alternate\n"
 	"configuration files. You should therefore leave this blank to abort.\n"),
@@ -221,8 +219,8 @@ save_config_text[] = N_(
 	"as an alternate.  Leave blank to abort."),
 save_config_help[] = N_(
 	"\n"
-	"For various reasons, one may wish to keep different kernel\n"
-	"configurations available on a single machine.\n"
+	"For various reasons, one may wish to keep different configurations\n"
+	"available on a single machine.\n"
 	"\n"
 	"Entering a file name here will allow you to later retrieve, modify\n"
 	"and use the current configuration as an alternate to whatever\n"
@@ -834,7 +832,7 @@ int main(int ac, char **av)
 		if (conf_get_changed())
 			res = dialog_yesno(NULL,
 					   _("Do you wish to save your "
-					     "new kernel configuration?\n"
+					     "new configuration?\n"
 					     "<ESC><ESC> to continue."),
 					   6, 60);
 		else
@@ -846,20 +844,20 @@ int main(int ac, char **av)
 	case 0:
 		if (conf_write(filename)) {
 			fprintf(stderr, _("\n\n"
-				"Error during writing of the kernel configuration.\n"
-				"Your kernel configuration changes were NOT saved."
+				"Error while writing of the configuration.\n"
+				"Your configuration changes were NOT saved."
 				"\n\n"));
 			return 1;
 		}
 	case -1:
 		printf(_("\n\n"
-			"*** End of Linux kernel configuration.\n"
-			"*** Execute 'make' to build the kernel or try 'make help'."
+			"*** End of the configuration.\n"
+			"*** Execute 'make' to start the build or try 'make help'."
 			"\n\n"));
 		break;
 	default:
 		fprintf(stderr, _("\n\n"
-			"Your kernel configuration changes were NOT saved."
+			"Your configuration changes were NOT saved."
 			"\n\n"));
 	}
 
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index da5e45d..6cc3a6e 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -15,11 +15,9 @@
 static const char nconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"Some kernel features may be built directly into the kernel.\n"
-"Some may be made into loadable runtime modules.  Some features\n"
-"may be completely removed altogether.  There are also certain\n"
-"kernel parameters which are not really features, but must be\n"
-"entered in as decimal or hexadecimal numbers or possibly text.\n"
+"This interface let you select features and parameters for the build\n"
+"Features can either be built-in, modularized, or ignored. Parameters\n"
+"must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
 "Menu items beginning with following braces represent features that\n"
 "  [ ] can be built in or removed\n"
@@ -95,7 +93,7 @@ static const char nconf_readme[] = N_(
 "-----------------------------\n"
 "nconfig supports the use of alternate configuration files for\n"
 "those who, for various reasons, find it necessary to switch\n"
-"between different kernel configurations.\n"
+"between different configurations.\n"
 "\n"
 "At the end of the main menu you will find two options.  One is\n"
 "for saving the current configuration to a file of your choosing.\n"
@@ -128,9 +126,9 @@ static const char nconf_readme[] = N_(
 "\n"
 "Optional personality available\n"
 "------------------------------\n"
-"If you prefer to have all of the kernel options listed in a single\n"
-"menu, rather than the default multimenu hierarchy, run the nconfig\n"
-"with NCONFIG_MODE environment variable set to single_menu. Example:\n"
+"If you prefer to have all of the options listed in a single menu, rather\n"
+"than the default multimenu hierarchy, run the menuconfig with\n"
+"NCONFIG_MODE environment variable set to single_menu. Example:\n"
 "\n"
 "make NCONFIG_MODE=single_menu nconfig\n"
 "\n"
@@ -185,19 +183,19 @@ setmod_text[] = N_(
 "has been configured as a module.\n"
 "As a result, this feature will be built as a module."),
 nohelp_text[] = N_(
-"There is no help available for this kernel option.\n"),
+"There is no help available for this option.\n"),
 load_config_text[] = N_(
 "Enter the name of the configuration file you wish to load.\n"
 "Accept the name shown to restore the configuration you\n"
 "last retrieved.  Leave blank to abort."),
 load_config_help[] = N_(
 "\n"
-"For various reasons, one may wish to keep several different kernel\n"
+"For various reasons, one may wish to keep several different\n"
 "configurations available on a single machine.\n"
 "\n"
 "If you have saved a previous configuration in a file other than the\n"
-"kernel's default, entering the name of the file here will allow you\n"
-"to modify that configuration.\n"
+"default one, entering its name here will allow you to modify that\n"
+"configuration.\n"
 "\n"
 "If you are uncertain, then you have probably never used alternate\n"
 "configuration files.  You should therefor leave this blank to abort.\n"),
@@ -206,8 +204,8 @@ save_config_text[] = N_(
 "as an alternate.  Leave blank to abort."),
 save_config_help[] = N_(
 "\n"
-"For various reasons, one may wish to keep different kernel\n"
-"configurations available on a single machine.\n"
+"For various reasons, one may wish to keep different configurations\n"
+"available on a single machine.\n"
 "\n"
 "Entering a file name here will allow you to later retrieve, modify\n"
 "and use the current configuration as an alternate to whatever\n"
@@ -681,8 +679,7 @@ static int do_exit(void)
 		return 0;
 	}
 	res = btn_dialog(main_window,
-			_("Do you wish to save your "
-				"new kernel configuration?\n"
+			_("Do you wish to save your new configuration?\n"
 				"<ESC> to cancel and resume nconfig."),
 			2,
 			"   <save>   ",
@@ -701,18 +698,16 @@ static int do_exit(void)
 		if (res)
 			btn_dialog(
 				main_window,
-				_("Error during writing of the kernel "
-				  "configuration.\n"
-				  "Your kernel configuration "
-				  "changes were NOT saved."),
+				_("Error during writing of configuration.\n"
+				  "Your configuration changes were NOT saved."),
 				  1,
 				  "<OK>");
 		else {
 			char buf[1024];
 			snprintf(buf, 1024,
 				_("Configuration written to %s\n"
-				  "End of Linux kernel configuration.\n"
-				  "Execute 'make' to build the kernel or try"
+				  "End of the configuration.\n":
+				  "Execute 'make' to start the build or try"
 				  " 'make help'."), filename);
 			btn_dialog(
 				main_window,
@@ -724,7 +719,7 @@ static int do_exit(void)
 	default:
 		btn_dialog(
 			main_window,
-			_("Your kernel configuration changes were NOT saved."),
+			_("Your configuration changes were NOT saved."),
 			1,
 			"<OK>");
 		break;
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a04e451..fe18f7e 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1655,7 +1655,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
+	static const QString str = _("Welcome to the qconf graphical configuration tool.\n\n"
 		"For each option, a blank box indicates the feature is disabled, a check\n"
 		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
 		"as a module.  Clicking on the box will cycle through the three states.\n\n"
-- 
1.7.2.30.gc37d7.dirty

