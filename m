Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42857 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758981AbYAXWDy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:54 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 2C5CEE31C6E
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:50 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 42/77] kbuild: clean up modpost.c
Date: Thu, 24 Jan 2008 23:03:23 +0100
Message-Id: <1201212238-4369-42-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

akpm complained about overly long lines in modpost.c and
when started additional style issues were fixed:

o Updated my copyright
o Removed unneeded {}
o Drop assignments in if ()
o Spaces around operators
o Break long lines
o locate * near variable not type
o Fix a format specifier for sizeof()
o Corrected placement of '{' and '}'
o spaces to tabs (but use tabs only for indention)

modpost.c is not checkpatch clean. Readability were favoured
on top of checkpatch compliance.
But checkpatch were used to find additional stuff to clean up.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |  197 +++++++++++++++++++++++++------------------------
 1 files changed, 101 insertions(+), 96 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4d1c590..696d2a5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2,7 +2,7 @@
  *
  * Copyright 2003       Kai Germaschewski
  * Copyright 2002-2004  Rusty Russell, IBM Corporation
- * Copyright 2006       Sam Ravnborg
+ * Copyright 2006-2008  Sam Ravnborg
  * Based in part on module-init-tools/depmod.c,file2alias
  *
  * This software may be used and distributed according to the terms
