Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:55198 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751981AbYAXVr3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 16:47:29 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 705FEF180AF
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 22:47:26 +0100 (CET)
Date: Thu, 24 Jan 2008 22:47:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: modpost is becoming verbose
Message-ID: <20080124214737.GA4122@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>

I have commit the following patch to kbuild.git to
make modpost more verbose.

The verbosity can be adjusted by a new config option
introduced in an earlier patch and you need full kbuild.git
to try it out.

All patches will soon hit kbuild + lkml for review.

	Sam

From 678f770eb79d245d38b33c3f0fb14c7f1c93d9ec Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 24 Jan 2008 21:12:37 +0100
Subject: [PATCH] kbuild: add verbose option to Section mismatch reporting in modpost

If the config option CONFIG_SECTION_MISMATCH is not set and
we see a Section mismatch present the following to the user:

modpost: Found 1 section mismatch(es).
To see additional details select "Enable full Section mismatch analysis"
in the Kernel Hacking menu (CONFIG_SECTION_MISMATCH).

If the option CONFIG_SECTION_MISMATCH is selected
then be verbose in the Section mismatch reporting from mdopost.
Sample outputs:

WARNING: o-x86_64/vmlinux.o(.text+0x7396): Section mismatch in reference from the function discover_ebda() to the variable .init.data:ebda_addr
The function  discover_ebda() references
the variable __initdata ebda_addr.
This is often because discover_ebda lacks a __initdata
annotation or the annotation of ebda_addr is wrong.

