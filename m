Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52513 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752656AbZLLLCm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2009 06:02:42 -0500
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH] modpost: fix segfault with short symbol names
Date: Sat, 12 Dec 2009 12:02:24 +0100
Message-Id: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kbuild@vger.kernel.org, linux-kernek@vger.kernel.org

memcmp() is wrong here, the symbol name can be shorter than KSYMTAB_PFX
or CRC_PFX.

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/mod/modpost.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 801a16a..065ee0b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -515,7 +515,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		break;
 	case SHN_ABS:
 		/* CRC'd symbol */
-		if (memcmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
+		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
 			crc = (unsigned int) sym->st_value;
 			sym_update_crc(symname + strlen(CRC_PFX), mod, crc,
 					export);
@@ -559,7 +559,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
 		break;
 	default:
 		/* All exported symbols */
-		if (memcmp(symname, KSYMTAB_PFX, strlen(KSYMTAB_PFX)) == 0) {
+		if (strncmp(symname, KSYMTAB_PFX, strlen(KSYMTAB_PFX)) == 0) {
 			sym_add_exported(symname + strlen(KSYMTAB_PFX), mod,
 					export);
 		}
-- 
1.6.5.3

