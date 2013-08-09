Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:60444 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030857Ab3HITpe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 15:45:34 -0400
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] Handle non ABS crc symbols
Date: Fri,  9 Aug 2013 12:45:24 -0700
Message-Id: <1376077524-27573-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

For some reason I managed to trick gcc into create CRC symbols that
are not absolute anymore, but weak.

Make modpost handle this case.

Andrew, this should fix the bizarre warning. Seems like a toolchain
bug to me.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/mod/modpost.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6216434..b3dd735 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -599,18 +599,17 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
 
+	/* CRC'd symbol */
+	if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
+		crc = (unsigned int) sym->st_value;
+		sym_update_crc(symname + strlen(CRC_PFX), mod, crc,
+				export);
+	}
+
 	switch (sym->st_shndx) {
 	case SHN_COMMON:
 		warn("\"%s\" [%s] is COMMON symbol\n", symname, mod->name);
 		break;
-	case SHN_ABS:
-		/* CRC'd symbol */
-		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
-			crc = (unsigned int) sym->st_value;
-			sym_update_crc(symname + strlen(CRC_PFX), mod, crc,
-					export);
-		}
-		break;
 	case SHN_UNDEF:
 		/* undefined symbol */
 		if (ELF_ST_BIND(sym->st_info) != STB_GLOBAL &&
-- 
1.8.3.1

