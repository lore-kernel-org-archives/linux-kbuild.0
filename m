Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42827 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757070AbYAXWEH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:07 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 9E7CBE31CA8
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 71/77] kbuild: simplified warning report in modpost
Date: Thu, 24 Jan 2008 23:03:52 +0100
Message-Id: <1201212238-4369-71-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Refactor code so the warning report function
does nothing else than reporting warnings.
As a side effect some other code paths were cleaned
up by this.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |  104 ++++++++++++++++++++++++------------------------
 1 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e4099cd..0a80aca 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -607,7 +607,10 @@ static int strrcmp(const char *s, const char *sub)
 
 static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
 {
-	return elf->strtab + sym->st_name;
+	if (sym)
+		return elf->strtab + sym->st_name;
+	else
+		return "";
 }
 
 static const char *sec_name(struct elf_info *elf, int shndx)
@@ -812,7 +815,6 @@ static int section_mismatch(const char *fromsec, const char *tosec)
 	return 0;
 }
 
-
 /**
  * Whitelist to allow certain references to pass with no warning.
  *
@@ -856,36 +858,35 @@ static int section_mismatch(const char *fromsec, const char *tosec)
  *   refsymname = __init_begin, _sinittext, _einittext
  *
  **/
-static int secref_whitelist(const char *modname, const char *tosec,
-			    const char *fromsec, const char *atsym,
-			    const char *refsymname)
+static int secref_whitelist(const char *fromsec, const char *fromsym,
+			    const char *tosec, const char *tosym)
 {
 	/* Check for pattern 0 */
 	if (match(fromsec, initref_sections))
-		return 1;
+		return 0;
 
 	/* Check for pattern 1 */
 	if (match(tosec, init_data_sections) &&
 	    match(fromsec, data_sections) &&
-	    (strncmp(atsym, "__param", strlen("__param")) == 0))
-		return 1;
+	    (strncmp(fromsym, "__param", strlen("__param")) == 0))
+		return 0;
 
 	/* Check for pattern 2 */
 	if (match(tosec, init_exit_sections) &&
 	    match(fromsec, data_sections) &&
-	    match(atsym, symbol_white_list))
-		return 1;
+	    match(fromsym, symbol_white_list))
+		return 0;
 
 	/* Check for pattern 3 */
 	if (match(fromsec, head_sections) &&
 	    match(tosec, init_sections))
-	return 1;
+		return 0;
 
 	/* Check for pattern 4 */
-	if (match(refsymname, linker_symbols))
-		return 1;
+	if (match(tosym, linker_symbols))
+		return 0;
 
-	return 0;
+	return 1;
 }
 
 /**
@@ -987,41 +988,49 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
 	return near;
 }
 
-/**
+/*
  * Print a warning about a section mismatch.
  * Try to find symbols near it so user can find it.
  * Check whitelist before warning - it may be a false positive.
- **/
-static void warn_sec_mismatch(const char *modname, const char *fromsec,
-			      struct elf_info *elf, Elf_Sym *sym, Elf_Rela r)
+ */
+static void report_sec_mismatch(const char *modname,
+                                const char *fromsec,
+                                unsigned long long fromaddr,
+                                const char *fromsym,
+                                const char *tosec, const char *tosym)
 {
-	Elf_Sym *where;
-	Elf_Sym *refsym;
-	const char *refsymname = "";
-	const char *secname;
-
-	secname = sec_name(elf, sym->st_shndx);
-	where = find_elf_symbol2(elf, r.r_offset, fromsec);
-
-	refsym = find_elf_symbol(elf, r.r_addend, sym);
-	if (refsym && strlen(sym_name(elf, refsym)))
-		refsymname = sym_name(elf, refsym);
-
-	/* check whitelist - we may ignore it */
-	if (secref_whitelist(modname, secname, fromsec,
-			     where ? sym_name(elf, where) : "",
-	                     refsymname))
-		return;
-
-	if (where) {
+	if (strlen(tosym)) {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
 		     "in '%s'\n",
-		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname, sym_name(elf, where));
+		     modname, fromsec, fromaddr,
+		     tosec, tosym, fromsym);
 	} else {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s\n",
-		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname);
+		     modname, fromsec, fromaddr,
+		     tosec, tosym);
+	}
+}
+
+static void check_section_mismatch(const char *modname, struct elf_info *elf,
+                                   Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
+{
+	const char *tosec;
+
+	tosec = sec_name(elf, sym->st_shndx);
+	if (section_mismatch(fromsec, tosec)) {
+		const char *fromsym;
+		const char *tosym;
+
+		fromsym = sym_name(elf,
+		          find_elf_symbol2(elf, r->r_offset, fromsec));
+		tosym = sym_name(elf,
+		        find_elf_symbol(elf, r->r_addend, sym));
+
+		/* check whitelist - we may ignore it */
+		if (secref_whitelist(fromsec, fromsym, tosec, tosym)) {
+			report_sec_mismatch(modname, fromsec, r->r_offset,
+			                    fromsym, tosec, tosym);
+		}
 	}
 }
 
@@ -1107,7 +1116,6 @@ static void section_rela(const char *modname, struct elf_info *elf,
 	Elf_Rela r;
 	unsigned int r_sym;
 	const char *fromsec;
-	const char * tosec;
 
 	Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
 	Elf_Rela *stop  = (void *)start + sechdr->sh_size;
@@ -1117,7 +1125,6 @@ static void section_rela(const char *modname, struct elf_info *elf,
 	/* if from section (name) is know good then skip it */
 	if (match(fromsec, section_white_list))
 		return;
-
 	for (rela = start; rela < stop; rela++) {
 		r.r_offset = TO_NATIVE(rela->r_offset);
 #if KERNEL_ELFCLASS == ELFCLASS64
@@ -1140,10 +1147,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		/* Skip special sections */
 		if (sym->st_shndx >= SHN_LORESERVE)
 			continue;
-
-		tosec = sec_name(elf, sym->st_shndx);
-		if (section_mismatch(fromsec, tosec))
-			warn_sec_mismatch(modname, fromsec, elf, sym, r);
+		check_section_mismatch(modname, elf, &r, sym, fromsec);
 	}
 }
 
@@ -1155,7 +1159,6 @@ static void section_rel(const char *modname, struct elf_info *elf,
 	Elf_Rela r;
 	unsigned int r_sym;
 	const char *fromsec;
-	const char * tosec;
 
 	Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
 	Elf_Rel *stop  = (void *)start + sechdr->sh_size;
@@ -1202,10 +1205,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 		/* Skip special sections */
 		if (sym->st_shndx >= SHN_LORESERVE)
 			continue;
-
-		tosec = sec_name(elf, sym->st_shndx);
-		if (section_mismatch(fromsec, tosec))
-			warn_sec_mismatch(modname, fromsec, elf, sym, r);
+		check_section_mismatch(modname, elf, &r, sym, fromsec);
 	}
 }
 
-- 
1.5.4.rc3.14.g44397

