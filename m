Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:38331 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755750AbaBROZN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Feb 2014 09:25:13 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 3/6] kbuild: Don't include const variable in kallsyms with !KALLSYMS_ALL
Date: Tue, 18 Feb 2014 15:24:27 +0100
Message-Id: <1392733470-8228-4-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392733470-8228-1-git-send-email-andi@firstfloor.org>
References: <1392733470-8228-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: sam@ravnborg.org, x86@kernel.org, linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

const variables are put into the text segment, so !KALLSYMS_ALL
includes them into the kallsyms section. Remove them to make
the kallsyms smaller. This also avoids some problems with LTO.
The way LTO generates the first pass kallsyms cannot handle
variables currently, so if we don't filter them out the
first and second level pass differ too much.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/kallsyms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ceef756..d79027e 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -151,6 +151,11 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	/* exclude debugging symbols */
 	else if (stype == 'N')
 		return -1;
+	/* Don't include const symbols in the text section
+	 * unless --all-symbols is specified.
+	 */
+	else if (toupper(stype) != 'T' && !all_symbols)
+		return -1;
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
1.8.5.2

