Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:19692 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 22/29] modpost: remove mod->is_dot_o struct member
Date: Mon, 25 May 2020 00:42:28 +0900
Message-Id: <20200524154235.380482-23-masahiroy@kernel.org>
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Previously, there were two cases where mod->is_dot_o is unset:

[1] the executable 'vmlinux' in the second pass of modpost
[2] modules loaded by read_dump()

I think [1] was intended usage to distinguish 'vmlinux.o' and 'vmlinux'.
Now that modpost does not parse the executable 'vmlinux', this case
does not happen.

[2] is obscure, maybe a bug. Module.symver stores module paths without
extension. So, none of modules loaded by read_dump() has the .o suffix,
and new_module() unsets ->is_dot_o. Anyway, it is not a big deal because
handle_symbol() is not called for the case.

To sum up, all the parsed ELF files are .o files.

mod->is_dot_o is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 14 ++------------
 scripts/mod/modpost.h |  1 -
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 7a108bec933b..94404374262a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -181,10 +181,8 @@ static struct module *new_module(const char *modname)
 	p = NOFAIL(strdup(modname));
 
 	/* strip trailing .o */
-	if (strends(p, ".o")) {
+	if (strends(p, ".o"))
 		p[strlen(p) - 2] = '\0';
-		mod->is_dot_o = 1;
-	}
 
 	/* add to list */
 	mod->name = p;
@@ -712,8 +710,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 	enum export export;
 	const char *name;
 
-	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
-	    strstarts(symname, "__ksymtab"))
+	if (strstarts(symname, "__ksymtab"))
 		export = export_from_secname(info, get_secindex(info, sym));
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
@@ -2671,13 +2668,6 @@ int main(int argc, char **argv)
 		struct symbol *s;
 
 		for (s = symbolhash[n]; s; s = s->next) {
-			/*
-			 * Do not check "vmlinux". This avoids the same warnings
-			 * shown twice, and false-positives for ARCH=um.
-			 */
-			if (is_vmlinux(s->module->name) && !s->module->is_dot_o)
-				continue;
-
 			if (s->is_static)
 				warn("\"%s\" [%s] is a static %s\n",
 				     s->name, s->module->name,
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index aaf3c4ad5d60..554f02c69ac2 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -126,7 +126,6 @@ struct module {
 	int has_cleanup;
 	struct buffer dev_table_buf;
 	char	     srcversion[25];
-	int is_dot_o;
 	// Missing namespace dependencies
 	struct namespace_list *missing_namespaces;
 	// Actual imported namespaces
-- 
2.25.1