@@ -74,7 +74,8 @@ static int is_vmlinux(const char *modname)
 {
 	const char *myname;
 
-	if ((myname = strrchr(modname, '/')))
+	myname = strrchr(modname, '/');
+	if (myname)
 		myname++;
 	else
 		myname = modname;
@@ -85,14 +86,13 @@ static int is_vmlinux(const char *modname)
 
 void *do_nofail(void *ptr, const char *expr)
 {
-	if (!ptr) {
+	if (!ptr)
 		fatal("modpost: Memory allocation failure: %s.\n", expr);
-	}
+
 	return ptr;
 }
 
 /* A list of all modules we processed */
-
 static struct module *modules;
 
 static struct module *find_module(char *modname)
@@ -115,7 +115,8 @@ static struct module *new_module(char *modname)
 	p = NOFAIL(strdup(modname));
 
 	/* strip trailing .o */
-	if ((s = strrchr(p, '.')) != NULL)
+	s = strrchr(p, '.');
+	if (s != NULL)
 		if (strcmp(s, ".o") == 0)
 			*s = '\0';
 
@@ -156,7 +157,7 @@ static inline unsigned int tdb_hash(const char *name)
 	unsigned   i;	/* Used to cycle through random values. */
 
 	/* Set the initial value from the key size. */
-	for (value = 0x238F13AF * strlen(name), i=0; name[i]; i++)
+	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
 		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
 
 	return (1103515243 * value + 12345);
@@ -200,7 +201,7 @@ static struct symbol *find_symbol(const char *name)
 	if (name[0] == '.')
 		name++;
 
-	for (s = symbolhash[tdb_hash(name) % SYMBOL_HASH_SIZE]; s; s=s->next) {
+	for (s = symbolhash[tdb_hash(name) % SYMBOL_HASH_SIZE]; s; s = s->next) {
 		if (strcmp(s->name, name) == 0)
 			return s;
 	}
@@ -225,9 +226,10 @@ static const char *export_str(enum export ex)
 	return export_list[ex].str;
 }
 
-static enum export export_no(const char * s)
+static enum export export_no(const char *s)
 {
 	int i;
+
 	if (!s)
 		return export_unknown;
 	for (i = 0; export_list[i].export != export_unknown; i++) {
@@ -317,7 +319,7 @@ void *grab_file(const char *filename, unsigned long *size)
   * spaces in the beginning of the line is trimmed away.
   * Return a pointer to a static buffer.
   **/
-char* get_next_line(unsigned long *pos, void *file, unsigned long size)
+char *get_next_line(unsigned long *pos, void *file, unsigned long size)
 {
 	static char line[4096];
 	int skip = 1;
@@ -325,8 +327,7 @@ char* get_next_line(unsigned long *pos, void *file, unsigned long size)
 	signed char *p = (signed char *)file + *pos;
 	char *s = line;
 
-	for (; *pos < size ; (*pos)++)
-	{
+	for (; *pos < size ; (*pos)++) {
 		if (skip && isspace(*p)) {
 			p++;
 			continue;
@@ -388,7 +389,9 @@ static int parse_elf(struct elf_info *info, const char *filename)
 
 	/* Check if file offset is correct */
 	if (hdr->e_shoff > info->size) {
-		fatal("section header offset=%lu in file '%s' is bigger then filesize=%lu\n", (unsigned long)hdr->e_shoff, filename, info->size);
+		fatal("section header offset=%lu in file '%s' is bigger than "
+		      "filesize=%lu\n", (unsigned long)hdr->e_shoff,
+		      filename, info->size);
 		return 0;
 	}
 
@@ -409,7 +412,10 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		const char *secname;
 
 		if (sechdrs[i].sh_offset > info->size) {
-			fatal("%s is truncated. sechdrs[i].sh_offset=%lu > sizeof(*hrd)=%lu\n", filename, (unsigned long)sechdrs[i].sh_offset, sizeof(*hdr));
+			fatal("%s is truncated. sechdrs[i].sh_offset=%lu > "
+			      "sizeof(*hrd)=%zu\n", filename,
+			      (unsigned long)sechdrs[i].sh_offset,
+			      sizeof(*hdr));
 			return 0;
 		}
 		secname = secstrings + sechdrs[i].sh_name;
@@ -436,9 +442,9 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		info->strtab       = (void *)hdr +
 			             sechdrs[sechdrs[i].sh_link].sh_offset;
 	}
-	if (!info->symtab_start) {
+	if (!info->symtab_start)
 		fatal("%s has no symtab?\n", filename);
-	}
+
 	/* Fix endianness in symbols */
 	for (sym = info->symtab_start; sym < info->symtab_stop; sym++) {
 		sym->st_shndx = TO_NATIVE(sym->st_shndx);
@@ -507,11 +513,13 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 #endif
 
 		if (memcmp(symname, MODULE_SYMBOL_PREFIX,
-			   strlen(MODULE_SYMBOL_PREFIX)) == 0)
-			mod->unres = alloc_symbol(symname +
-						  strlen(MODULE_SYMBOL_PREFIX),
-						  ELF_ST_BIND(sym->st_info) == STB_WEAK,
-						  mod->unres);
+			   strlen(MODULE_SYMBOL_PREFIX)) == 0) {
+			mod->unres =
+			  alloc_symbol(symname +
+			               strlen(MODULE_SYMBOL_PREFIX),
+			               ELF_ST_BIND(sym->st_info) == STB_WEAK,
+			               mod->unres);
+		}
 		break;
 	default:
 		/* All exported symbols */
@@ -580,21 +588,21 @@ static char *get_modinfo(void *modinfo, unsigned long modinfo_len,
  **/
 static int strrcmp(const char *s, const char *sub)
 {
-        int slen, sublen;
+	int slen, sublen;
 
 	if (!s || !sub)
 		return 1;
 
 	slen = strlen(s);
-        sublen = strlen(sub);
+	sublen = strlen(sub);
 
 	if ((slen == 0) || (sublen == 0))
 		return 1;
 
-        if (sublen > slen)
-                return 1;
+	if (sublen > slen)
+		return 1;
 
-        return memcmp(s + slen - sublen, sub, sublen);
+	return memcmp(s + slen - sublen, sub, sublen);
 }
 
 /*
@@ -671,7 +679,8 @@ static int data_section(const char *name)
  *   the pattern is identified by:
  *   tosec   = init or exit section
  *   fromsec = data section
- *   atsym = *driver, *_template, *_sht, *_ops, *_probe, *probe_one, *_console, *_timer
+ *   atsym = *driver, *_template, *_sht, *_ops, *_probe,
+ *           *probe_one, *_console, *_timer
  *
  * Pattern 3:
  *   Whitelist all refereces from .text.head to .init.data
@@ -731,15 +740,16 @@ static int secref_whitelist(const char *modname, const char *tosec,
 		return 1;
 
 	/* Check for pattern 2 */
-	if ((init_section(tosec) || exit_section(tosec)) && data_section(fromsec))
+	if ((init_section(tosec) || exit_section(tosec))
+	    && data_section(fromsec))
 		for (s = pat2sym; *s; s++)
 			if (strrcmp(atsym, *s) == 0)
 				return 1;
 
 	/* Check for pattern 3 */
 	if ((strcmp(fromsec, ".text.head") == 0) &&
-		((strcmp(tosec, ".init.data") == 0) ||
-		(strcmp(tosec, ".init.text") == 0)))
+	    ((strcmp(tosec, ".init.data") == 0) ||
+	    (strcmp(tosec, ".init.text") == 0)))
 	return 1;
 
 	/* Check for pattern 4 */
@@ -816,7 +826,7 @@ static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
  **/
 static void find_symbols_between(struct elf_info *elf, Elf_Addr addr,
 				 const char *sec,
-			         Elf_Sym **before, Elf_Sym **after)
+				 Elf_Sym **before, Elf_Sym **after)
 {
 	Elf_Sym *sym;
 	Elf_Ehdr *hdr = elf->hdr;
@@ -842,20 +852,15 @@ static void find_symbols_between(struct elf_info *elf, Elf_Addr addr,
 			if ((addr - sym->st_value) < beforediff) {
 				beforediff = addr - sym->st_value;
 				*before = sym;
-			}
-			else if ((addr - sym->st_value) == beforediff) {
+			} else if ((addr - sym->st_value) == beforediff) {
 				*before = sym;
 			}
-		}
-		else
-		{
+		} else {
 			if ((sym->st_value - addr) < afterdiff) {
 				afterdiff = sym->st_value - addr;
 				*after = sym;
-			}
-			else if ((sym->st_value - addr) == afterdiff) {
+			} else if ((sym->st_value - addr) == afterdiff)
 				*after = sym;
-			}
 		}
 	}
 }
@@ -952,12 +957,14 @@ static int addend_arm_rel(struct elf_info *elf, int rsection, Elf_Rela *r)
 	switch (r_typ) {
 	case R_ARM_ABS32:
 		/* From ARM ABI: (S + A) | T */
-		r->r_addend = (int)(long)(elf->symtab_start + ELF_R_SYM(r->r_info));
+		r->r_addend = (int)(long)
+		              (elf->symtab_start + ELF_R_SYM(r->r_info));
 		break;
 	case R_ARM_PC24:
 		/* From ARM ABI: ((S + A) | T) - P */
-		r->r_addend = (int)(long)(elf->hdr + elf->sechdrs[rsection].sh_offset +
-		                          (r->r_offset - elf->sechdrs[rsection].sh_addr));
+		r->r_addend = (int)(long)(elf->hdr +
+		              elf->sechdrs[rsection].sh_offset +
+		              (r->r_offset - elf->sechdrs[rsection].sh_addr));
 		break;
 	default:
 		return 1;
@@ -1002,7 +1009,7 @@ static int addend_mips_rel(struct elf_info *elf, int rsection, Elf_Rela *r)
  **/
 static void check_sec_ref(struct module *mod, const char *modname,
 			  struct elf_info *elf,
-			  int section(const char*),
+			  int section(const char *),
 			  int section_ref_ok(const char *))
 {
 	int i;
@@ -1022,7 +1029,7 @@ static void check_sec_ref(struct module *mod, const char *modname,
 		if (sechdrs[i].sh_type == SHT_RELA) {
 			Elf_Rela *rela;
 			Elf_Rela *start = (void *)hdr + sechdrs[i].sh_offset;
-			Elf_Rela *stop  = (void*)start + sechdrs[i].sh_size;
+			Elf_Rela *stop  = (void *)start + sechdrs[i].sh_size;
 			name += strlen(".rela");
 			if (section_ref_ok(name))
 				continue;
@@ -1059,7 +1066,7 @@ static void check_sec_ref(struct module *mod, const char *modname,
 		} else if (sechdrs[i].sh_type == SHT_REL) {
 			Elf_Rel *rel;
 			Elf_Rel *start = (void *)hdr + sechdrs[i].sh_offset;
-			Elf_Rel *stop  = (void*)start + sechdrs[i].sh_size;
+			Elf_Rel *stop  = (void *)start + sechdrs[i].sh_size;
 			name += strlen(".rel");
 			if (section_ref_ok(name))
 				continue;
@@ -1088,7 +1095,7 @@ static void check_sec_ref(struct module *mod, const char *modname,
 						continue;
 					break;
 				case EM_ARM:
-					if(addend_arm_rel(elf, i, &r))
+					if (addend_arm_rel(elf, i, &r))
 						continue;
 					break;
 				case EM_MIPS:
@@ -1126,32 +1133,32 @@ static int initexit_section_ref_ok(const char *name)
 	const char **s;
 	/* Absolute section names */
 	const char *namelist1[] = {
-		"__bug_table",		/* used by powerpc for BUG() */
+		"__bug_table",	/* used by powerpc for BUG() */
 		"__ex_table",
 		".altinstructions",
-		".cranges",		/* used by sh64 */
+		".cranges",	/* used by sh64 */
 		".fixup",
-		".machvec",		/* ia64 + powerpc uses these */
+		".machvec",	/* ia64 + powerpc uses these */
 		".machine.desc",
-		".opd",			/* See comment [OPD] */
+		".opd",		/* See comment [OPD] */
 		"__dbe_table",
 		".parainstructions",
 		".pdr",
-		".plt",			/* seen on ARCH=um build on x86_64. Harmless */
+		".plt",		/* seen on ARCH=um build on x86_64. Harmless */
 		".smp_locks",
 		".stab",
 		".m68k_fixup",
-		".xt.prop",		/* xtensa informational section */
-		".xt.lit",		/* xtensa informational section */
+		".xt.prop",	/* xtensa informational section */
+		".xt.lit",	/* xtensa informational section */
 		NULL
 	};
 	/* Start of section names */
 	const char *namelist2[] = {
 		".debug",
 		".eh_frame",
-		".note",		/* ignore ELF notes - may contain anything */
-		".got",			/* powerpc - global offset table */
-		".toc",			/* powerpc - table of contents */
+		".note",	/* ignore ELF notes - may contain anything */
+		".got",		/* powerpc - global offset table */
+		".toc",		/* powerpc - table of contents */
 		NULL
 	};
 	/* part of section name */
@@ -1221,7 +1228,8 @@ static int init_section_ref_ok(const char *name)
 			return 1;
 
 	/* If section name ends with ".init" we allow references
-	 * as is the case with .initcallN.init, .early_param.init, .taglist.init etc
+	 * as is the case with .initcallN.init, .early_param.init,
+	 * .taglist.init etc
 	 */
 	if (strrcmp(name, ".init") == 0)
 		return 1;
@@ -1368,7 +1376,7 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 	}
 }
 
-static void check_for_unused(enum export exp, const char* m, const char* s)
+static void check_for_unused(enum export exp, const char *m, const char *s)
 {
 	const char *e = is_vmlinux(m) ?"":".ko";
 
@@ -1401,7 +1409,7 @@ static void check_exports(struct module *mod)
 		if (!mod->gpl_compatible)
 			check_for_gpl_usage(exp->export, basename, exp->name);
 		check_for_unused(exp->export, basename, exp->name);
-        }
+	}
 }
 
 /**
@@ -1465,9 +1473,8 @@ static int add_versions(struct buffer *b, struct module *mod)
 	buf_printf(b, "__attribute__((section(\"__versions\"))) = {\n");
 
 	for (s = mod->unres; s; s = s->next) {
-		if (!s->module) {
+		if (!s->module)
 			continue;
-		}
 		if (!s->crc_valid) {
 			warn("\"%s\" [%s.ko] has no CRC!\n",
 				s->name, mod->name);
@@ -1488,9 +1495,8 @@ static void add_depends(struct buffer *b, struct module *mod,
 	struct module *m;
 	int first = 1;
 
-	for (m = modules; m; m = m->next) {
+	for (m = modules; m; m = m->next)
 		m->seen = is_vmlinux(m->name);
-	}
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const char __module_depends[]\n");
@@ -1506,7 +1512,8 @@ static void add_depends(struct buffer *b, struct module *mod,
 			continue;
 
 		s->module->seen = 1;
-		if ((p = strrchr(s->module->name, '/')) != NULL)
+		p = strrchr(s->module->name, '/');
+		if (p)
 			p++;
 		else
 			p = s->module->name;
@@ -1578,7 +1585,7 @@ static void read_dump(const char *fname, unsigned int kernel)
 	void *file = grab_file(fname, &size);
 	char *line;
 
-        if (!file)
+	if (!file)
 		/* No symbol versions, silently ignore */
 		return;
 
@@ -1601,11 +1608,10 @@ static void read_dump(const char *fname, unsigned int kernel)
 		crc = strtoul(line, &d, 16);
 		if (*symname == '\0' || *modname == '\0' || *d != '\0')
 			goto fail;
-
-		if (!(mod = find_module(modname))) {
-			if (is_vmlinux(modname)) {
+		mod = find_module(modname);
+		if (!mod) {
+			if (is_vmlinux(modname))
 				have_vmlinux = 1;
-			}
 			mod = new_module(NOFAIL(strdup(modname)));
 			mod->skip = 1;
 		}
@@ -1662,31 +1668,31 @@ int main(int argc, char **argv)
 	int err;
 
 	while ((opt = getopt(argc, argv, "i:I:mso:aw")) != -1) {
-		switch(opt) {
-			case 'i':
-				kernel_read = optarg;
-				break;
-			case 'I':
-				module_read = optarg;
-				external_module = 1;
-				break;
-			case 'm':
-				modversions = 1;
-				break;
-			case 'o':
-				dump_write = optarg;
-				break;
-			case 'a':
-				all_versions = 1;
-				break;
-			case 's':
-				vmlinux_section_warnings = 0;
-				break;
-			case 'w':
-				warn_unresolved = 1;
-				break;
-			default:
-				exit(1);
+		switch (opt) {
+		case 'i':
+			kernel_read = optarg;
+			break;
+		case 'I':
+			module_read = optarg;
+			external_module = 1;
+			break;
+		case 'm':
+			modversions = 1;
+			break;
+		case 'o':
+			dump_write = optarg;
+			break;
+		case 'a':
+			all_versions = 1;
+			break;
+		case 's':
+			vmlinux_section_warnings = 0;
+			break;
+		case 'w':
+			warn_unresolved = 1;
+			break;
+		default:
+			exit(1);
 		}
 	}
 
@@ -1695,9 +1701,8 @@ int main(int argc, char **argv)
 	if (module_read)
 		read_dump(module_read, 0);
 
-	while (optind < argc) {
+	while (optind < argc)
 		read_symbols(argv[optind++]);
-	}
 
 	for (mod = modules; mod; mod = mod->next) {
 		if (mod->skip)
-- 
1.5.4.rc3.14.g44397

