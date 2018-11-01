Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f174.google.com ([209.85.160.174]:42906 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbeKAMbt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Nov 2018 08:31:49 -0400
From: Leonardo Bras <leobras.c@gmail.com>
Subject: [PATCH 1/1] modpost: Refactor and removes global variable *modules
Date: Thu,  1 Nov 2018 00:30:38 -0300
Message-Id: <20181101033038.24142-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Refactors the code to accept the modules list as a parameter in
the functions that need it, and moves the variable from the
global scope to the main function scope.

This also fixes the parameter shadowing of add_depends.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 scripts/mod/modpost.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0d998c54564d..bebe65ed957a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -118,10 +118,7 @@ void *do_nofail(void *ptr, const char *expr)
 	return ptr;
 }
 
-/* A list of all modules we processed */
-static struct module *modules;
-
-static struct module *find_module(const char *modname)
+static struct module *find_module(const char *modname, struct module *modules)
 {
 	struct module *mod;
 
@@ -131,7 +128,7 @@ static struct module *find_module(const char *modname)
 	return mod;
 }
 
-static struct module *new_module(const char *modname)
+static struct module *new_module(const char *modname, struct module **pmodules)
 {
 	struct module *mod;
 	char *p;
@@ -149,8 +146,8 @@ static struct module *new_module(const char *modname)
 	/* add to list */
 	mod->name = p;
 	mod->gpl_compatible = -1;
-	mod->next = modules;
-	modules = mod;
+	mod->next = *pmodules;
+	*pmodules = mod;
 
 	return mod;
 }
@@ -1929,7 +1926,7 @@ static char *remove_dot(char *s)
 	return s;
 }
 
-static void read_symbols(const char *modname)
+static void read_symbols(const char *modname, struct module **pmodules)
 {
 	const char *symname;
 	char *version;
@@ -1941,7 +1938,7 @@ static void read_symbols(const char *modname)
 	if (!parse_elf(&info, modname))
 		return;
 
-	mod = new_module(modname);
+	mod = new_module(modname, pmodules);
 
 	/* When there's no vmlinux, don't print warnings about
 	 * unresolved symbols (since there'll be too many ;) */
@@ -1992,7 +1989,8 @@ static void read_symbols(const char *modname)
 		mod->unres = alloc_symbol("module_layout", 0, mod->unres);
 }
 
-static void read_symbols_from_files(const char *filename)
+static void read_symbols_from_files(const char *filename,
+				    struct module **pmodules)
 {
 	FILE *in = stdin;
 	char fname[PATH_MAX];
@@ -2006,7 +2004,7 @@ static void read_symbols_from_files(const char *filename)
 	while (fgets(fname, PATH_MAX, in) != NULL) {
 		if (strends(fname, "\n"))
 			fname[strlen(fname)-1] = '\0';
-		read_symbols(fname);
+		read_symbols(fname, pmodules);
 	}
 
 	if (in != stdin)
@@ -2318,7 +2316,8 @@ static void write_if_changed(struct buffer *b, const char *fname)
 /* parse Module.symvers file. line format:
  * 0x12345678<tab>symbol<tab>module[[<tab>export]<tab>something]
  **/
-static void read_dump(const char *fname, unsigned int kernel)
+static void read_dump(const char *fname, unsigned int kernel,
+		      struct module **pmodules)
 {
 	unsigned long size, pos = 0;
 	void *file = grab_file(fname, &size);
@@ -2347,11 +2346,11 @@ static void read_dump(const char *fname, unsigned int kernel)
 		crc = strtoul(line, &d, 16);
 		if (*symname == '\0' || *modname == '\0' || *d != '\0')
 			goto fail;
-		mod = find_module(modname);
+		mod = find_module(modname, *pmodules);
 		if (!mod) {
 			if (is_vmlinux(modname))
 				have_vmlinux = 1;
-			mod = new_module(modname);
+			mod = new_module(modname, pmodules);
 			mod->skip = 1;
 		}
 		s = sym_add_exported(symname, mod, export_no(export));
@@ -2415,6 +2414,8 @@ int main(int argc, char **argv)
 	int err;
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
+	/* A list of all modules we processed */
+	static struct module *modules;
 
 	while ((opt = getopt(argc, argv, "i:I:e:mnsST:o:awM:K:E")) != -1) {
 		switch (opt) {
@@ -2466,21 +2467,21 @@ int main(int argc, char **argv)
 	}
 
 	if (kernel_read)
-		read_dump(kernel_read, 1);
+		read_dump(kernel_read, 1, &modules);
 	if (module_read)
-		read_dump(module_read, 0);
+		read_dump(module_read, 0, &modules);
 	while (extsym_start) {
-		read_dump(extsym_start->file, 0);
+		read_dump(extsym_start->file, 0, &modules);
 		extsym_iter = extsym_start->next;
 		free(extsym_start);
 		extsym_start = extsym_iter;
 	}
 
 	while (optind < argc)
-		read_symbols(argv[optind++]);
+		read_symbols(argv[optind++], &modules);
 
 	if (files_source)
-		read_symbols_from_files(files_source);
+		read_symbols_from_files(files_source, &modules);
 
 	for (mod = modules; mod; mod = mod->next) {
 		if (mod->skip)
-- 
2.19.1
