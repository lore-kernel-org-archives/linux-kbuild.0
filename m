Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47710473C7D;
	Fri,  7 Aug 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120203; cv=none; b=NJ229mNf0kRnlrMCZKdy97NhJ47v1nf4VffC3YLU0kwEg/omCoQnXL4b1+rxaAeaCzBPqbNNLW0YaxxWTSjtnpcv9CZzxXSIXlDHepSnnJliBiZtcd9jjtfOfmweskToHPrBssNiaowYeDaF8yRDxzMJK3AO6KHxSdWgWAe+wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120203; c=relaxed/simple;
	bh=U6uJBP2yW4sZjp3hsch5acHvSaqHDDZqD7L9TpUr93c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P91J72bcMkgIsyeLVCfACgEiCAQdes50s5RyGKwHQhvKpdy+myWrW8F/VU5X9f3kJtTeKJybv03Hc4730z/4MPldvKnTfkN/7ldqRX/xbdkPo+do2i3AXYIi/KxgzdvoirNQ8P81rtYXdb+GBjGxt+TR00j0UhUfvZr9a+bXkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InqB5j6n; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InqB5j6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786120201; x=1817656201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U6uJBP2yW4sZjp3hsch5acHvSaqHDDZqD7L9TpUr93c=;
  b=InqB5j6n0vRkBZd4yufFgF5h9GasEgEb9797ngtImlovqTIALzQl+5ue
   AQ6urt+MilKTSR81mKbvuyjH93vtmnTItF7VFB2qtm97shJwlJg4FSIUM
   HAO8pJ1TeduQ8gN2S8PifssEyFZmjB1C4hNYLCt6JBghPEqf32eKXjmMZ
   SoS1eagbstoCfjXfKGhgl/wU6/9OccesnAqpMgzswN0EkAuvuPm51zIr0
   EvxUH49vtapp9diQsDPxSKw077wTnAXtmCT8rcm8CUDh4Rhc4Ovy/6tFf
   drko4JiBYPxJ0H5+KbWCpk9Ub/5Lxg8lIL4cONfPdJssRUaTVYXs1I0Fi
   g==;
X-CSE-ConnectionGUID: TMnzhuXVSj69JR4HBPEmKA==
X-CSE-MsgGUID: 7jcF//z9Q5K6CYDItZenzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90613386"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90613386"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:30:01 -0700
X-CSE-ConnectionGUID: M4tYinuxTIm9dU393Bq+sQ==
X-CSE-MsgGUID: h4ZWm3ciRwGsoXHXO6X0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="300639587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:29:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	jani.nikula@intel.com
Subject: [PATCH 2/2] modpost: use mod_warn() and mod_error(), clean up logging
Date: Fri,  7 Aug 2026 19:29:41 +0300
Message-ID: <17ed1bce5d54fb32533ba83bc83c429cb71adcb0.1786120005.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786120005.git.jani.nikula@intel.com>
References: <cover.1786120005.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

Convert all module name logging to use the mod_warn() and mod_error()
helpers, and pass the module to modpost_log() where used directly, to
always have the module name prefixed in the log message, with .ko suffix
for modules.

Pass struct module *mod around in a few places instead of just
mod->name.

Further unify the logging while at it. Use single quotes instead of
double quotes for symbols, sections, and namespaces. Explicitly state
it's a "symbol" when referencing symbols.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: easiest to review by applying and using 'git show --color-words'
---
 scripts/mod/modpost.c | 104 ++++++++++++++++++++----------------------
 1 file changed, 49 insertions(+), 55 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 240b45ff92f8..c2202cb2c434 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -365,9 +365,8 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	struct symbol *s = find_symbol(name);
 
 	if (s && (!external_module || s->module->is_vmlinux || s->module == mod)) {
-		error("%s: '%s' exported twice. Previous export was in %s%s\n",
-		      mod->name, name, s->module->name,
-		      s->module->is_vmlinux ? "" : ".ko");
+		mod_error(mod, "symbol '%s' exported twice. Previous export was in %s%s\n",
+			  name, s->module->name, s->module->is_vmlinux ? "" : ".ko");
 	}
 
 	s = alloc_symbol(name);
