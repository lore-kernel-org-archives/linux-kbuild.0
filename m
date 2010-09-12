Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:60548 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894Ab0ILEQX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Sep 2010 00:16:23 -0400
Received: by gyd8 with SMTP id 8so1743713gyd.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 21:16:22 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [DIFF] kbuild-generic-v5 -> kbuild-generic-v6
Date: Sun, 12 Sep 2010 00:12:24 -0400
Message-Id: <1284264744-27530-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

Changes since branch `kbuild-generic-v5' are:
 - Randy's comments about typos and copy/paste mistake
 - fix in the autoconf.h header generation
 - extra strdup() removal
 - const updates

The updated series is available in the git repository at:

 git://github.com/lacombar/linux-2.6.git kbuild-generic-v6

Thanks,
 - Arnaud

---
 scripts/kconfig/confdata.c          |    4 ++--
 scripts/kconfig/lex.zconf.c_shipped |    2 +-
 scripts/kconfig/lkc.h               |    2 +-
 scripts/kconfig/mconf.c             |    2 +-
 scripts/kconfig/menu.c              |    2 +-
 scripts/kconfig/nconf.c             |    6 +++---
 scripts/kconfig/util.c              |    2 +-
 scripts/kconfig/zconf.l             |    2 +-
 scripts/kconfig/zconf.tab.c_shipped |    2 +-
 scripts/kconfig/zconf.y             |    2 +-
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index fbe571a..f7d89d7 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -807,11 +807,11 @@ int conf_write_autoconf(void)
 			  "\n");
 	fprintf(out_h, "/*\n"
 		       " * Automatically generated C config: don't edit\n"
-		       " * Linux kernel version: %s\n"
+		       " * %s\n"
 		       " * %s"
 		       " */\n"
 		       "#define AUTOCONF_INCLUDED\n",
-		       sym_get_string_value(sym), ctime(&now));
+		       rootmenu.prompt->text, ctime(&now));
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
diff --git a/scripts/kconfig/lex.zconf.c_shipped b/scripts/kconfig/lex.zconf.c_shipped
index 73608a6..6eb0397 100644
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -2423,7 +2423,7 @@ int zconf_lineno(void)
 	return current_pos.lineno;
 }
 
-char *zconf_curname(void)
+const char *zconf_curname(void)
 {
 	return current_pos.file ? current_pos.file->name : "<none>";
 }
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 5d5f187..753cdbd 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -76,7 +76,7 @@ FILE *zconf_fopen(const char *name);
 void zconf_initscan(const char *name);
 void zconf_nextfile(const char *name);
 int zconf_lineno(void);
-char *zconf_curname(void);
+const char *zconf_curname(void);
 
 /* conf.c */
 void xfgets(char *str, int size, FILE *in);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 09d7a23..d433c7a 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -25,7 +25,7 @@
 static const char mconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"This interface let you select features and parameters for the build\n"
+"This interface let you select features and parameters for the build.\n"
 "Features can either be built-in, modularized, or ignored. Parameters\n"
 "must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d629ffd..23acbdb 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -10,7 +10,7 @@
 #include "lkc.h"
 
 static const char nohelp_text[] = N_(
-	"There is no help available for this kernel option.\n");
+	"There is no help available for this option.\n");
 
 struct menu rootmenu;
 static struct menu **last_entry_ptr;
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index c7fe9f0..ed93dd0 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -15,7 +15,7 @@
 static const char nconf_readme[] = N_(
 "Overview\n"
 "--------\n"
-"This interface let you select features and parameters for the build\n"
+"This interface let you select features and parameters for the build.\n"
 "Features can either be built-in, modularized, or ignored. Parameters\n"
 "must be entered in as decimal or hexadecimal numbers or text.\n"
 "\n"
@@ -127,8 +127,8 @@ static const char nconf_readme[] = N_(
 "Optional personality available\n"
 "------------------------------\n"
 "If you prefer to have all of the options listed in a single menu, rather\n"
-"than the default multimenu hierarchy, run the menuconfig with\n"
-"NCONFIG_MODE environment variable set to single_menu. Example:\n"
+"than the default multimenu hierarchy, run the nconfig with NCONFIG_MODE\n"
+"environment variable set to single_menu. Example:\n"
 "\n"
 "make NCONFIG_MODE=single_menu nconfig\n"
 "\n"
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 584390d..6330cc8 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -16,7 +16,7 @@ struct file *file_lookup(const char *name)
 
 	for (file = file_list; file; file = file->next) {
 		if (!strcmp(name, file->name)) {
-			free(file_name);
+			free((void *)file_name);
 			return file;
 		}
 	}
diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index e0cbf8e..3dbaec1 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -354,7 +354,7 @@ int zconf_lineno(void)
 	return current_pos.lineno;
 }
 
-char *zconf_curname(void)
+const char *zconf_curname(void)
 {
 	return current_pos.file ? current_pos.file->name : "<none>";
 }
diff --git a/scripts/kconfig/zconf.tab.c_shipped b/scripts/kconfig/zconf.tab.c_shipped
index fd8e9d8..699d4b2 100644
--- a/scripts/kconfig/zconf.tab.c_shipped
+++ b/scripts/kconfig/zconf.tab.c_shipped
@@ -2255,7 +2255,7 @@ void conf_parse(const char *name)
 		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
 	}
 
-	rootmenu.prompt->text = strdup(_(rootmenu.prompt->text));
+	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
 
 	menu_finalize(&rootmenu);
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index c95e67e..2abd3c7 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -503,7 +503,7 @@ void conf_parse(const char *name)
 		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
 	}
 
-	rootmenu.prompt->text = strdup(_(rootmenu.prompt->text));
+	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
 
 	menu_finalize(&rootmenu);
-- 
1.7.2.30.gc37d7.dirty

