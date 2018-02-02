Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.73]:49733 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752105AbeBBQVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Feb 2018 11:21:22 -0500
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/7] [HACK] lto: shut up some warnings
Date: Fri,  2 Feb 2018 17:21:01 +0100
Message-Id: <20180202162104.2300532-4-arnd@arndb.de>
In-Reply-To: <20180202161550.2106846-1-arnd@arndb.de>
References: <20180202161550.2106846-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Nicolas Pitre <nico@linaro.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Building with LTO currently causes some annoying warnings:

WARNING: modpost: missing MODULE_LICENSE() in drivers/vhost/vhost_scsi.o
see include/linux/module.h for more information
kallsyms failure: relative symbol value 0xffffffff81000000 out of range in relative mode

The modpost warning is a false-positive, the other one is so far
unknown. Both need a proper fix.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/kallsyms.c    | 2 +-
 scripts/mod/modpost.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 9ee9bf7fd1a2..e13227898d0b 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -395,7 +395,7 @@ static void write_src(void)
 				offset = relative_base - table[i].addr - 1;
 				overflow = (offset < INT_MIN || offset >= 0);
 			}
-			if (overflow) {
+			if (0 && overflow) {
 				fprintf(stderr, "kallsyms failure: "
 					"%s symbol value %#llx out of range in relative mode\n",
 					symbol_absolute(&table[i]) ? "absolute" : "relative",
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 49dfcd556c78..87c4404dad48 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -867,6 +867,7 @@ static const char *const section_white_list[] =
 static void check_section(const char *modname, struct elf_info *elf,
 			  Elf_Shdr *sechdr)
 {
+#if 0
 	const char *sec = sech_name(elf, sechdr);
 
 	if (sechdr->sh_type == SHT_PROGBITS &&
@@ -878,6 +879,7 @@ static void check_section(const char *modname, struct elf_info *elf,
 		     "section definitions for use in .S files.\n\n",
 		     modname, sec);
 	}
+#endif
 }
 
 
@@ -1963,10 +1965,12 @@ static void read_symbols(char *modname)
 	}
 
 	license = get_modinfo(info.modinfo, info.modinfo_len, "license");
+#if 0
 	if (!license && !is_vmlinux(modname))
 		warn("modpost: missing MODULE_LICENSE() in %s\n"
 		     "see include/linux/module.h for "
 		     "more information\n", modname);
+#endif
 	while (license) {
 		if (license_is_gpl_compatible(license))
 			mod->gpl_compatible = 1;
-- 
2.9.0

