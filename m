Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45640 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbeLHU0r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Dec 2018 15:26:47 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so5341840lfa.12
        for <linux-kbuild@vger.kernel.org>; Sat, 08 Dec 2018 12:26:45 -0800 (PST)
Received: from turska (dtb2smtyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:806c:f540::1])
        by smtp.gmail.com with ESMTPSA id g17sm1349472lfj.36.2018.12.08.12.26.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Dec 2018 12:26:42 -0800 (PST)
Date: Sat, 8 Dec 2018 22:26:40 +0200
From: Tomi Salminen <tlsalmin@gmail.com>
Subject: [PATCH 001/123] kconfig/conf.c: Added optional colorization of
 output.
Message-ID: <20181208202640.GA28712@turska>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

From: Tomi Salminen <tlsalmin@gmail.com>

Added option COLORIZE=1 for oldconfig, coloring the tristate options to
yes=green, no=red, module=blue and boolean variables to true=green,
false=red.

Signed-off-by: Tomi Salminen <tlsalmin@gmail.com>
---
 scripts/kconfig/Makefile |  9 +++++++-
 scripts/kconfig/conf.c   | 45 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 63b609243d03..22cc1257f8a4 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -56,6 +56,11 @@ localyesconfig localmodconfig: $(obj)/conf
 	fi
 	$(Q)rm -f .tmp.config
 
+
+MAYBECOLORIZE=
+ifeq ($(COLORIZE),1)
+  MAYBECOLORIZE="-c"
+endif
 # These targets map 1:1 to the commandline options of 'conf'
 #
 # Note:
@@ -66,7 +71,7 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
-	$< $(silent) --$@ $(Kconfig)
+	$< $(silent) $(MAYBECOLORIZE) --$@ $(Kconfig)
 
 PHONY += savedefconfig defconfig
 
@@ -140,6 +145,8 @@ help:
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  'Options for targets:'
+	@echo  '  COLORIZE=1	  - Colorize option output (no=red, green=yes, blue=mod)'
 
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 98e0c7a34699..6253a473292b 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -42,6 +42,7 @@ static int sync_kconfig;
 static int conf_cnt;
 static char line[PATH_MAX];
 static struct menu *rootEntry;
+static int colorize; // Colorizes output lines according to option default.
 
 static void print_help(struct menu *menu)
 {
@@ -53,6 +54,40 @@ static void print_help(struct menu *menu)
 	str_free(&help);
 }
 
+static void colorize_reset(void)
+{
+	if (colorize) {
+		const char *reset = "\x1B[37m";
+
+		printf("%s", reset);
+	}
+}
+
+static void colorize_line(struct symbol *sym)
+{
+	if (colorize) {
+		enum symbol_type type = sym_get_type(sym);
+		const char *red = "\x1B[31m", *green = "\x1B[32m", *blue =
+		    "\x1B[34m";
+
+		if (type == S_BOOLEAN || type == S_TRISTATE) {
+			switch (sym_get_tristate_value(sym)) {
+				{
+			case no:
+					printf("%s", red);
+					break;
+			case yes:
+					printf("%s", green);
+					break;
+			case mod:
+					printf("%s", blue);
+					break;
+				}
+			}
+		}
+	}
+}
+
 static void strip(char *str)
 {
 	char *p = str;
@@ -166,6 +201,7 @@ static int conf_sym(struct menu *menu)
 
 	while (1) {
 		printf("%*s%s ", indent - 1, "", menu->prompt->text);
+		colorize_line(sym);
 		if (sym->name)
 			printf("(%s) ", sym->name);
 		putchar('[');
@@ -188,6 +224,7 @@ static int conf_sym(struct menu *menu)
 		if (oldval != yes && sym_tristate_within_range(sym, yes))
 			printf("/y");
 		printf("/?] ");
+		colorize_reset();
 		if (!conf_askvalue(sym, sym_get_string_value(sym)))
 			return 0;
 		strip(line);
@@ -466,7 +503,7 @@ static struct option long_opts[] = {
 static void conf_usage(const char *progname)
 {
 
-	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
+	printf("Usage: %s [-s] [-c] [option] <kconfig-file>\n", progname);
 	printf("[option] is _one_ of the following:\n");
 	printf("  --listnewconfig         List new options\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
@@ -481,6 +518,8 @@ static void conf_usage(const char *progname)
 	printf("  --allmodconfig          New config where all options are answered with mod\n");
 	printf("  --alldefconfig          New config with all symbols set to default\n");
 	printf("  --randconfig            New config with random answer to all options\n");
+	printf("Modifiers:\n");
+	printf("  -c                      Output colorized lines for default option.\n");
 }
 
 int main(int ac, char **av)
@@ -493,10 +532,12 @@ int main(int ac, char **av)
 
 	tty_stdio = isatty(0) && isatty(1);
 
-	while ((opt = getopt_long(ac, av, "s", long_opts, NULL)) != -1) {
+	while ((opt = getopt_long(ac, av, "sc", long_opts, NULL)) != -1) {
 		if (opt == 's') {
 			conf_set_message_callback(NULL);
 			continue;
+		} else if (opt == 'c') {
+			colorize = 1;
 		}
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
-- 
2.19.2
