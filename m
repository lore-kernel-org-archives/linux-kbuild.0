Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fallback-out1.mxes.net ([216.86.168.180]:64328 "EHLO
	fallback-in1.mxes.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755788AbZKCKLe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2009 05:11:34 -0500
Received: from mxout-08.mxes.net (mxout-08.mxes.net [216.86.168.183])
	by fallback-in1.mxes.net (Postfix) with ESMTP id 3449E864EE
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2009 05:10:07 -0500 (EST)
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Subject: [PATCH 10/10] module: fix is_exported() to return true for all types of exports
Date: Tue,  3 Nov 2009 10:06:22 +0000
Message-Id: <1257242782-10496-11-git-send-email-alan-jenkins@tuffmail.co.uk>
In-Reply-To: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: greg@kroah.com
Cc: linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au, Alan Jenkins <alan-jenkins@tuffmail.co.uk>

/proc/kallsyms annotates module symbols as global (e.g. 'D' for a data
symbol) or local (e.g. 'd'), depending on whether is_exported() returns
true or false.

Historically, is_exported() only returns true if the symbol was exported
using EXPORT_SYMBOL(). EXPORT_SYMBOL_UNUSED(), for example, is not taken
into account. This looks like an oversight, so let's fix it.

Signed-off-by: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
---
 kernel/module.c |   30 ++++++++----------------------
 1 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index 122c10d..617e1f2 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1838,33 +1838,19 @@ static void free_modinfo(struct module *mod)
 
 #ifdef CONFIG_KALLSYMS
 
-/* lookup symbol in given range of kernel_symbols */
-static const struct kernel_symbol *lookup_symbol(const char *name,
-	const struct kernel_symbol *syms,
-	unsigned int count)
-{
-	unsigned int i;
-
-	for (i = 0; i < count; i++)
-		if (strcmp(syms[i].name, name) == 0)
-			return &syms[i];
-	return NULL;
-}
-
 static int is_exported(const char *name, unsigned long value,
-		       const struct module *mod)
+		       struct module *mod)
 {
-	const struct ksymtab *symtab;
-	const struct kernel_symbol *ks;
+	const struct kernel_symbol *sym;
+	enum export_type type;
+	const unsigned long *crc;
 
-	if (!mod)
-		symtab = &ksymtab[EXPORT_TYPE_PLAIN];
+	if (mod)
+		sym = find_symbol_in_module(mod, name, &type, &crc);
 	else
-		symtab = &mod->syms[EXPORT_TYPE_PLAIN];
-
-	ks = lookup_symbol(name, symtab->syms, symtab->num_syms);
+		sym = find_symbol_in_kernel(name, &type, &crc);
 
-	return ks != NULL && ks->value == value;
+	return (sym && sym->value == value);
 }
 
 /* As per nm */
-- 
1.6.3.2

