Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40005 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 32/37] modpost: add mod->is_vmlinux struct member
Date: Mon,  1 Jun 2020 14:57:26 +0900
Message-Id: <20200601055731.3006266-32-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>

is_vmlinux() is called in several places to check whether the current
module is vmlinux or not.

It is faster and clearer to check mod->is_vmlinux flag.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 19 ++++++++++---------
 scripts/mod/modpost.h |  1 +
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 84a642c14775..167700a7b80f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -187,6 +187,7 @@ static struct module *new_module(const char *modname)
 
 	/* add to list */
 	mod->name = p;
+	mod->is_vmlinux = is_vmlinux(modname);
 	mod->gpl_compatible = -1;
 	mod->next = modules;
 	modules = mod;
@@ -431,11 +432,11 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
-	} else if (!external_module || is_vmlinux(s->module->name) ||
+	} else if (!external_module || s->module->is_vmlinux ||
 		   s->module == mod) {
 		warn("%s: '%s' exported twice. Previous export was in %s%s\n",
 		     mod->name, name, s->module->name,
-		     is_vmlinux(s->module->name) ? "" : ".ko");
+		     s->module->is_vmlinux ? "" : ".ko");
 		return s;
 	}
 
@@ -692,7 +693,7 @@ static void handle_modversion(const struct module *mod,
 
 	if (sym->st_shndx == SHN_UNDEF) {
 		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
-		     symname, mod->name, is_vmlinux(mod->name) ? "":".ko");
+		     symname, mod->name, mod->is_vmlinux ? "" : ".ko");
 		return;
 	}
 
@@ -2011,12 +2012,12 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	if (is_vmlinux(modname)) {
+	if (mod->is_vmlinux) {
 		have_vmlinux = 1;
 		mod->skip = 1;
 	}
 
-	if (!is_vmlinux(modname)) {
+	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
 			warn("missing MODULE_LICENSE() in %s\n", modname);
@@ -2075,7 +2076,7 @@ static void read_symbols(const char *modname)
 
 	check_sec_ref(mod, modname, &info);
 
-	if (!is_vmlinux(modname)) {
+	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
 		if (version || all_versions)
 			get_src_version(modname, mod->srcversion,
@@ -2345,7 +2346,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 	/* Clear ->seen flag of modules that own symbols needed by this. */
 	for (s = mod->unres; s; s = s->next)
 		if (s->module)
-			s->module->seen = is_vmlinux(s->module->name);
+			s->module->seen = s->module->is_vmlinux;
 
 	buf_printf(b, "\n");
 	buf_printf(b, "MODULE_INFO(depends, \"");
@@ -2470,9 +2471,9 @@ static void read_dump(const char *fname)
 			goto fail;
 		mod = find_module(modname);
 		if (!mod) {
-			if (is_vmlinux(modname))
-				have_vmlinux = 1;
 			mod = new_module(modname);
+			if (mod->is_vmlinux)
+				have_vmlinux = 1;
 			mod->skip = 1;
 			mod->from_dump = 1;
 		}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 554f02c69ac2..ec717ab20b98 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -120,6 +120,7 @@ struct module {
 	int gpl_compatible;
 	struct symbol *unres;
 	int from_dump;  /* 1 if module was loaded from *.symver */
+	int is_vmlinux;
 	int seen;
 	int skip;
 	int has_init;
-- 
2.25.1
