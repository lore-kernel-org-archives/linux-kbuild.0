Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1187AC77B7D
	for <linux-kbuild@archiver.kernel.org>; Sat, 13 May 2023 20:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbjEMUqv (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 13 May 2023 16:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235216AbjEMUqY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 May 2023 16:46:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E975E40E0;
        Sat, 13 May 2023 13:45:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 898BD6155A;
        Sat, 13 May 2023 20:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4977BC433EF;
        Sat, 13 May 2023 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684010754;
        bh=DvdVfAKnanHZ8UuJBo8G0GRNrJqDAWstHDdmPsX2tkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sfz65KHqNCCPriS0J8mwOSyLyLUbt5L3BS4+WYiriGSVGQii5+LXrKYgXIl+PTwk6
         S4KbGS3fbc8ql2g9L9plFn7C+dorOeqOUdjN+9iDIQC7Ldaqikmkayu0O2SFSF7gnf
         LKj++OTqxXbSrIMFIg7+CsYhQNASNnxwoqd9wzqUUePxcbqhR4Cpt7Jl3WYc/FSpIv
         pns2Sn5VLVBwJ21mFI5zc2+3HqKtrUCCB7DKaqCMAg8Cd67ua/dQuCf6YmmBPNNr4z
         dyZaK/15N7VajGCX2HjbH+J16+DH8r/GK2Q2nomGS6LevesLTmsqlZmYBdPy1wh3gG
         7CQ1mYjxD9EAw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <npitre@baylibre.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v4 19/21] modpost: squash sym_update_namespace() into sym_add_exported()
Date:   Sun, 14 May 2023 05:45:00 +0900
Message-Id: <20230513204502.1593923-20-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230513204502.1593923-1-masahiroy@kernel.org>
References: <20230513204502.1593923-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Pass a set of the name, license, and namespace to sym_add_exported().

sym_update_namespace() is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

 scripts/mod/modpost.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3e956013a6c8..7de6548103d9 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -353,26 +353,8 @@ static const char *sec_name(const struct elf_info *info, unsigned int secindex)
 
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 
-static void sym_update_namespace(const char *symname, const char *namespace)
-{
-	struct symbol *s = find_symbol(symname);
-
-	/*
-	 * That symbol should have been created earlier and thus this is
-	 * actually an assertion.
-	 */
-	if (!s) {
-		error("Could not update namespace(%s) for symbol %s\n",
-		      namespace, symname);
-		return;
-	}
-
-	free(s->namespace);
-	s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
-}
-
 static struct symbol *sym_add_exported(const char *name, struct module *mod,
-				       bool gpl_only)
+				       bool gpl_only, const char *namespace)
 {
 	struct symbol *s = find_symbol(name);
 
@@ -385,6 +367,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	s = alloc_symbol(name);
 	s->module = mod;
 	s->is_gpl_only = gpl_only;
+	s->namespace = namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
 	list_add_tail(&s->list, &mod->exported_symbols);
 	hash_add_symbol(s);
 
@@ -1242,8 +1225,7 @@ static void check_export_symbol(struct module *mod, struct elf_info *elf,
 		return;
 	}
 
-	s = sym_add_exported(name, mod, is_gpl);
-	sym_update_namespace(name, sym_get_data(elf, label));
+	s = sym_add_exported(name, mod, is_gpl, sym_get_data(elf, label));
 
 	/*
 	 * We need to be aware whether we are exporting a function or
@@ -2112,9 +2094,8 @@ static void read_dump(const char *fname)
 			mod = new_module(modname, strlen(modname));
 			mod->from_dump = true;
 		}
-		s = sym_add_exported(symname, mod, gpl_only);
+		s = sym_add_exported(symname, mod, gpl_only, namespace);
 		sym_set_crc(s, crc);
-		sym_update_namespace(symname, namespace);
 	}
 	free(buf);
 	return;
-- 
2.39.2

