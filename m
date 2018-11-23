Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:55964 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390083AbeKWSk5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Nov 2018 13:40:57 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] modpost: merge module iterations
Date: Fri, 23 Nov 2018 16:57:22 +0900
Message-Id: <1542959843-16145-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
References: <1542959843-16145-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Leonardo Bras <leobras.c@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Probably, this is just a matter of the order of error/warning
messages. Merge the two for-loops.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 39432c2..05e41eb 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2484,12 +2484,6 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
-	for (mod = modules; mod; mod = mod->next) {
-		if (mod->skip)
-			continue;
-		check_exports(mod);
-	}
-
 	err = 0;
 
 	for (mod = modules; mod; mod = mod->next) {
@@ -2501,6 +2495,7 @@ int main(int argc, char **argv)
 		buf.pos = 0;
 
 		err |= check_modname_len(mod);
+		check_exports(mod);
 		add_header(&buf, mod);
 		add_intree_flag(&buf, !external_module);
 		add_retpoline(&buf);
-- 
2.7.4