@@ -638,7 +637,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 		if (strstarts(symname, "__gnu_lto_")) {
 			/* Should warn here, but modpost runs before the linker */
 		} else
-			warn("\"%s\" [%s] is COMMON symbol\n", symname, mod->name);
+			mod_warn(mod, "'%s' is COMMON symbol\n", symname);
 		break;
 	case SHN_UNDEF:
 		/* undefined symbol */
@@ -781,7 +780,7 @@ static const char *const section_white_list[] =
  * The cause of this is often a section specified in assembler
  * without "ax" / "aw".
  */
-static void check_section(const char *modname, struct elf_info *elf,
+static void check_section(struct module *mod, struct elf_info *elf,
 			  Elf_Shdr *sechdr)
 {
 	const char *sec = sech_name(elf, sechdr);
@@ -789,11 +788,11 @@ static void check_section(const char *modname, struct elf_info *elf,
 	if (sechdr->sh_type == SHT_PROGBITS &&
 	    !(sechdr->sh_flags & SHF_ALLOC) &&
 	    !match(sec, section_white_list)) {
-		warn("%s (%s): unexpected non-allocatable section.\n"
-		     "Did you forget to use \"ax\"/\"aw\" in a .S file?\n"
-		     "Note that for example <linux/init.h> contains\n"
-		     "section definitions for use in .S files.\n\n",
-		     modname, sec);
+		mod_warn(mod, "unexpected non-allocatable section '%s'.\n"
+			 "Did you forget to use \"ax\"/\"aw\" in a .S file?\n"
+			 "Note that for example <linux/init.h> contains\n"
+			 "section definitions for use in .S files.\n\n",
+			 sec);
 	}
 }
 
@@ -1027,7 +1026,7 @@ static bool is_executable_section(struct elf_info *elf, unsigned int secndx)
 	return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) != 0;
 }
 
