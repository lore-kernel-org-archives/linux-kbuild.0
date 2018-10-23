Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:36663 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbeJXGlC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 02:41:02 -0400
Received: by mail-pg1-f201.google.com with SMTP id a13-v6so1492332pgw.3
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Oct 2018 15:15:42 -0700 (PDT)
Date: Tue, 23 Oct 2018 15:15:35 -0700
Message-Id: <20181023221535.4740-1-samitolvanen@google.com>
Mime-Version: 1.0
Subject: [PATCH] modpost: validate symbol names also in find_elf_symbol
From: Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>

If an ARM mapping symbol shares an address with a valid symbol,
find_elf_symbol can currently return the mapping symbol instead, as the
symbol is not validated. This can result in confusing warnings:

  WARNING: vmlinux.o(.text+0x18f4028): Section mismatch in reference
  from the function set_reset_devices() to the variable .init.text:$x.0

This change adds a call to is_valid_name to find_elf_symbol, similarly
to how it's already used in find_elf_symbol2.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/mod/modpost.c | 50 ++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0d998c54564d..b709b2e623d6 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1204,6 +1204,30 @@ static int secref_whitelist(const struct sectioncheck *mismatch,
 	return 1;
 }
 
+static inline int is_arm_mapping_symbol(const char *str)
+{
+	return str[0] == '$' && strchr("axtd", str[1])
+	       && (str[2] == '\0' || str[2] == '.');
+}
+
+/*
+ * If there's no name there, ignore it; likewise, ignore it if it's
+ * one of the magic symbols emitted used by current ARM tools.
+ *
+ * Otherwise if find_symbols_between() returns those symbols, they'll
+ * fail the whitelist tests and cause lots of false alarms ... fixable
+ * only by merging __exit and __init sections into __text, bloating
+ * the kernel (which is especially evil on embedded platforms).
+ */
+static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
+{
+	const char *name = elf->strtab + sym->st_name;
+
+	if (!name || !strlen(name))
+		return 0;
+	return !is_arm_mapping_symbol(name);
+}
+
 /**
  * Find symbol based on relocation record info.
  * In some cases the symbol supplied is a valid symbol so
@@ -1229,6 +1253,8 @@ static Elf_Sym *find_elf_symbol(struct elf_info *elf, Elf64_Sword addr,
 			continue;
 		if (ELF_ST_TYPE(sym->st_info) == STT_SECTION)
 			continue;
+		if (!is_valid_name(elf, sym))
+			continue;
 		if (sym->st_value == addr)
 			return sym;
 		/* Find a symbol nearby - addr are maybe negative */
@@ -1247,30 +1273,6 @@ static Elf_Sym *find_elf_symbol(struct elf_info *elf, Elf64_Sword addr,
 		return NULL;
 }
 
-static inline int is_arm_mapping_symbol(const char *str)
-{
-	return str[0] == '$' && strchr("axtd", str[1])
-	       && (str[2] == '\0' || str[2] == '.');
-}
-
-/*
- * If there's no name there, ignore it; likewise, ignore it if it's
- * one of the magic symbols emitted used by current ARM tools.
- *
- * Otherwise if find_symbols_between() returns those symbols, they'll
- * fail the whitelist tests and cause lots of false alarms ... fixable
- * only by merging __exit and __init sections into __text, bloating
- * the kernel (which is especially evil on embedded platforms).
- */
-static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
-{
-	const char *name = elf->strtab + sym->st_name;
-
-	if (!name || !strlen(name))
-		return 0;
-	return !is_arm_mapping_symbol(name);
-}
-
 /*
  * Find symbols before or equal addr and after addr - in the section sec.
  * If we find two symbols with equal offset prefer one with a valid name.
-- 
2.19.1.568.g152ad8e336-goog
