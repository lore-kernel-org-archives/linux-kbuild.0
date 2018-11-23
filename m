Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55965 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390244AbeKWSk6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Nov 2018 13:40:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] modpost: move unresolved symbol checks to check_exports()
Date: Fri, 23 Nov 2018 16:57:23 +0900
Message-Id: <1542959843-16145-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This will fit better in check_exports() than add_versions().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 05e41eb..32e5026 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2085,15 +2085,27 @@ static void check_for_unused(enum export exp, const char *m, const char *s)
 	}
 }
 
-static void check_exports(struct module *mod)
+static int check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
+	int err = 0;
 
 	for (s = mod->unres; s; s = s->next) {
 		const char *basename;
 		exp = find_symbol(s->name);
-		if (!exp || exp->module == mod)
+		if (!exp || exp->module == mod) {
+			if (have_vmlinux && !s->weak) {
+				if (warn_unresolved) {
+					warn("\"%s\" [%s.ko] undefined!\n",
+					     s->name, mod->name);
+				} else {
+					merror("\"%s\" [%s.ko] undefined!\n",
+					       s->name, mod->name);
+					err = 1;
+				}
+			}
 			continue;
+		}
 		basename = strrchr(mod->name, '/');
 		if (basename)
 			basename++;
@@ -2103,6 +2115,8 @@ static void check_exports(struct module *mod)
 			check_for_gpl_usage(exp->export, basename, exp->name);
 		check_for_unused(exp->export, basename, exp->name);
 	}
+
+	return err;
 }
 
 static int check_modname_len(struct module *mod)
@@ -2180,19 +2194,8 @@ static int add_versions(struct buffer *b, struct module *mod)
 
 	for (s = mod->unres; s; s = s->next) {
 		exp = find_symbol(s->name);
-		if (!exp || exp->module == mod) {
-			if (have_vmlinux && !s->weak) {
-				if (warn_unresolved) {
-					warn("\"%s\" [%s.ko] undefined!\n",
-					     s->name, mod->name);
-				} else {
-					merror("\"%s\" [%s.ko] undefined!\n",
-					       s->name, mod->name);
-					err = 1;
-				}
-			}
+		if (!exp || exp->module == mod)
 			continue;
-		}
 		s->module = exp->module;
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
@@ -2495,7 +2498,7 @@ int main(int argc, char **argv)
 		buf.pos = 0;
 
 		err |= check_modname_len(mod);
-		check_exports(mod);
+		err |= check_exports(mod);
 		add_header(&buf, mod);
 		add_intree_flag(&buf, !external_module);
 		add_retpoline(&buf);
-- 
2.7.4
