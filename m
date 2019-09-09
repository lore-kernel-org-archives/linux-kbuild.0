Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60119 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404103AbfIILej (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 07:34:39 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] modpost: use __section in the output to *.mod.c
Date: Mon,  9 Sep 2019 20:34:23 +0900
Message-Id: <20190909113423.2289-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190909113423.2289-1-yamada.masahiro@socionext.com>
References: <20190909113423.2289-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Use the __section() shorthand. This avoids escaping double-quotes,
and improves the readability.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 480c7b60153b..0dd1bb6f6eec 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2159,7 +2159,7 @@ static void add_header(struct buffer *b, struct module *mod)
 	buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
 	buf_printf(b, "\n");
 	buf_printf(b, "__visible struct module __this_module\n");
-	buf_printf(b, "__attribute__((section(\".gnu.linkonce.this_module\"))) = {\n");
+	buf_printf(b, "__section(.gnu.linkonce.this_module) = {\n");
 	buf_printf(b, "\t.name = KBUILD_MODNAME,\n");
 	if (mod->has_init)
 		buf_printf(b, "\t.init = init_module,\n");
@@ -2213,8 +2213,7 @@ static int add_versions(struct buffer *b, struct module *mod)
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const struct modversion_info ____versions[]\n");
-	buf_printf(b, "__used\n");
-	buf_printf(b, "__attribute__((section(\"__versions\"))) = {\n");
+	buf_printf(b, "__used __section(__versions) = {\n");
 
 	for (s = mod->unres; s; s = s->next) {
 		if (!s->module)
-- 
2.17.1
