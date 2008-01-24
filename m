Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37483 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756966AbYAXWES (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:18 -0500
Received: from ravnborg.org (0x535d98d8.vgnxx8.adsl-dhcp.tele.dk [83.93.152.216])
	by pasmtpA.tele.dk (Postfix) with ESMTP id D5DC1801DF9
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 23:03:52 +0100 (CET)
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 69/77] kbuild: use simpler section mismatch warnings in modpost
Date: Thu, 24 Jan 2008 23:03:50 +0100
Message-Id: <1201212238-4369-69-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>

The typical layout is now:
WARNING: vmlinux.o(.text+0x372ec): Section mismatch: reference to .devinit.text:pci_scan_one_pbm in 'psycho_scan_bus'

This is first step towards more readable warnings.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |   56 ++++++++++++++-----------------------------------
 1 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 730b321..7dfd039 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -938,20 +938,16 @@ static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
  * The ELF format may have a better way to detect what type of symbol
  * it is, but this works for now.
  **/
-static void find_symbols_between(struct elf_info *elf, Elf_Addr addr,
-				 const char *sec,
-				 Elf_Sym **before, Elf_Sym **after)
+static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
+				 const char *sec)
 {
 	Elf_Sym *sym;
+	Elf_Sym *near = NULL;
 	Elf_Ehdr *hdr = elf->hdr;
-	Elf_Addr beforediff = ~0;
-	Elf_Addr afterdiff = ~0;
+	Elf_Addr distance = ~0;
 	const char *secstrings = (void *)hdr +
 				 elf->sechdrs[hdr->e_shstrndx].sh_offset;
 
-	*before = NULL;
-	*after = NULL;
-
 	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
 		const char *symsec;
 
@@ -963,20 +959,15 @@ static void find_symbols_between(struct elf_info *elf, Elf_Addr addr,
 		if (!is_valid_name(elf, sym))
 			continue;
 		if (sym->st_value <= addr) {
-			if ((addr - sym->st_value) < beforediff) {
-				beforediff = addr - sym->st_value;
-				*before = sym;
-			} else if ((addr - sym->st_value) == beforediff) {
-				*before = sym;
+			if ((addr - sym->st_value) < distance) {
+				distance = addr - sym->st_value;
+				near = sym;
+			} else if ((addr - sym->st_value) == distance) {
+				near = sym;
 			}
-		} else {
-			if ((sym->st_value - addr) < afterdiff) {
-				afterdiff = sym->st_value - addr;
-				*after = sym;
-			} else if ((sym->st_value - addr) == afterdiff)
-				*after = sym;
 		}
 	}
+	return near;
 }
 
 /**
@@ -988,7 +979,7 @@ static void warn_sec_mismatch(const char *modname, const char *fromsec,
 			      struct elf_info *elf, Elf_Sym *sym, Elf_Rela r)
 {
 	const char *refsymname = "";
-	Elf_Sym *before, *after;
+	Elf_Sym *where;
 	Elf_Sym *refsym;
 	Elf_Ehdr *hdr = elf->hdr;
 	Elf_Shdr *sechdrs = elf->sechdrs;
@@ -996,7 +987,7 @@ static void warn_sec_mismatch(const char *modname, const char *fromsec,
 				 sechdrs[hdr->e_shstrndx].sh_offset;
 	const char *secname = secstrings + sechdrs[sym->st_shndx].sh_name;
 
-	find_symbols_between(elf, r.r_offset, fromsec, &before, &after);
+	where = find_elf_symbol2(elf, r.r_offset, fromsec);
 
 	refsym = find_elf_symbol(elf, r.r_addend, sym);
 	if (refsym && strlen(elf->strtab + refsym->st_name))
@@ -1004,30 +995,15 @@ static void warn_sec_mismatch(const char *modname, const char *fromsec,
 
 	/* check whitelist - we may ignore it */
 	if (secref_whitelist(modname, secname, fromsec,
-			     before ? elf->strtab + before->st_name : "",
+			     where ? elf->strtab + where->st_name : "",
 	                     refsymname))
 		return;
 
-	if (before && after) {
-		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
-		     "(between '%s' and '%s')\n",
-		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname,
-		     elf->strtab + before->st_name,
-		     elf->strtab + after->st_name);
-	} else if (before) {
-		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
-		     "(after '%s')\n",
-		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname,
-		     elf->strtab + before->st_name);
-	} else if (after) {
+	if (where) {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s "
-		     "before '%s' (at offset -0x%llx)\n",
+		     "in '%s'\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
-		     secname, refsymname,
-		     elf->strtab + after->st_name,
-		     (unsigned long long)r.r_offset);
+		     secname, refsymname, elf->strtab + where->st_name);
 	} else {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
-- 
1.5.4.rc3.14.g44397

