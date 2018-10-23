Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35613 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJb3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:31:29 -0400
Date: Mon, 22 Oct 2018 22:10:22 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v2 1/5] x86/vdso: Renames variable to fix shadow warning.
Message-ID: <20181023011022.GA6574@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Renames the char variable to avoid shadowing a variable previously
declared on this function.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 arch/x86/entry/vdso/vdso2c.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso2c.h b/arch/x86/entry/vdso/vdso2c.h
index fa847a620f40..a20b134de2a8 100644
--- a/arch/x86/entry/vdso/vdso2c.h
+++ b/arch/x86/entry/vdso/vdso2c.h
@@ -7,7 +7,7 @@
 
 static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 			 void *stripped_addr, size_t stripped_len,
-			 FILE *outfile, const char *name)
+			 FILE *outfile, const char *image_name)
 {
 	int found_load = 0;
 	unsigned long load_size = -1;  /* Work around bogus warning */
@@ -93,11 +93,12 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		int k;
 		ELF(Sym) *sym = raw_addr + GET_LE(&symtab_hdr->sh_offset) +
 			GET_LE(&symtab_hdr->sh_entsize) * i;
-		const char *name = raw_addr + GET_LE(&strtab_hdr->sh_offset) +
-			GET_LE(&sym->st_name);
+		const char *sym_name = raw_addr +
+				       GET_LE(&strtab_hdr->sh_offset) +
+				       GET_LE(&sym->st_name);
 
 		for (k = 0; k < NSYMS; k++) {
-			if (!strcmp(name, required_syms[k].name)) {
+			if (!strcmp(sym_name, required_syms[k].name)) {
 				if (syms[k]) {
 					fail("duplicate symbol %s\n",
 					     required_syms[k].name);
@@ -134,7 +135,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 	if (syms[sym_vvar_start] % 4096)
 		fail("vvar_begin must be a multiple of 4096\n");
 
-	if (!name) {
+	if (!image_name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;
 	}
@@ -157,7 +158,7 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 	}
 	fprintf(outfile, "\n};\n\n");
 
-	fprintf(outfile, "const struct vdso_image %s = {\n", name);
+	fprintf(outfile, "const struct vdso_image %s = {\n", image_name);
 	fprintf(outfile, "\t.data = raw_data,\n");
 	fprintf(outfile, "\t.size = %lu,\n", mapping_size);
 	if (alt_sec) {
-- 
2.19.1
