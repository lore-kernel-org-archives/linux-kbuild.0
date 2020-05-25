Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:62120 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388743AbgEYFr1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 May 2020 01:47:27 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] modpost: refactor sech_name()
Date: Mon, 25 May 2020 14:47:05 +0900
Message-Id: <20200525054705.1066033-2-masahiroy@kernel.org>
In-Reply-To: <20200525054705.1066033-1-masahiroy@kernel.org>
References: <20200525054705.1066033-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Use sym_get_data_offset() helper to get access to the .shstrtab
section data. No functional change is intended because
elf->sechdrs[elf->secindex_strings].sh_addr is 0 for both ET_REL
and ET_EXEC object types.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a8306adb3554..a5f3908bc9e4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -333,18 +333,6 @@ static enum export export_no(const char *s)
 	return export_unknown;
 }
 
-static const char *sech_name(struct elf_info *elf, Elf_Shdr *sechdr)
-{
-	return (void *)elf->hdr +
-		elf->sechdrs[elf->secindex_strings].sh_offset +
-		sechdr->sh_name;
-}
-
-static const char *sec_name(struct elf_info *elf, int secindex)
-{
-	return sech_name(elf, &elf->sechdrs[secindex]);
-}
-
 static void *sym_get_data_offset(const struct elf_info *info,
 				 unsigned int secindex, unsigned long offset)
 {
@@ -362,6 +350,16 @@ static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
 				   sym->st_value);
 }
 
+static const char *sech_name(struct elf_info *elf, Elf_Shdr *sechdr)
+{
+	return sym_get_data_offset(elf, elf->secindex_strings, sechdr->sh_name);
+}
+
+static const char *sec_name(struct elf_info *elf, int secindex)
+{
+	return sech_name(elf, &elf->sechdrs[secindex]);
+}
+
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 
 static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
-- 
2.25.1
