Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54572 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbbDHLnF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 07:43:05 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9304AAD31
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Apr 2015 11:43:03 +0000 (UTC)
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 2/2] kconfig: Do not print status messages in make -s mode
Date: Wed,  8 Apr 2015 13:42:56 +0200
Message-Id: <1428493376-20197-2-git-send-email-mmarek@suse.cz>
In-Reply-To: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
References: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Add an -s option to the conf, mconf, qconf and gconf frontends and pass
it when make -s is used. Also, use $(kecho) instead of @echo in the
Makefile.

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/Makefile | 38 +++++++++++++++++++++-----------------
 scripts/kconfig/conf.c   |  8 ++++++--
 scripts/kconfig/gconf.c  |  5 ++++-
 scripts/kconfig/mconf.c  | 29 +++++++++++++++++++----------
 scripts/kconfig/qconf.cc |  5 ++++-
 5 files changed, 54 insertions(+), 31 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 1f5e453..75e3aed 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -11,27 +11,31 @@ else
 Kconfig := Kconfig
 endif
 
+ifeq ($(quiet),silent_)
+silent := -s
+endif
+
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
 xconfig: $(obj)/qconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 gconfig: $(obj)/gconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 menuconfig: $(obj)/mconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 config: $(obj)/conf
-	$< --oldaskconfig $(Kconfig)
+	$< $(silent) --oldaskconfig $(Kconfig)
 
 nconfig: $(obj)/nconf
 	$< $(Kconfig)
 
 silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
-	$< --$@ $(Kconfig)
+	$< $(silent) --$@ $(Kconfig)
 
 localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
@@ -40,18 +44,18 @@ localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 			cmp -s .tmp.config .config ||			\
 			(mv -f .config .config.old.1;			\
 			 mv -f .tmp.config .config;			\
-			 $(obj)/conf --silentoldconfig $(Kconfig);	\
+			 $(obj)/conf $(silent) --silentoldconfig $(Kconfig); \
 			 mv -f .config.old.1 .config.old)		\
 	else								\
 			mv -f .tmp.config .config;			\
-			$(obj)/conf --silentoldconfig $(Kconfig);	\
+			$(obj)/conf $(silent) --silentoldconfig $(Kconfig); \
 	fi
 	$(Q)rm -f .tmp.config
 
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
-	$(Q)echo "  GEN     config.pot"
+	$(Q)$(kecho) "  GEN     config.pot"
 	$(Q)xgettext --default-domain=linux                         \
 	    --add-comments --keyword=_ --keyword=N_                 \
 	    --from-code=UTF-8                                       \
