Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:38604 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753184AbaBNVW2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Feb 2014 16:22:28 -0500
From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH 08/19] Kbuild, lto, workaround: Don't warn for initcall_reference in modpost
Date: Fri, 14 Feb 2014 22:21:32 +0100
Message-Id: <1392412903-25733-9-git-send-email-andi@firstfloor.org>
In-Reply-To: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
References: <1392412903-25733-1-git-send-email-andi@firstfloor.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

From: Andi Kleen <ak@linux.intel.com>

This reference is discarded, but can cause warnings when it refers to
exit. Ignore for now.

This is a workaround and can be removed once we get rid of
-fno-toplevel-reorder

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4061098..1f1b154 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1455,6 +1455,10 @@ static void check_section_mismatch(const char *modname, struct elf_info *elf,
 		to = find_elf_symbol(elf, r->r_addend, sym);
 		tosym = sym_name(elf, to);
 
+		if (!strncmp(fromsym, "reference___initcall",
+				sizeof("reference___initcall")-1))
+			return;
+
 		/* check whitelist - we may ignore it */
 		if (secref_whitelist(mismatch,
 					fromsec, fromsym, tosec, tosym)) {
-- 
1.8.5.2

