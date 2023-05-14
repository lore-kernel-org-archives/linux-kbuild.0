Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDACFC7EE24
	for <linux-kbuild@archiver.kernel.org>; Sun, 14 May 2023 15:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237652AbjENP2B (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 14 May 2023 11:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237280AbjENP15 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 May 2023 11:27:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8F12699;
        Sun, 14 May 2023 08:27:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8CC360C13;
        Sun, 14 May 2023 15:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8438FC4339B;
        Sun, 14 May 2023 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684078075;
        bh=MgXAugWg05JpajxGCkES+KuPc7L8WPiutMpYWSE6mLs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LyOKbocgjhgQArA7TMLiRD7kcV1GFtfwYotJK3pbrGbhhBlg9ssXlcvkuwp+j5rPE
         y0wLLuUaHHhVni+ax1IvB/8LIzOBeOT4B8L+TBClBaFRIlBmH0keevQ+KsDC+zYm8t
         TdX9AQmVbBU7qME7C/SXBE8bXWN/6uIIp+4JG3y7sC4BeA6r90eTz4+YxJr+0aw3+k
         1aSkWzV5iOu61c2QwkG4DdizYuFw9Nnl5ATb21MumCELBtqOzFjpEE/1NfciybLGYP
         LJC1NXHXk0XBpMBjIXdLF5/dZ6WjUoee3EgBGrwNQCmT0NlW806HrChhGAnTN0KvxI
         r5llPFNy0ChoQ==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <npitre@baylibre.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v5 04/21] modpost: squash report_extable_warnings() into extable_mismatch_handler()
Date:   Mon, 15 May 2023 00:27:22 +0900
Message-Id: <20230514152739.962109-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230514152739.962109-1-masahiroy@kernel.org>
References: <20230514152739.962109-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Collect relevant code into one place to clarify all the cases are
covered by 'if () ... else if ... else ...'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 371891d67175..7a9a3ef8ca0d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1275,40 +1275,19 @@ static int is_executable_section(struct elf_info* elf, unsigned int section_inde
 	return ((elf->sechdrs[section_index].sh_flags & SHF_EXECINSTR) == SHF_EXECINSTR);
 }
 
-static void report_extable_warnings(const char* modname, struct elf_info* elf,
-				    const struct sectioncheck* const mismatch,
-				    Elf_Rela* r, Elf_Sym* sym,
-				    const char* fromsec, const char* tosec)
-{
-	Elf_Sym* tosym = find_elf_symbol(elf, r->r_addend, sym);
-	const char* tosym_name = sym_name(elf, tosym);
-
-	warn("%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n",
-	     modname, fromsec, (long)r->r_offset, tosec, tosym_name);
-
-	if (!match(tosec, mismatch->bad_tosec) &&
-	    is_executable_section(elf, get_secindex(elf, sym)))
-		fprintf(stderr,
-			"The relocation at %s+0x%lx references\n"
-			"section \"%s\" which is not in the list of\n"
-			"authorized sections.  If you're adding a new section\n"
-			"and/or if this reference is valid, add \"%s\" to the\n"
-			"list of authorized sections to jump to on fault.\n"
-			"This can be achieved by adding \"%s\" to \n"
-			"OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.\n",
-			fromsec, (long)r->r_offset, tosec, tosec, tosec);
-}
-
 static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
 				     const struct sectioncheck* const mismatch,
 				     Elf_Rela* r, Elf_Sym* sym,
 				     const char *fromsec)
 {
 	const char* tosec = sec_name(elf, get_secindex(elf, sym));
+	Elf_Sym *tosym = find_elf_symbol(elf, r->r_addend, sym);
+	const char *tosym_name = sym_name(elf, tosym);
 
 	sec_mismatch_count++;
 
-	report_extable_warnings(modname, elf, mismatch, r, sym, fromsec, tosec);
+	warn("%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n",
+	     modname, fromsec, (long)r->r_offset, tosec, tosym_name);
 
 	if (match(tosec, mismatch->bad_tosec))
 		fatal("The relocation at %s+0x%lx references\n"
@@ -1317,7 +1296,16 @@ static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
 		      "You might get more information about where this is\n"
 		      "coming from by using scripts/check_extable.sh %s\n",
 		      fromsec, (long)r->r_offset, tosec, modname);
-	else if (!is_executable_section(elf, get_secindex(elf, sym)))
+	else if (is_executable_section(elf, get_secindex(elf, sym)))
+		warn("The relocation at %s+0x%lx references\n"
+		     "section \"%s\" which is not in the list of\n"
+		     "authorized sections.  If you're adding a new section\n"
+		     "and/or if this reference is valid, add \"%s\" to the\n"
+		     "list of authorized sections to jump to on fault.\n"
+		     "This can be achieved by adding \"%s\" to\n"
+		     "OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.\n",
+		     fromsec, (long)r->r_offset, tosec, tosec, tosec);
+	else
 		error("%s+0x%lx references non-executable section '%s'\n",
 		      fromsec, (long)r->r_offset, tosec);
 }
-- 
2.39.2