@@ -62,11 +66,11 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig      \
 	    $(srctree)/arch/*/um/Kconfig`;               \
 	    do                                           \
-		echo "  GEN     $$i";                    \
+		$(kecho) "  GEN     $$i";                    \
 		$(obj)/kxgettext $$i                     \
 		     >> $(obj)/config.pot;               \
 	    done )
-	$(Q)echo "  GEN     linux.pot"
+	$(Q)$(kecho) "  GEN     linux.pot"
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
 	$(Q)rm -f $(obj)/config.pot
@@ -77,7 +81,7 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
-	$< --$@ $(Kconfig)
+	$< $(silent) --$@ $(Kconfig)
 
 PHONY += oldnoconfig savedefconfig defconfig
 
@@ -87,18 +91,18 @@ PHONY += oldnoconfig savedefconfig defconfig
 oldnoconfig: olddefconfig
 
 savedefconfig: $(obj)/conf
-	$< --$@=defconfig $(Kconfig)
+	$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
-	$< --defconfig $(Kconfig)
+	$< $(silent) --defconfig $(Kconfig)
 else
-	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
-	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
+	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 endif
 
 %_defconfig: $(obj)/conf
-	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
+	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
 configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
 
@@ -215,7 +219,7 @@ $(obj)/.tmp_qtcheck: $(src)/Makefile
 
 # QT needs some extra effort...
 $(obj)/.tmp_qtcheck:
-	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
+	@set -e; $(kecho) "  CHECK   qt"; dir=""; pkg=""; \
 	if ! pkg-config --exists QtCore 2> /dev/null; then \
 	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
 	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fef75fc..6c20431 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -471,7 +471,7 @@ static struct option long_opts[] = {
 static void conf_usage(const char *progname)
 {
 
-	printf("Usage: %s [option] <kconfig-file>\n", progname);
+	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
 	printf("[option] is _one_ of the following:\n");
 	printf("  --listnewconfig         List new options\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
@@ -501,7 +501,11 @@ int main(int ac, char **av)
 
 	tty_stdio = isatty(0) && isatty(1) && isatty(2);
 
-	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
+	while ((opt = getopt_long(ac, av, "s", long_opts, NULL)) != -1) {
+		if (opt == 's') {
+			conf_set_message_callback(NULL);
+			continue;
+		}
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
 		case silentoldconfig:
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 344b9e3..26d208b 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1474,9 +1474,12 @@ int main(int ac, char *av[])
 		case 'a':
 			//showAll = 1;
 			break;
+		case 's':
+			conf_set_message_callback(NULL);
+			break;
 		case 'h':
 		case '?':
-			printf("%s <config>\n", av[0]);
+			printf("%s [-s] <config>\n", av[0]);
 			exit(0);
 		}
 		name = av[2];
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 4dd3755..01070f0 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -279,6 +279,7 @@ static int child_count;
 static int single_menu_mode;
 static int show_all_options;
 static int save_and_exit;
+static int silent;
 
 static void conf(struct menu *menu, struct menu *active_menu);
 static void conf_choice(struct menu *menu);
@@ -777,10 +778,12 @@ static void conf_message_callback(const char *fmt, va_list ap)
 	char buf[PATH_MAX+1];
 
 	vsnprintf(buf, sizeof(buf), fmt, ap);
-	if (save_and_exit)
-		printf("%s", buf);
-	else
+	if (save_and_exit) {
+		if (!silent)
+			printf("%s", buf);
+	} else {
 		show_textbox(NULL, buf, 6, 60);
+	}
 }
 
 static void show_help(struct menu *menu)
@@ -977,16 +980,18 @@ static int handle_exit(void)
 		}
 		/* fall through */
 	case -1:
-		printf(_("\n\n"
-			 "*** End of the configuration.\n"
-			 "*** Execute 'make' to start the build or try 'make help'."
-			 "\n\n"));
+		if (!silent)
+			printf(_("\n\n"
+				 "*** End of the configuration.\n"
+				 "*** Execute 'make' to start the build or try 'make help'."
+				 "\n\n"));
 		res = 0;
 		break;
 	default:
-		fprintf(stderr, _("\n\n"
-				  "Your configuration changes were NOT saved."
-				  "\n\n"));
+		if (!silent)
+			fprintf(stderr, _("\n\n"
+					  "Your configuration changes were NOT saved."
+					  "\n\n"));
 		if (res != KEY_ESC)
 			res = 0;
 	}
@@ -1010,6 +1015,10 @@ int main(int ac, char **av)
 
 	signal(SIGINT, sig_handler);
 
+	if (ac > 1 && strcmp(av[1], "-s") == 0) {
+		silent = 1;
+		av++;
+	}
 	conf_parse(av[1]);
 	conf_read(NULL);
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 9d3b04b..c3bb7fe 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1746,7 +1746,7 @@ static const char *progname;
 
 static void usage(void)
 {
-	printf(_("%s <config>\n"), progname);
+	printf(_("%s [-s] <config>\n"), progname);
 	exit(0);
 }
 
@@ -1762,6 +1762,9 @@ int main(int ac, char** av)
 	configApp = new QApplication(ac, av);
 	if (ac > 1 && av[1][0] == '-') {
 		switch (av[1][1]) {
+		case 's':
+			conf_set_message_callback(NULL);
+			break;
 		case 'h':
 		case '?':
 			usage();
-- 
2.1.4

