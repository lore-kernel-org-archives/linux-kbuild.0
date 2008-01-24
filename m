Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42783 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758795AbYAXWDt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:49 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 15/77] kbuild: fix format string warnings in modpost
Date: Thu, 24 Jan 2008 23:02:56 +0100
Message-Id: <1201212238-4369-15-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <ak@suse.de>, Sam Ravnborg <sam@ravnborg.org>

From: Andi Kleen <ak@suse.de>

Fix wrong format strings in modpost exposed by the previous patch.
Including one missing argument -- some random data was printed instead.
Signed-off-by: Andi Kleen <ak@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mod/modpost.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3a12c22..404ee0d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -388,7 +388,7 @@ static int parse_elf(struct elf_info *info, const char *filename)
 
 	/* Check if file offset is correct */
 	if (hdr->e_shoff > info->size) {
-		fatal("section header offset=%u in file '%s' is bigger then filesize=%lu\n", hdr->e_shoff, filename, info->size);
+		fatal("section header offset=%lu in file '%s' is bigger then filesize=%lu\n", (unsigned long)hdr->e_shoff, filename, info->size);
 		return 0;
 	}
 
@@ -409,7 +409,7 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		const char *secname;
 
 		if (sechdrs[i].sh_offset > info->size) {
-			fatal("%s is truncated. sechdrs[i].sh_offset=%u > sizeof(*hrd)=%ul\n", filename, (unsigned int)sechdrs[i].sh_offset, sizeof(*hdr));
+			fatal("%s is truncated. sechdrs[i].sh_offset=%lu > sizeof(*hrd)=%lu\n", filename, (unsigned long)sechdrs[i].sh_offset, sizeof(*hdr));
 			return 0;
 		}
 		secname = secstrings + sechdrs[i].sh_name;
@@ -907,7 +907,8 @@ static void warn_sec_mismatch(const char *modname, const char *fromsec,
 		     "before '%s' (at offset -0x%llx)\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
 		     secname, refsymname,
-		     elf->strtab + after->st_name);
+		     elf->strtab + after->st_name,
+		     (unsigned long long)r.r_offset);
 	} else {
 		warn("%s(%s+0x%llx): Section mismatch: reference to %s:%s\n",
 		     modname, fromsec, (unsigned long long)r.r_offset,
-- 
1.5.4.rc3.14.g44397

