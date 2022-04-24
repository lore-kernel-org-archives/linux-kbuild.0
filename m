Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1590C433FE
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Apr 2022 19:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238345AbiDXTN4 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Apr 2022 15:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238194AbiDXTNt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Apr 2022 15:13:49 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE0A6312;
        Sun, 24 Apr 2022 12:10:11 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 23OJ8o6B019069;
        Mon, 25 Apr 2022 04:09:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o6B019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1650827342;
        bh=hDR6BktulSZu4b78TIoBRF30Ps2UEltCrXSxocUzmRg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LVm7Xe+fOafT7oWkBKEXaycCYSY8xFBQZopFmDwiRUQ9o4RTsGCKA+eQASBVXOEWP
         G7RLD9RYjntFTLzqqCHc2b1vto02JskdgXVW1HEylEb2HokT2lJ9Usj3a9/++A/igq
         58yt96HRfmszdUkahvg8xcP1sBmXqkRxFaNNd7v7o/xnndYyVqzlp8lURJmuuEMtqb
         Nw38v0UT8Dbo8MM1HinsX9AES+iG2mct/1nb83gjNyD1wl3g+64Mph267Dx63ap8hH
         9mfXbh+4OHq0HjvS9JJB8w+gBM8vcWvXpiGu7YuYEVFeaxGGc9iaZn5/dj5TQ64kiy
         4GCaY/NMPhmJA==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 17/27] modpost: make sym_add_exported() always allocate a new symbol
Date:   Mon, 25 Apr 2022 04:08:01 +0900
Message-Id: <20220424190811.1678416-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424190811.1678416-1-masahiroy@kernel.org>
References: <20220424190811.1678416-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, sym_add_exported() does not allocate a symbol if the same
name symbol already exists in the hash table.

This does not reflect the real usecases. You can have an external
module override the in-tree one. In this case, the external module
will export the same name symbols as the in-tree one. However,
modpost simply ignores those symbols, then Module.symvers for the
external module miss to list its symbols.

sym_add_exported() should allocate a new symbol.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 73f0b98e3b5a..4f0b2b23516a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -406,19 +406,16 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 {
 	struct symbol *s = find_symbol(name);
 
-	if (!s) {
-		s = new_symbol(name, mod, export);
-		list_add_tail(&s->list, &mod->exported_symbols);
-	} else if (!external_module || s->module->is_vmlinux ||
-		   s->module == mod) {
+	if (s && (!external_module || s->module->is_vmlinux || s->module == mod)) {
 		error("%s: '%s' exported twice. Previous export was in %s%s\n",
 		      mod->name, name, s->module->name,
 		      s->module->is_vmlinux ? "" : ".ko");
-		return s;
 	}
 
+	s = new_symbol(name, mod, export);
 	s->module = mod;
 	s->export    = export;
+	list_add_tail(&s->list, &mod->exported_symbols);
 	return s;
 }
 
-- 
2.32.0

