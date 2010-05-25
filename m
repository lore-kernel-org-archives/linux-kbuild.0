Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:54931 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757254Ab0EYAvJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 24 May 2010 20:51:09 -0400
From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 190/190] kbuild: fix unused return value from fgets()
Date: Tue, 25 May 2010 01:51:01 +0100
Message-Id: <1274748661-15253-4-git-send-email-ben-linux@fluff.org>
In-Reply-To: <1274748661-15253-1-git-send-email-ben-linux@fluff.org>
References: <1274748661-15253-1-git-send-email-ben-linux@fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

fgets() returns a pointer to the string on success, or NULL otherwise
but the current configuration code ignores this, producing the following
warning on some systems:

scripts/kconfig/conf.c: In function ‘conf_askvalue’:
scripts/kconfig/conf.c:105: warning: ignoring return value of ‘fgets’, declared with attribute warn_unused_result
scripts/kconfig/conf.c: In function ‘conf_choice’:
cripts/kconfig/conf.c:307: warning: ignoring return value of ‘fgets’, declared with attribute warn_unused_result

Use the result to ensure that on error, the linebuffer is terminated
at the first entry.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 scripts/kconfig/conf.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9960d1c..83c5e24 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -78,6 +78,7 @@ static void check_stdin(void)
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
+	char *r;
 
 	if (!sym_has_value(sym))
 		printf(_("(NEW) "));
@@ -102,7 +103,9 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		check_stdin();
 	case ask_all:
 		fflush(stdout);
-		fgets(line, 128, stdin);
+		r = fgets(line, 128, stdin);
+		if (!r)
+			line[0] = '\0';
 		return 1;
 	default:
 		break;
@@ -259,6 +262,7 @@ static int conf_choice(struct menu *menu)
 
 	while (1) {
 		int cnt, def;
+		char *r;
 
 		printf("%*s%s\n", indent - 1, "", _(menu_get_prompt(menu)));
 		def_sym = sym_get_choice_value(sym);
@@ -304,7 +308,9 @@ static int conf_choice(struct menu *menu)
 			check_stdin();
 		case ask_all:
 			fflush(stdout);
-			fgets(line, 128, stdin);
+			r = fgets(line, 128, stdin);
+			if (!r)
+				line[0] = '\0';
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
-- 
1.6.3.3

