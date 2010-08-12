Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:52011 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752977Ab0HLRVR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Aug 2010 13:21:17 -0400
Received: by pwi4 with SMTP id 4so217828pwi.19
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Aug 2010 10:21:17 -0700 (PDT)
Date: Thu, 12 Aug 2010 11:21:22 -0600
From: Jean Sacren <sakiwit@gmail.com>
Subject: [PATCH 1/1] kconfig: fix warning: ignoring return value, declared
 with attribute warn_unused_result
Message-ID: <20100812172122.GA21339@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jiri Kosina <jkosina@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org

Hush up the unnecessary gcc warnings when fwrite() or fgets() are
called.

Signed-off-by: Jean Sacren <sakiwit@gmail.com>
Cc: stable <stable@kernel.org>
---
 scripts/kconfig/conf.c     |    6 ++++--
 scripts/kconfig/confdata.c |    8 +++++---
 scripts/kconfig/expr.c     |    3 ++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9960d1c..beaa533 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -77,6 +77,7 @@ static void check_stdin(void)
 
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
+	char *dummy;
 	enum symbol_type type = sym_get_type(sym);
 
 	if (!sym_has_value(sym))
@@ -102,7 +103,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		check_stdin();
 	case ask_all:
 		fflush(stdout);
-		fgets(line, 128, stdin);
+		dummy = fgets(line, 128, stdin);
 		return 1;
 	default:
 		break;
@@ -230,6 +231,7 @@ static int conf_choice(struct menu *menu)
 	struct menu *child;
 	int type;
 	bool is_new;
+	char *dummy;
 
 	sym = menu->sym;
 	type = sym_get_type(sym);
@@ -304,7 +306,7 @@ static int conf_choice(struct menu *menu)
 			check_stdin();
 		case ask_all:
 			fflush(stdout);
-			fgets(line, 128, stdin);
+			dummy = fgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c4dec80..52c6c3d 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -408,6 +408,7 @@ int conf_write(const char *name)
 	time_t now;
 	int use_timestamp = 1;
 	char *env;
+	size_t dummy;
 
 	dirname[0] = 0;
 	if (name && name[0]) {
@@ -505,7 +506,7 @@ int conf_write(const char *name)
 				while (1) {
 					l = strcspn(str, "\"\\");
 					if (l) {
-						fwrite(str, l, 1, out);
+						dummy = fwrite(str, l, 1, out);
 						str += l;
 					}
 					if (!*str)
@@ -680,6 +681,7 @@ int conf_write_autoconf(void)
 	FILE *out, *tristate, *out_h;
 	time_t now;
 	int i, l;
+	size_t dummy;
 
 	sym_clear_all_valid();
 
@@ -756,8 +758,8 @@ int conf_write_autoconf(void)
 			while (1) {
 				l = strcspn(str, "\"\\");
 				if (l) {
-					fwrite(str, l, 1, out);
-					fwrite(str, l, 1, out_h);
+					dummy = fwrite(str, l, 1, out);
+					dummy = fwrite(str, l, 1, out_h);
 					str += l;
 				}
 				if (!*str)
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index d83f232..99a058d 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1087,7 +1087,8 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
-	fwrite(str, strlen(str), 1, data);
+	size_t dummy;
+	dummy = fwrite(str, strlen(str), 1, data);
 }
 
 void expr_fprint(struct expr *e, FILE *out)
-- 
1.7.1