WARNING: o-x86_64/vmlinux.o(.data+0x74d58): Section mismatch in reference from the variable pci_serial_quirks to the function .devexit.text:pci_plx9050_exit()
The variable pci_serial_quirks references
the function __devexit pci_plx9050_exit()
If the reference is valid then annotate the
variable with __exit* (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

WARNING: o-x86_64/vmlinux.o(__ksymtab+0x630): Section mismatch in reference from the variable __ksymtab_arch_register_cpu to the function .cpuinit.text:arch_register_cpu()
The symbol arch_register_cpu is exported and annotated __cpuinit
Fix this by removing the __cpuinit annotation of arch_register_cpu or drop the export.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 lib/Kconfig.debug        |    2 +
 scripts/Makefile.modpost |    1 +
 scripts/mod/modpost.c    |  255 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 229 insertions(+), 29 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c1fb0c6..d930aec 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -108,6 +108,8 @@ config DEBUG_SECTION_MISMATCH
 	    will tell where the mismatch happens much closer to the
 	    source. The drawback is that we will report the same
 	    mismatch at least twice.
+	  - Enable verbose reporting from modpost to help solving
+	    the section mismatches reported.
 
 config DEBUG_KERNEL
 	bool "Kernel debugging"
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index d988f5d..65e707e 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -62,6 +62,7 @@ modpost = scripts/mod/modpost                    \
  $(if $(KBUILD_EXTMOD),-i,-o) $(kernelsymfile)   \
  $(if $(KBUILD_EXTMOD),-I $(modulesymfile))      \
  $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
+ $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
  $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
 
 quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e75739e..3cf1ba8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -28,6 +28,9 @@ static int vmlinux_section_warnings = 1;
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
 /* How a symbol is exported */
+static int sec_mismatch_count = 0;
+static int sec_mismatch_verbose = 1;
+
 enum export {
 	export_plain,      export_unused,     export_gpl,
 	export_unused_gpl, export_gpl_future, export_unknown
@@ -760,9 +763,23 @@ static const char *head_sections[] = { ".head.text*", NULL };
 static const char *linker_symbols[] =
 	{ "__init_begin", "_sinittext", "_einittext", NULL };
 
+enum mismatch {
+	NO_MISMATCH,
+	TEXT_TO_INIT,
+	DATA_TO_INIT,
+	TEXT_TO_EXIT,
+	DATA_TO_EXIT,
+	XXXINIT_TO_INIT,
+	XXXEXIT_TO_EXIT,
+	INIT_TO_EXIT,
+	EXIT_TO_INIT,
+	EXPORT_TO_INIT_EXIT,
+};
+
 struct sectioncheck {
 	const char *fromsec[20];
 	const char *tosec[20];
+	enum mismatch mismatch;
 };
 
 const struct sectioncheck sectioncheck[] = {
@@ -770,33 +787,54 @@ const struct sectioncheck sectioncheck[] = {
  * normal code and data
  */
 {
-	.fromsec = { TEXT_SECTIONS, DATA_SECTIONS, NULL },
-	.tosec   = { ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS, NULL }
+	.fromsec = { TEXT_SECTIONS, NULL },
+	.tosec   = { ALL_INIT_SECTIONS, NULL },
+	.mismatch = TEXT_TO_INIT,
+},
+{
+	.fromsec = { DATA_SECTIONS, NULL },
+	.tosec   = { ALL_INIT_SECTIONS, NULL },
+	.mismatch = DATA_TO_INIT,
+},
+{
+	.fromsec = { TEXT_SECTIONS, NULL },
+	.tosec   = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = TEXT_TO_EXIT,
+},
+{
+	.fromsec = { DATA_SECTIONS, NULL },
+	.tosec   = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = DATA_TO_EXIT,
 },
 /* Do not reference init code/data from devinit/cpuinit/meminit code/data */
 {
 	.fromsec = { DEV_INIT_SECTIONS, CPU_INIT_SECTIONS, MEM_INIT_SECTIONS, NULL },
-	.tosec   = { INIT_SECTIONS, NULL }
+	.tosec   = { INIT_SECTIONS, NULL },
+	.mismatch = XXXINIT_TO_INIT,
 },
 /* Do not reference exit code/data from devexit/cpuexit/memexit code/data */
 {
 	.fromsec = { DEV_EXIT_SECTIONS, CPU_EXIT_SECTIONS, MEM_EXIT_SECTIONS, NULL },
-	.tosec   = { EXIT_SECTIONS, NULL }
+	.tosec   = { EXIT_SECTIONS, NULL },
+	.mismatch = XXXEXIT_TO_EXIT,
 },
 /* Do not use exit code/data from init code */
 {
 	.fromsec = { ALL_INIT_SECTIONS, NULL },
 	.tosec   = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = INIT_TO_EXIT,
 },
 /* Do not use init code/data from exit code */
 {
 	.fromsec = { ALL_EXIT_SECTIONS, NULL },
-	.tosec   = { ALL_INIT_SECTIONS, NULL }
+	.tosec   = { ALL_INIT_SECTIONS, NULL },
+	.mismatch = EXIT_TO_INIT,
 },
 /* Do not export init/exit functions or data */
 {
 	.fromsec = { "__ksymtab*", NULL },
-	.tosec   = { ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS, NULL }
+	.tosec   = { ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS, NULL },
+	.mismatch = EXPORT_TO_INIT_EXIT
 }
 };
 
@@ -809,10 +847,10 @@ static int section_mismatch(const char *fromsec, const char *tosec)
 	for (i = 0; i < elems; i++) {
 		if (match(fromsec, check->fromsec) &&
 		    match(tosec, check->tosec))
-			return 1;
+			return check->mismatch;
 		check++;
 	}
-	return 0;
+	return NO_MISMATCH;
 }
 
 /**
@@ -989,47 +1027,197 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
 }
 
 /*
+ * Convert a section name to the function/data attribute
+ * .init.text => __init
+ * .cpuinit.data => __cpudata
+ * .memexitconst => __memconst
+ * etc.
+*/
+static char *sec2annotation(const char *s)
+{
+	if (match(s, init_exit_sections)) {
+		char *p = malloc(20);
+		char *r = p;
+
+		*p++ = '_';
+		*p++ = '_';
+		if (*s == '.')
+			s++;
+		while (*s && *s != '.')
+			*p++ = *s++;
+		*p = '\0';
+		if (*s == '.')
+			s++;
+		if (strstr(s, "rodata") != NULL)
+			strcat(p, "const ");
+		else if (strstr(s, "data") != NULL)
+			strcat(p, "data ");
+		else
+			strcat(p, " ");
+		return r; /* we leak her but we do not care */
+	} else {
+		return "";
+	}
+}
+
+static int is_function(Elf_Sym *sym)
+{
+	if (sym)
+		return ELF_ST_TYPE(sym->st_info) == STT_FUNC;
+	else
+		return 0;
+}
+
+/*
  * Print a warning about a section mismatch.
  * Try to find symbols near it so user can find it.
  * Check whitelist before warning - it may be a false positive.
  */
-static void report_sec_mismatch(const char *modname,
+static void report_sec_mismatch(const char *modname, enum mismatch mismatch,
                                 const char *fromsec,
                                 unsigned long long fromaddr,
                                 const char *fromsym,
-                                const char *tosec, const char *tosym)
-{
-	if (strlen(tosym)) {
-		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
-		     "in '%s'\n",
-		     modname, fromsec, fromaddr,
-		     tosec, tosym, fromsym);
-	} else {
-		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s\n",
-		     modname, fromsec, fromaddr,
-		     tosec, tosym);
+                                int from_is_func,
+                                const char *tosec, const char *tosym,
+                                int to_is_func)
+{
+	const char *from, *from_p;
+	const char *to, *to_p;
+	from = from_is_func ? "function" : "variable";
+	from_p = from_is_func ? "()" : "";
+	to = to_is_func ? "function" : "variable";
+	to_p = to_is_func ? "()" : "";
+
+	fprintf(stderr, "WARNING: %s(%s+0x%llx): Section mismatch in"
+	                " reference from the %s %s%s to the %s %s:%s%s\n",
+                        modname, fromsec, fromaddr, from, fromsym, from_p,
+	                to, tosec, tosym, to_p);
+
+	sec_mismatch_count++;
+	if (!sec_mismatch_verbose)
+		return;
+
+	switch (mismatch) {
+	case TEXT_TO_INIT:
+		fprintf(stderr,
+		"The function %s %s() references\n"
+		"the %s %s%s%s.\n"
+		"This is often because %s lacks a %s\n"
+		"annotation or the annotation of %s is wrong.\n",
+		sec2annotation(fromsec), fromsym,
+		to, sec2annotation(tosec), tosym, to_p,
+		fromsym, sec2annotation(tosec), tosym);
+		break;
+	case DATA_TO_INIT: {
+		const char **s = symbol_white_list;
+		fprintf(stderr,
+		"The variable %s references\n"
+		"the %s %s%s%s\n"
+		"If the reference is valid then annotate the\n"
+		"variable with __init* (see linux/init.h) "
+		"or name the variable:\n",
+		fromsym, to, sec2annotation(tosec), tosym, to_p);
+		while (*s)
+			fprintf(stderr, "%s, ", *s++);
+		fprintf(stderr, "\n");
+		break;
 	}
+	case TEXT_TO_EXIT:
+		fprintf(stderr,
+		"The function %s() references a %s in an exit section.\n"
+		"Often the %s %s%s has valid usage outside the exit section\n"
+		"and the fix is to remove the %sannotation of %s.\n",
+		fromsym, to, to, tosym, to_p, sec2annotation(tosec), tosym);
+		break;
+	case DATA_TO_EXIT: {
+		const char **s = symbol_white_list;
+		fprintf(stderr,
+		"The variable %s references\n"
+		"the %s %s%s%s\n"
+		"If the reference is valid then annotate the\n"
+		"variable with __exit* (see linux/init.h) or "
+		"name the variable:\n",
+		fromsym, to, sec2annotation(tosec), tosym, to_p);
+		while (*s)
+			fprintf(stderr, "%s, ", *s++);
+		fprintf(stderr, "\n");
+		break;
+	}
+	case XXXINIT_TO_INIT:
+	case XXXEXIT_TO_EXIT:
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"If %s is only used by %s then\n"
+		"annotate %s with a matching annotation.\n",
+		from, sec2annotation(fromsec), fromsym, from_p,
+		to, sec2annotation(tosec), tosym, to_p,
+		fromsym, tosym, fromsym);
+		break;
+	case INIT_TO_EXIT:
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"This is often seen when error handling "
+		"in the init function\n"
+		"uses functionality in the exit path.\n"
+		"The fix is often to remove the %sannotation of\n"
+		"%s%s so it may be used outside an exit section.\n",
+		from, sec2annotation(fromsec), fromsym, from_p,
+		to, sec2annotation(tosec), tosym, to_p,
+		sec2annotation(tosec), tosym, to_p);
+		break;
+	case EXIT_TO_INIT:
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"This is often seen when error handling "
+		"in the exit function\n"
+		"uses functionality in the init path.\n"
+		"The fix is often to remove the %sannotation of\n"
+		"%s%s so it may be used outside an init section.\n",
+		from, sec2annotation(fromsec), fromsym, from_p,
+		to, sec2annotation(tosec), tosym, to_p,
+		sec2annotation(tosec), tosym, to_p);
+		break;
+	case EXPORT_TO_INIT_EXIT:
+		fprintf(stderr,
+		"The symbol %s is exported and annotated %s\n"
+		"Fix this by removing the %sannotation of %s "
+		"or drop the export.\n",
+		tosym, sec2annotation(tosec), sec2annotation(tosec), tosym);
+	case NO_MISMATCH:
+		/* To get warnings on missing members */
+		break;
+	}
+	fprintf(stderr, "\n");
 }
 
 static void check_section_mismatch(const char *modname, struct elf_info *elf,
                                    Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
 {
 	const char *tosec;
+	enum mismatch mismatch;
 
 	tosec = sec_name(elf, sym->st_shndx);
-	if (section_mismatch(fromsec, tosec)) {
-		const char *fromsym;
+	mismatch = section_mismatch(fromsec, tosec);
+	if (mismatch != NO_MISMATCH) {
+		Elf_Sym *to;
+		Elf_Sym *from;
 		const char *tosym;
+		const char *fromsym;
 
-		fromsym = sym_name(elf,
-		          find_elf_symbol2(elf, r->r_offset, fromsec));
-		tosym = sym_name(elf,
-		        find_elf_symbol(elf, r->r_addend, sym));
+		from = find_elf_symbol2(elf, r->r_offset, fromsec);
+		fromsym = sym_name(elf, from);
+		to = find_elf_symbol(elf, r->r_addend, sym);
+		tosym = sym_name(elf, to);
 
 		/* check whitelist - we may ignore it */
 		if (secref_whitelist(fromsec, fromsym, tosec, tosym)) {
-			report_sec_mismatch(modname, fromsec, r->r_offset,
-			                    fromsym, tosec, tosym);
+			report_sec_mismatch(modname, mismatch,
+			   fromsec, r->r_offset, fromsym,
+			   is_function(from), tosec, tosym,
+			   is_function(to));
 		}
 	}
 }
@@ -1643,7 +1831,7 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 
-	while ((opt = getopt(argc, argv, "i:I:mso:aw")) != -1) {
+	while ((opt = getopt(argc, argv, "i:I:msSo:aw")) != -1) {
 		switch (opt) {
 		case 'i':
 			kernel_read = optarg;
@@ -1664,6 +1852,9 @@ int main(int argc, char **argv)
 		case 's':
 			vmlinux_section_warnings = 0;
 			break;
+		case 'S':
+			sec_mismatch_verbose = 0;
+			break;
 		case 'w':
 			warn_unresolved = 1;
 			break;
@@ -1708,6 +1899,12 @@ int main(int argc, char **argv)
 
 	if (dump_write)
 		write_dump(dump_write);
+	if (sec_mismatch_count && !sec_mismatch_verbose)
+		fprintf(stderr, "modpost: Found %d section mismatch(es).\n"
+		        "To see additional details select \"Enable full "
+		        "Section mismatch analysis\"\n"
+		        "in the Kernel Hacking menu "
+		        "(CONFIG_SECTION_MISMATCH).\n", sec_mismatch_count);
 
 	return err;
 }
-- 
1.5.4.rc3.14.g44397

