Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE73C7EE24
	for <linux-kbuild@archiver.kernel.org>; Sun, 14 May 2023 15:29:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237779AbjENP3I (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 14 May 2023 11:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238019AbjENP2r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 May 2023 11:28:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801864C24;
        Sun, 14 May 2023 08:28:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F1E68617F7;
        Sun, 14 May 2023 15:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F56C43446;
        Sun, 14 May 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684078099;
        bh=jdKsO6Q+89PLiGC8ptVEMm4O+hub0pEjU43lfsgo+Gg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SIaplNVUyNoeF+hWXtsAh302Y+3QfWgpRSJH7/xDlsKOGNKP3ikW7qMEm/PAV74V5
         g/PmZEgFVowZXxJ3uTVfZHrEtK/aqGAvHoF5AusJeqV0CprPVYFv7jmRQiopBCQXGS
         RX6M4J9sWK3O8UlhPFdQHIKyqAMHMfGZ5JbXaikFjytY977Q3v3eMHcbpjXSU+ACWV
         xa8abpa6kUuoHyltOfyg/u/Av0DG8J7wJ7DqVnLqRjpywxvRyvov/exiZZIjb3E4ZK
         VSwbV1xhgpmJuJZda0PtEvlviAT9C16viTk4521WC+gg5v0d+qKEin6SqOk+Fhme8p
         zC0MhjwuSEqbQ==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <npitre@baylibre.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v5 15/21] modpost: pass struct module pointer to check_section_mismatch()
Date:   Mon, 15 May 2023 00:27:33 +0900
Message-Id: <20230514152739.962109-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230514152739.962109-1-masahiroy@kernel.org>
References: <20230514152739.962109-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The next commit will use it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 28db215ecc71..23a352f52b8f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1246,7 +1246,7 @@ static void default_mismatch_handler(const char *modname, struct elf_info *elf,
 	}
 }
 
-static void check_section_mismatch(const char *modname, struct elf_info *elf,
+static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 				   Elf_Sym *sym,
 				   unsigned int fsecndx, const char *fromsec,
 				   Elf_Addr faddr, Elf_Addr taddr)
@@ -1257,7 +1257,7 @@ static void check_section_mismatch(const char *modname, struct elf_info *elf,
 	if (!mismatch)
 		return;
 
-	default_mismatch_handler(modname, elf, mismatch, sym,
+	default_mismatch_handler(mod->name, elf, mismatch, sym,
 				 fsecndx, fromsec, faddr,
 				 tosec, taddr);
 }
@@ -1367,7 +1367,7 @@ static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
 #define R_LARCH_SUB32		55
 #endif
 
-static void section_rela(const char *modname, struct elf_info *elf,
+static void section_rela(struct module *mod, struct elf_info *elf,
 			 Elf_Shdr *sechdr)
 {
 	Elf_Rela *rela;
@@ -1413,12 +1413,12 @@ static void section_rela(const char *modname, struct elf_info *elf,
 			break;
 		}
 
-		check_section_mismatch(modname, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
 				       fsecndx, fromsec, r.r_offset, r.r_addend);
 	}
 }
 
-static void section_rel(const char *modname, struct elf_info *elf,
+static void section_rel(struct module *mod, struct elf_info *elf,
 			Elf_Shdr *sechdr)
 {
 	Elf_Rel *rel;
@@ -1468,7 +1468,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
 			fatal("Please add code to calculate addend for this architecture\n");
 		}
 
-		check_section_mismatch(modname, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
 				       fsecndx, fromsec, r.r_offset, r.r_addend);
 	}
 }
@@ -1485,19 +1485,19 @@ static void section_rel(const char *modname, struct elf_info *elf,
  * to find all references to a section that reference a section that will
  * be discarded and warns about it.
  **/
-static void check_sec_ref(const char *modname, struct elf_info *elf)
+static void check_sec_ref(struct module *mod, struct elf_info *elf)
 {
 	int i;
 	Elf_Shdr *sechdrs = elf->sechdrs;
 
 	/* Walk through all sections */
 	for (i = 0; i < elf->num_sections; i++) {
-		check_section(modname, elf, &elf->sechdrs[i]);
+		check_section(mod->name, elf, &elf->sechdrs[i]);
 		/* We want to process only relocation sections and not .init */
 		if (sechdrs[i].sh_type == SHT_RELA)
-			section_rela(modname, elf, &elf->sechdrs[i]);
+			section_rela(mod, elf, &elf->sechdrs[i]);
 		else if (sechdrs[i].sh_type == SHT_REL)
-			section_rel(modname, elf, &elf->sechdrs[i]);
+			section_rel(mod, elf, &elf->sechdrs[i]);
 	}
 }
 
@@ -1668,7 +1668,7 @@ static void read_symbols(const char *modname)
 					     sym_get_data(&info, sym));
 	}
 
-	check_sec_ref(modname, &info);
+	check_sec_ref(mod, &info);
 
 	if (!mod->is_vmlinux) {
 		version = get_modinfo(&info, "version");
-- 
2.39.2

