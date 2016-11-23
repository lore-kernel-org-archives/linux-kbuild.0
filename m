Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35184 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934451AbcKWQmU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2016 11:42:20 -0500
Received: by mail-pg0-f68.google.com with SMTP id p66so1430825pga.2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2016 08:42:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 6/7] kbuild: modpost warn if export version crc is missing
Date: Thu, 24 Nov 2016 03:41:42 +1100
Message-Id: <20161123164143.16839-7-npiggin@gmail.com>
In-Reply-To: <20161123164143.16839-1-npiggin@gmail.com>
References: <20161123164143.16839-1-npiggin@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org

This catches the failing ceph CRC on with:

    LD      vmlinux.o
    MODPOST vmlinux.o
  WARNING: EXPORT symbol "ceph_monc_do_statfs" [vmlinux] version
  generation failed, symbol will not be versioned.

When the modules referring to exported symbols are built, there is an
existing warning for missing CRC, but it's not always the case such
any such module will be built, and in any case it is useful to get a
warning at the source.

This gets a little verbose with CONFIG_DEBUG_SECTION_MISMATCH,
producing a warning with each object linked, but I didn't think
that warranted extra complexity to avoid.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/mod/modpost.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bd83497..08f62a1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -609,6 +609,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 {
 	unsigned int crc;
 	enum export export;
+	bool is_crc = false;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
 	    strncmp(symname, "__ksymtab", 9) == 0)
@@ -618,6 +619,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 
 	/* CRC'd symbol */
 	if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
+		is_crc = true;
 		crc = (unsigned int) sym->st_value;
 		sym_update_crc(symname + strlen(CRC_PFX), mod, crc,
 				export);
@@ -663,6 +665,10 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		else
 			symname++;
 #endif
+		if (is_crc) {
+			const char *e = is_vmlinux(mod->name) ?"":".ko";
+			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n", symname + strlen(CRC_PFX), mod->name, e);
+		}
 		mod->unres = alloc_symbol(symname,
 					  ELF_ST_BIND(sym->st_info) == STB_WEAK,
 					  mod->unres);
-- 
2.10.2

