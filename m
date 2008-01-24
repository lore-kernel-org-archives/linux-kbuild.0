Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42830 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755891AbYAXWEI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:08 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpB.tele.dk (Postfix) with ESMTP id D62A4E31C93
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 70/77] kbuild: introduce a few helpers in modpost
Date: Thu, 24 Jan 2008 23:03:51 +0100
Message-Id: <1201212238-4369-70-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

Introducing helpers to retreive symbol and section
names cleaned up the code a bit.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |   73 +++++++++++++++++++++++++-----------------------
 1 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 7dfd039..e4099cd 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -605,6 +605,26 @@ static int strrcmp(const char *s, const char *sub)
 	return memcmp(s + slen - sublen, sub, sublen);
 }
 
+static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
+{
+	return elf->strtab + sym->st_name;
+}
+
+static const char *sec_name(struct elf_info *elf, int shndx)
+{
+	Elf_Shdr *sechdrs = elf->sechdrs;
+	return (void *)elf->hdr +
+	        elf->sechdrs[elf->hdr->e_shstrndx].sh_offset +
+	        sechdrs[shndx].sh_name;
+}
+
+static const char *sech_name(struct elf_info *elf, Elf_Shdr *sechdr)
+{
+	return (void *)elf->hdr +
+	        elf->sechdrs[elf->hdr->e_shstrndx].sh_offset +
+	        sechdr->sh_name;
+}
+
 /* if sym is empty or point to a string
  * like ".[0-9]+" then return 1.
  * This is the optional prefix added by ld to some sections
@@ -943,17 +963,14 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
 {
 	Elf_Sym *sym;
 	Elf_Sym *near = NULL;
-	Elf_Ehdr *hdr = elf->hdr;
 	Elf_Addr distance = ~0;
-	const char *secstrings = (void *)hdr +
-				 elf->sechdrs[hdr->e_shstrndx].sh_offset;
 
 	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
 		const char *symsec;
 
 		if (sym->st_shndx >= SHN_LORESERVE)
 			continue;
-		symsec = secstrings + elf->sechdrs[sym->st_shndx].sh_name;
+		symsec = sec_name(elf, sym->st_shndx);
 		if (strcmp(symsec, sec) != 0)
 			continue;
 		if (!is_valid_name(elf, sym))
@@ -978,24 +995,21 @@ static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
 static void warn_sec_mismatch(const char *modname, const char *fromsec,
 			      struct elf_info *elf, Elf_Sym *sym, Elf_Rela r)
 {
-	const char *refsymname = "";
 	Elf_Sym *where;
 	Elf_Sym *refsym;
-	Elf_Ehdr *hdr = elf->hdr;
-	Elf_Shdr *sechdrs = elf->sechdrs;
-	const char *secstrings = (void *)hdr +
-				 sechdrs[hdr->e_shstrndx].sh_offset;
-	const char *secname = secstrings + sechdrs[sym->st_shndx].sh_name;
+	const char *refsymname = "";
+	const char *secname;
 
+	secname = sec_name(elf, sym->st_shndx);
 	where = find_elf_symbol2(elf, r.r_offset, fromsec);
 
 	refsym = find_elf_symbol(elf, r.r_addend, sym);
-	if (refsym && strlen(elf->strtab + refsym->st_name))
-		refsymname = elf->strtab + refsym->st_name;
+	if (refsym && strlen(sym_name(elf, refsym)))
+		refsymname = sym_name(elf, refsym);
 
 	/* check whitelist - we may ignore it */
 	if (secref_whitelist(modname, secname, fromsec,
-			     where ? elf->strtab + where->st_name : "",
+			     where ? sym_name(elf, where) : "",
 	                     refsymname))
 		return;
 
