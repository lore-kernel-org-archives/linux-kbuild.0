Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41799 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750814AbbLIPGc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2015 10:06:32 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH] genksyms: Handle string literals with spaces in reference files
Date: Wed,  9 Dec 2015 16:06:15 +0100
Message-Id: <1449673575-328-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The reference files use spaces to separate tokens, however, we must
preserve spaces inside string literals. Currently the only case in the
tree is struct edac_raw_error_desc in <linux/edac.h>:

$ KBUILD_SYMTYPES=1 make -s drivers/edac/amd64_edac.symtypes
$ mv drivers/edac/amd64_edac.{symtypes,symref}
$ KBUILD_SYMTYPES=1 make -s drivers/edac/amd64_edac.symtypes
drivers/edac/amd64_edac.c:527: warning: amd64_get_dram_hole_info: modversion changed because of changes in struct edac_raw_error_desc

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/genksyms/genksyms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 88632df4381b..dafaf96e0a34 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -423,13 +423,15 @@ static struct string_list *read_node(FILE *f)
 	struct string_list node = {
 		.string = buffer,
 		.tag = SYM_NORMAL };
-	int c;
+	int c, in_string = 0;
 
 	while ((c = fgetc(f)) != EOF) {
-		if (c == ' ') {
+		if (!in_string && c == ' ') {
 			if (node.string == buffer)
 				continue;
 			break;
+		} else if (c == '"') {
+			in_string = !in_string;
 		} else if (c == '\n') {
 			if (node.string == buffer)
 				return NULL;
-- 
2.1.4

