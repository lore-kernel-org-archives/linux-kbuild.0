Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60097 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403880AbfIILeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 07:34:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] modpost: use MODULE_INFO() for __module_depends
Date: Mon,  9 Sep 2019 20:34:22 +0900
Message-Id: <20190909113423.2289-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This makes *.mod.c much more readable. I confirmed depmod still
produced the same modules.dep file.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..480c7b60153b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2250,10 +2250,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 			s->module->seen = is_vmlinux(s->module->name);
 
 	buf_printf(b, "\n");
-	buf_printf(b, "static const char __module_depends[]\n");
-	buf_printf(b, "__used\n");
-	buf_printf(b, "__attribute__((section(\".modinfo\"))) =\n");
-	buf_printf(b, "\"depends=");
+	buf_printf(b, "MODULE_INFO(depends, \"");
 	for (s = mod->unres; s; s = s->next) {
 		const char *p;
 		if (!s->module)
@@ -2271,7 +2268,7 @@ static void add_depends(struct buffer *b, struct module *mod)
 		buf_printf(b, "%s%s", first ? "" : ",", p);
 		first = 0;
 	}
-	buf_printf(b, "\";\n");
+	buf_printf(b, "\");\n");
 }
 
 static void add_srcversion(struct buffer *b, struct module *mod)
-- 
2.17.1
