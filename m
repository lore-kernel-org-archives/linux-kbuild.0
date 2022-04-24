Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55059C433EF
	for <linux-kbuild@archiver.kernel.org>; Sun, 24 Apr 2022 19:11:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbiDXTO1 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 24 Apr 2022 15:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbiDXTOE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Apr 2022 15:14:04 -0400
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A22C11A11;
        Sun, 24 Apr 2022 12:10:13 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 23OJ8o5x019069;
        Mon, 25 Apr 2022 04:08:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 23OJ8o5x019069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1650827334;
        bh=3FuJQju7umNYHutcCZoPCrPj2JoGYzxaOkA3W7xiJwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QBbSkHXE9hHDGIE3vE9IEWUYXSljW8NlxYKx0tkUAtHnnP8eUEcCP/x7IJqa9o4iY
         ZQfwMdH2fqD5j2GeYK6n5/js389xm7CAq6Mhs+Du2KfOmqPIUev6UnD/8fkCPtsRnt
         96IfBUbGEr+oOzVmrKclWy7lmRz58QCVniy1Mn1BUJkti9fVwmEGQVWNTC2N7HE/XT
         XpyJcsLKkjQg+iBP+edr73E3prUiQ+AtVE7xbo7qyxKxcIgCEOT+6bcTbKFENvyQjd
         PGcQdf+d8WKXhrHLgM0yvqUCbhpvXZun4mJaN7gmbpcnaH0tdfZ0D0fVpSFtp0wmIR
         LNb143lQAdJXQ==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 05/27] modpost: retrieve the module dependency and CRCs in check_exports()
Date:   Mon, 25 Apr 2022 04:07:49 +0900
Message-Id: <20220424190811.1678416-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424190811.1678416-1-masahiroy@kernel.org>
References: <20220424190811.1678416-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Do not repeat the similar code.

It is simpler to do this in check_exports() instead of add_versions().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 969a081dba62..f9cbb6b6b7a5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2159,6 +2159,11 @@ static void check_exports(struct module *mod)
 			      s->name, mod->name);
 			continue;
 		}
+
+		s->module = exp->module;
+		s->crc_valid = exp->crc_valid;
+		s->crc = exp->crc;
+
 		basename = strrchr(mod->name, '/');
 		if (basename)
 			basename++;
@@ -2251,16 +2256,7 @@ static void add_staging_flag(struct buffer *b, const char *name)
  **/
 static void add_versions(struct buffer *b, struct module *mod)
 {
-	struct symbol *s, *exp;
-
-	for (s = mod->unres; s; s = s->next) {
-		exp = find_symbol(s->name);
-		if (!exp || exp->module == mod)
-			continue;
-		s->module = exp->module;
-		s->crc_valid = exp->crc_valid;
-		s->crc = exp->crc;
-	}
+	struct symbol *s;
 
 	if (!modversions)
 		return;
-- 
2.32.0

