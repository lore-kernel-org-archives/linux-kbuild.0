Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f188.google.com ([209.85.210.188]:39818 "EHLO
	mail-yx0-f188.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752522Ab0AGGpn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jan 2010 01:45:43 -0500
Received: by yxe26 with SMTP id 26so17437143yxe.4
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2010 22:45:42 -0800 (PST)
From: Cheng Renquan <crquan@gmail.com>
Subject: [PATCH] kallsyms: skip kernel symbols when lookup in module
Date: Thu,  7 Jan 2010 14:43:46 +0800
Message-Id: <1262846626-27109-1-git-send-email-crquan@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

kernel symbols lookup is expensive, when we know it's a lookup in module,
we can skip the heavy kernel symbols.

Signed-off-by: Cheng Renquan <crquan@gmail.com>
---
 kernel/kallsyms.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 8e5288a..bb9fdc5 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -173,12 +173,16 @@ unsigned long kallsyms_lookup_name(const char *name)
 	unsigned long i;
 	unsigned int off;
 
-	for (i = 0, off = 0; i < kallsyms_num_syms; i++) {
-		off = kallsyms_expand_symbol(off, namebuf);
+	/* if a colon ':' found, skip the heavy kernel symbols */
+	if (strchr(name, ':') == NULL) {
+		for (i = 0, off = 0; i < kallsyms_num_syms; i++) {
+			off = kallsyms_expand_symbol(off, namebuf);
 
-		if (strcmp(namebuf, name) == 0)
-			return kallsyms_addresses[i];
+			if (strcmp(namebuf, name) == 0)
+				return kallsyms_addresses[i];
+		}
 	}
+
 	return module_kallsyms_lookup_name(name);
 }
 EXPORT_SYMBOL_GPL(kallsyms_lookup_name);
-- 
1.6.5

