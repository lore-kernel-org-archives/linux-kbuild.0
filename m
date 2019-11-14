Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:64706 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbfKNRmd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:33 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] modpost: rename handle_modversions() to handle_symbol()
Date: Fri, 15 Nov 2019 02:42:23 +0900
Message-Id: <20191114174226.7201-3-yamada.masahiro@socionext.com>
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This function handles not only modversions, but also unresolved
symbols, export symbols, etc.

Rename it to a more proper function name.

While I was here, I also added the 'const' qualifier to *sym.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d9418c58a8c0..6735ae3da4c2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -683,8 +683,8 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 	return 0;
 }
 
-static void handle_modversions(struct module *mod, struct elf_info *info,
-			       Elf_Sym *sym, const char *symname)
+static void handle_symbol(struct module *mod, struct elf_info *info,
+			  const Elf_Sym *sym, const char *symname)
 {
 	unsigned int crc;
 	enum export export;
@@ -2051,7 +2051,7 @@ static void read_symbols(const char *modname)
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-		handle_modversions(mod, &info, sym, symname);
+		handle_symbol(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
 
-- 
2.17.1
