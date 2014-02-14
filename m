Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:39538 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752779AbaBNVSC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:18:02 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 6/6] kbuild: Remove .dot postfixes in kallsyms
Date: Fri, 14 Feb 2014 22:17:09 +0100
Message-Id: <1392412629-25666-7-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392412629-25666-1-git-send-email-andi@firstfloor.org>
References: <1392412629-25666-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

For static and some LTO symbols gcc generates .XXXX postfixes.
Remove those from the kallsyms, as they are not useful to the user
and makes it much larger. This also avoids some issues with LTO.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/kallsyms.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 566e53e..94e0502 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -122,7 +122,7 @@ static int read_symbol_tr(const char *sym, unsigned long long addr)
 static int read_symbol(FILE *in, struct sym_entry *s)
 {
 	char str[500];
-	char *sym, stype;
+	char *sym, stype, *dot;
 	int rc;
 
 	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, str);
@@ -138,6 +138,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 		return -1;
 	}
 
+	/* Drop static .XXXX postfixes */
+	dot = strchr(str, '.');
+	if (dot)
+		*dot = 0;
+
 	sym = str;
 	/* skip prefix char */
 	if (symbol_prefix_char && str[0] == symbol_prefix_char)
-- 
1.8.5.2

