Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:64767 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKNRmh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:37 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 6/6] modpost: respect the previous export when 'exported twice' is warned
Date: Fri, 15 Nov 2019 02:42:26 +0900
Message-Id: <20191114174226.7201-6-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

When 'exported twice' is warned, let sym_add_exported() return without
updating the symbol info. This respects the previous export, which is
ordered first in modules.order

This simplifies the code too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 06086105011f..d9a92fbe1146 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -211,13 +211,11 @@ static struct symbol *new_symbol(const char *name, struct module *module,
 				 enum export export)
 {
 	unsigned int hash;
-	struct symbol *new;
 
 	hash = tdb_hash(name) % SYMBOL_HASH_SIZE;
-	new = symbolhash[hash] = alloc_symbol(name, 0, symbolhash[hash]);
-	new->module = module;
-	new->export = export;
-	return new;
+	symbolhash[hash] = alloc_symbol(name, 0, symbolhash[hash]);
+
+	return symbolhash[hash];
 }
 
 static struct symbol *find_symbol(const char *name)
@@ -392,17 +390,15 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 
 	if (!s) {
 		s = new_symbol(name, mod, export);
-	} else {
-		if (!external_module || is_vmlinux(s->module->name) ||
-		    s->module == mod) {
-			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
-			     mod->name, name, s->module->name,
-			     is_vmlinux(s->module->name) ? "" : ".ko");
-		} else {
-			/* In case Module.symvers was out of date */
-			s->module = mod;
-		}
+	} else if (!external_module || is_vmlinux(s->module->name) ||
+		   s->module == mod) {
+		warn("%s: '%s' exported twice. Previous export was in %s%s\n",
+		     mod->name, name, s->module->name,
+		     is_vmlinux(s->module->name) ? "" : ".ko");
+		return s;
 	}
+
+	s->module = mod;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
 	s->export    = export;
-- 
2.17.1
