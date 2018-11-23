Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55963 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbeKWSk6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Nov 2018 13:40:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] modpost: refactor seen flag clearing in add_depends()
Date: Fri, 23 Nov 2018 16:57:21 +0900
Message-Id: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

You do not need to iterate over all modules for resetting ->seen flag
because add_depends() is only interested in modules that export symbols
referenced from the given 'mod'.

This also avoids shadowing the 'modules' parameter of add_depends().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index c64066d..39432c2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2229,15 +2229,15 @@ static int add_versions(struct buffer *b, struct module *mod)
 	return err;
 }
 
-static void add_depends(struct buffer *b, struct module *mod,
-			struct module *modules)
+static void add_depends(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
-	struct module *m;
 	int first = 1;
 
-	for (m = modules; m; m = m->next)
-		m->seen = is_vmlinux(m->name);
+	/* Clear ->seen flag of modules that own symbols needed by this. */
+	for (s = mod->unres; s; s = s->next)
+		if (s->module)
+			s->module->seen = is_vmlinux(s->module->name);
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const char __module_depends[]\n");
@@ -2506,7 +2506,7 @@ int main(int argc, char **argv)
 		add_retpoline(&buf);
 		add_staging_flag(&buf, mod->name);
 		err |= add_versions(&buf, mod);
-		add_depends(&buf, mod, modules);
+		add_depends(&buf, mod);
 		add_moddevtable(&buf, mod);
 		add_srcversion(&buf, mod);
 
-- 
2.7.4
