Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42465 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbeJWJb6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Oct 2018 05:31:58 -0400
Date: Mon, 22 Oct 2018 22:10:52 -0300
From: Leonardo =?utf-8?B?QnLDoXM=?= <leobras.c@gmail.com>
Subject: [PATCH v2 4/5] modpost: Changes parameter name to avoid shadowing.
Message-ID: <20181023011052.GA6584@WindFlash>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkcamp@lists.libreplanetbr.org
Cc: Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Changes the parameter name to avoid shadowing a variable.

Signed-off-by: Leonardo Brás <leobras.c@gmail.com>
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0d998c54564d..368fe42340df 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2228,13 +2228,13 @@ static int add_versions(struct buffer *b, struct module *mod)
 }
 
 static void add_depends(struct buffer *b, struct module *mod,
-			struct module *modules)
+			struct module *module_list)
 {
 	struct symbol *s;
 	struct module *m;
 	int first = 1;
 
-	for (m = modules; m; m = m->next)
+	for (m = module_list; m; m = m->next)
 		m->seen = is_vmlinux(m->name);
 
 	buf_printf(b, "\n");
-- 
2.19.1