-static void default_mismatch_handler(const char *modname, struct elf_info *elf,
+static void default_mismatch_handler(struct module *mod, struct elf_info *elf,
 				     const struct sectioncheck* const mismatch,
 				     Elf_Sym *tsym,
 				     unsigned int fsecndx, const char *fromsec, Elf_Addr faddr,
@@ -1057,10 +1056,10 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	 * The format for the reference source:      <symbol_name>+<offset> or <address>
 	 * The format for the reference destination: <symbol_name>          or <address>
 	 */
-	warn("%s: section mismatch in reference: %s%s0x%x (section: %s) -> %s (section: %s)\n",
-	     modname, fromsym, fromsym[0] ? "+" : "",
-	     (unsigned int)(faddr - (fromsym[0] ? from->st_value : 0)),
-	     fromsec, tosym[0] ? tosym : taddr_str, tosec);
+	mod_warn(mod, "section mismatch in reference: %s%s0x%x (section: %s) -> %s (section: %s)\n",
+		 fromsym, fromsym[0] ? "+" : "",
+		 (unsigned int)(faddr - (fromsym[0] ? from->st_value : 0)),
+		 fromsec, tosym[0] ? tosym : taddr_str, tosec);
 
 	if (mismatch->mismatch == EXTABLE_TO_NON_TEXT) {
 		if (match(tosec, mismatch->bad_tosec))
@@ -1069,7 +1068,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 			      "Something is seriously wrong and should be fixed.\n"
 			      "You might get more information about where this is\n"
 			      "coming from by using scripts/check_extable.sh %s\n",
-			      fromsec, (long)faddr, tosec, modname);
+			      fromsec, (long)faddr, tosec, mod->name);
 		else if (is_executable_section(elf, get_secindex(elf, tsym)))
 			warn("The relocation at %s+0x%lx references\n"
 			     "section \"%s\" which is not in the list of\n"
@@ -1099,22 +1098,22 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	label_name = sym_name(elf, label);
 
 	if (!strstarts(label_name, prefix)) {
-		error("%s: .export_symbol section contains strange symbol '%s'\n",
-		      mod->name, label_name);
+		mod_error(mod, ".export_symbol section contains strange symbol '%s'\n",
+			  label_name);
 		return;
 	}
 
 	if (ELF_ST_BIND(sym->st_info) != STB_GLOBAL &&
 	    ELF_ST_BIND(sym->st_info) != STB_WEAK) {
-		error("%s: local symbol '%s' was exported\n", mod->name,
-		      label_name + strlen(prefix));
+		mod_error(mod, "local symbol '%s' was exported\n",
+			  label_name + strlen(prefix));
 		return;
 	}
 
 	name = sym_name(elf, sym);
 	if (strcmp(label_name + strlen(prefix), name)) {
-		error("%s: .export_symbol section references '%s', but it does not seem to be an export symbol\n",
-		      mod->name, name);
+		mod_error(mod, ".export_symbol section references '%s', but it does not seem to be an export symbol\n",
+			  name);
 		return;
 	}
 
@@ -1124,8 +1123,8 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 	} else if (!strcmp(data, "")) {
 		is_gpl = false;
 	} else {
-		error("%s: unknown license '%s' was specified for '%s'\n",
-		      mod->name, data, name);
+		mod_error(mod, "unknown license '%s' was specified for '%s'\n",
+			  data, name);
 		return;
 	}
 
@@ -1148,11 +1147,11 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 		s->is_func = true;
 
 	if (match(secname, PATTERNS(ALL_INIT_SECTIONS)))
-		warn("%s: %s: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.\n",
-		     mod->name, name);
+		mod_warn(mod, "EXPORT_SYMBOL used for init symbol '%s'. Remove __init or EXPORT_SYMBOL.\n",
+			 name);
 	else if (match(secname, PATTERNS(ALL_EXIT_SECTIONS)))
-		warn("%s: %s: EXPORT_SYMBOL used for exit symbol. Remove __exit or EXPORT_SYMBOL.\n",
-		     mod->name, name);
+		mod_warn(mod, "EXPORT_SYMBOL used for exit symbol '%s'. Remove __exit or EXPORT_SYMBOL.\n",
+			 name);
 }
 
 static void check_section_mismatch(struct module *mod, struct elf_info *elf,
@@ -1172,7 +1171,7 @@ static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 	if (!mismatch)
 		return;
 
-	default_mismatch_handler(mod->name, elf, mismatch, sym,
+	default_mismatch_handler(mod, elf, mismatch, sym,
 				 fsecndx, fromsec, faddr,
 				 tosec, taddr);
 }
@@ -1449,7 +1448,7 @@ static void check_sec_ref(struct module *mod, struct elf_info *elf)
 	for (i = 0; i < elf->num_sections; i++) {
 		Elf_Shdr *sechdr = &elf->sechdrs[i];
 
-		check_section(mod->name, elf, sechdr);
+		check_section(mod, elf, sechdr);
 		/* We want to process only relocation sections and not .init */
 		if (sechdr->sh_type == SHT_REL || sechdr->sh_type == SHT_RELA) {
 			/* section to which the relocation applies */
@@ -1619,7 +1618,7 @@ static void read_symbols(const char *modname)
 	if (!mod->is_vmlinux) {
 		license = get_modinfo(&info, "license");
 		if (!license)
-			error("missing MODULE_LICENSE() in %s\n", modname);
+			mod_error(mod, "missing MODULE_LICENSE()\n");
 		while (license) {
 			if (!license_is_gpl_compatible(license)) {
 				mod->is_gpl_compatible = false;
@@ -1632,14 +1631,14 @@ static void read_symbols(const char *modname)
 		     namespace;
 		     namespace = get_next_modinfo(&info, "import_ns", namespace)) {
 			if (strstarts(namespace, MODULE_NS_PREFIX))
-				error("%s: explicitly importing namespace \"%s\" is not allowed.\n",
-				      mod->name, namespace);
+				mod_error(mod, "explicitly importing namespace '%s' is not allowed.\n",
+					  namespace);
 
 			add_namespace(&mod->imported_namespaces, namespace);
 		}
 
 		if (!get_modinfo(&info, "description"))
-			warn("missing MODULE_DESCRIPTION() in %s\n", modname);
+			mod_warn(mod, "missing MODULE_DESCRIPTION()\n");
 	}
 
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
@@ -1778,14 +1777,13 @@ static void check_exports(struct module *mod)
 		exp = find_symbol(s->name);
 		if (!exp) {
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
-				modpost_log(!warn_unresolved, NULL,
-					    "\"%s\" [%s.ko] undefined!\n",
-					    s->name, mod->name);
+				modpost_log(!warn_unresolved, mod,
+					    "symbol '%s' undefined!\n",
+					    s->name);
 			continue;
 		}
 		if (exp->module == mod) {
-			error("\"%s\" [%s.ko] was exported without definition\n",
-			      s->name, mod->name);
+			mod_error(mod, "symbol '%s' was exported without definition\n", s->name);
 			continue;
 		}
 
@@ -1798,15 +1796,15 @@ static void check_exports(struct module *mod)
 
 		if (!verify_module_namespace(exp->namespace, basename) &&
 		    !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
-			modpost_log(!allow_missing_ns_imports, NULL,
-				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
-				    basename, exp->name, exp->namespace);
+			modpost_log(!allow_missing_ns_imports, mod,
+				    "module uses symbol '%s' from namespace '%s', but does not import it.\n",
+				    exp->name, exp->namespace);
 			add_namespace(&mod->missing_namespaces, exp->namespace);
 		}
 
 		if (!mod->is_gpl_compatible && exp->is_gpl_only)
-			error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
-			      basename, exp->name);
+			mod_error(mod, "GPL-incompatible module uses GPL-only symbol '%s'\n",
+				  exp->name);
 	}
 }
 
@@ -1856,7 +1854,7 @@ static void check_modname_len(struct module *mod)
 	mod_name = get_basename(mod->name);
 
 	if (strlen(mod_name) >= MODULE_NAME_LEN)
-		error("module name is too long [%s.ko]\n", mod->name);
+		mod_error(mod, "module name is too long\n");
 }
 
 /**
@@ -1920,10 +1918,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 			continue;
 
 		if (!sym->crc_valid)
-			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
-			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
-			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
-			     sym->name);
+			mod_warn(mod, "EXPORT symbol '%s' version generation failed, symbol will not be versioned.\n"
+				 "Is '%s' prototyped in <asm/asm-prototypes.h>?\n",
+				 sym->name, sym->name);
 
 		buf_printf(buf, "SYMBOL_CRC(%s, 0x%08x);\n",
 			   sym->name, sym->crc);
@@ -1947,8 +1944,7 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 		if (!s->module)
 			continue;
 		if (!s->crc_valid) {
-			warn("\"%s\" [%s.ko] has no CRC!\n",
-				s->name, mod->name);
+			mod_warn(mod, "symbol '%s' has no CRC!\n", s->name);
 			continue;
 		}
 		buf_printf(b, "\t0x%08x,\n", s->crc);
@@ -1991,8 +1987,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 		if (!s->module)
 			continue;
 		if (!s->crc_valid) {
-			warn("\"%s\" [%s.ko] has no CRC!\n",
-				s->name, mod->name);
+			mod_warn(mod, "symbol '%s' has no CRC!\n", s->name);
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
@@ -2000,8 +1995,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 				/* this symbol will only be in the extended info */
 				continue;
 			} else {
-				error("too long symbol \"%s\" [%s.ko]\n",
-				      s->name, mod->name);
+				mod_error(mod, "too long symbol '%s'\n", s->name);
 				break;
 			}
 		}
-- 
2.47.3

