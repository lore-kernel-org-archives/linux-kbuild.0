Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39929 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752327AbeBFAiA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:38:00 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 01/14] kconfig: send error messages to stderr
Date: Tue,  6 Feb 2018 09:34:41 +0900
Message-Id: <1517877294-4826-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Marc Herbert <marc.herbert@intel.com>

These messages should be directed to stderr.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c  | 18 +++++++++++-------
 scripts/kconfig/zconf.l | 27 +++++++++++++++------------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 307bc3f..90a76aa2 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -75,9 +75,11 @@ static void strip(char *str)
 static void check_stdin(void)
 {
 	if (!valid_stdin) {
-		printf(_("aborted!\n\n"));
-		printf(_("Console input/output is redirected. "));
-		printf(_("Run 'make oldconfig' to update configuration.\n\n"));
+		fprintf(stderr,
+			_("Aborted!\n"
+			  "Console input/output is redirected.\n"
+			  "Run 'make oldconfig' to update configuration.\n\n")
+			);
 		exit(1);
 	}
 }
@@ -565,7 +567,7 @@ int main(int ac, char **av)
 		}
 	}
 	if (ac == optind) {
-		printf(_("%s: Kconfig file missing\n"), av[0]);
+		fprintf(stderr, _("%s: Kconfig file missing\n"), av[0]);
 		conf_usage(progname);
 		exit(1);
 	}
@@ -590,9 +592,11 @@ int main(int ac, char **av)
 		if (!defconfig_file)
 			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
-			printf(_("***\n"
-				"*** Can't find default configuration \"%s\"!\n"
-				"***\n"), defconfig_file);
+			fprintf(stderr,
+				_("***\n"
+				  "*** Can't find default configuration \"%s\"!\n"
+				  "***\n"),
+				defconfig_file);
 			exit(1);
 		}
 		break;
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 07e074d..0ba4900 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -184,7 +184,9 @@ n	[A-Za-z0-9_-]
 			append_string(yytext, 1);
 	}
 	\n	{
-		printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
+		fprintf(stderr,
+			"%s:%d:warning: multi-line strings not supported\n",
+			zconf_curname(), zconf_lineno());
 		current_file->lineno++;
 		BEGIN(INITIAL);
 		return T_EOL;
@@ -294,7 +296,7 @@ void zconf_initscan(const char *name)
 {
 	yyin = zconf_fopen(name);
 	if (!yyin) {
-		printf("can't find file %s\n", name);
+		fprintf(stderr, "can't find file %s\n", name);
 		exit(1);
 	}
 
@@ -315,8 +317,8 @@ void zconf_nextfile(const char *name)
 	current_buf->state = YY_CURRENT_BUFFER;
 	yyin = zconf_fopen(file->name);
 	if (!yyin) {
-		printf("%s:%d: can't open file \"%s\"\n",
-		    zconf_curname(), zconf_lineno(), file->name);
+		fprintf(stderr, "%s:%d: can't open file \"%s\"\n",
+			zconf_curname(), zconf_lineno(), file->name);
 		exit(1);
 	}
 	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
@@ -325,20 +327,21 @@ void zconf_nextfile(const char *name)
 
 	for (iter = current_file->parent; iter; iter = iter->parent ) {
 		if (!strcmp(current_file->name,iter->name) ) {
-			printf("%s:%d: recursive inclusion detected. "
-			       "Inclusion path:\n  current file : '%s'\n",
-			       zconf_curname(), zconf_lineno(),
-			       zconf_curname());
+			fprintf(stderr,
+				"%s:%d: recursive inclusion detected. "
+				"Inclusion path:\n  current file : '%s'\n",
+				zconf_curname(), zconf_lineno(),
+				zconf_curname());
 			iter = current_file->parent;
 			while (iter && \
 			       strcmp(iter->name,current_file->name)) {
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno-1);
+				fprintf(stderr, "  included from: '%s:%d'\n",
+					iter->name, iter->lineno-1);
 				iter = iter->parent;
 			}
 			if (iter)
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno+1);
+				fprintf(stderr, "  included from: '%s:%d'\n",
+					iter->name, iter->lineno+1);
 			exit(1);
 		}
 	}
-- 
2.7.4