@@ -1003,7 +1017,7 @@ static void warn_sec_mismatch(const char *modname, const char *fromsec,
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
 		     "in '%s'\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname, elf->strtab + where->st_name);
+		     secname, refsymname, sym_name(elf, where));
 	} else {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
@@ -1095,14 +1109,10 @@ static void section_rela(const char *modname, struct elf_info *elf,
 	const char *fromsec;
 	const char * tosec;
 
-	Elf_Ehdr *hdr = elf->hdr;
-	Elf_Rela *start = (void *)hdr + sechdr->sh_offset;
+	Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
 	Elf_Rela *stop  = (void *)start + sechdr->sh_size;
 
-	const char *secstrings = (void *)hdr +
-				 elf->sechdrs[hdr->e_shstrndx].sh_offset;
-
-	fromsec = secstrings + sechdr->sh_name;
+	fromsec = sech_name(elf, sechdr);
 	fromsec += strlen(".rela");
 	/* if from section (name) is know good then skip it */
 	if (match(fromsec, section_white_list))
@@ -1111,7 +1121,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
 	for (rela = start; rela < stop; rela++) {
 		r.r_offset = TO_NATIVE(rela->r_offset);
 #if KERNEL_ELFCLASS == ELFCLASS64
-		if (hdr->e_machine == EM_MIPS) {
+		if (elf->hdr->e_machine == EM_MIPS) {
 			unsigned int r_typ;
 			r_sym = ELF64_MIPS_R_SYM(rela->r_info);
 			r_sym = TO_NATIVE(r_sym);
@@ -1131,8 +1141,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
 		if (sym->st_shndx >= SHN_LORESERVE)
 			continue;
 
-		tosec = secstrings +
-			elf->sechdrs[sym->st_shndx].sh_name;
+		tosec = sec_name(elf, sym->st_shndx);
 		if (section_mismatch(fromsec, tosec))
 			warn_sec_mismatch(modname, fromsec, elf, sym, r);
 	}
@@ -1148,14 +1157,10 @@ static void section_rel(const char *modname, struct elf_info *elf,
 	const char *fromsec;
 	const char * tosec;
 
-	Elf_Ehdr *hdr = elf->hdr;
-	Elf_Rel *start = (void *)hdr + sechdr->sh_offset;
+	Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
 	Elf_Rel *stop  = (void *)start + sechdr->sh_size;
 
-	const char *secstrings = (void *)hdr +
-				 elf->sechdrs[hdr->e_shstrndx].sh_offset;
-
-	fromsec = secstrings + sechdr->sh_name;
+	fromsec = sech_name(elf, sechdr);
 	fromsec += strlen(".rel");
 	/* if from section (name) is know good then skip it */
 	if (match(fromsec, section_white_list))
@@ -1164,7 +1169,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 	for (rel = start; rel < stop; rel++) {
 		r.r_offset = TO_NATIVE(rel->r_offset);
 #if KERNEL_ELFCLASS == ELFCLASS64
-		if (hdr->e_machine == EM_MIPS) {
+		if (elf->hdr->e_machine == EM_MIPS) {
 			unsigned int r_typ;
 			r_sym = ELF64_MIPS_R_SYM(rel->r_info);
 			r_sym = TO_NATIVE(r_sym);
@@ -1179,7 +1184,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 		r_sym = ELF_R_SYM(r.r_info);
 #endif
 		r.r_addend = 0;
-		switch (hdr->e_machine) {
+		switch (elf->hdr->e_machine) {
 		case EM_386:
 			if (addend_386_rel(elf, sechdr, &r))
 				continue;
@@ -1198,8 +1203,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 		if (sym->st_shndx >= SHN_LORESERVE)
 			continue;
 
-		tosec = secstrings +
-			elf->sechdrs[sym->st_shndx].sh_name;
+		tosec = sec_name(elf, sym->st_shndx);
 		if (section_mismatch(fromsec, tosec))
 			warn_sec_mismatch(modname, fromsec, elf, sym, r);
 	}
@@ -1221,11 +1225,10 @@ static void check_sec_ref(struct module *mod, const char *modname,
                           struct elf_info *elf)
 {
 	int i;
-	Elf_Ehdr *hdr = elf->hdr;
 	Elf_Shdr *sechdrs = elf->sechdrs;
 
 	/* Walk through all sections */
-	for (i = 0; i < hdr->e_shnum; i++) {
+	for (i = 0; i < elf->hdr->e_shnum; i++) {
 		/* We want to process only relocation sections and not .init */
 		if (sechdrs[i].sh_type == SHT_RELA)
 			section_rela(modname, elf, &elf->sechdrs[i]);
-- 
1.5.4.rc3.14.g44397

