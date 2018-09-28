Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:60507 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbeI1MpZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 08:45:25 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] modpost: remove leftover symbol prefix handling for module device table
Date: Fri, 28 Sep 2018 15:21:55 +0900
Message-Id: <1538115715-10078-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rusty Russell <rusty@rustcorp.com.au>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

Blackfin and metag were the only architectures that prefix symbols with
an underscore.  They were removed by commit 4ba66a976072 ("arch: remove
blackfin port"), commit bb6fb6dfcc17 ("metag: Remove arch/metag/"),
respectively.

It is no longer necessary to handle <prefix> part of module device
table symbols.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/file2alias.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 7be4369..ba4ebc4 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1415,11 +1415,10 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
 		return;
 
-	/* All our symbols are of form <prefix>__mod_<name>__<identifier>_device_table. */
-	name = strstr(symname, "__mod_");
-	if (!name)
+	/* All our symbols are of form __mod_<name>__<identifier>_device_table. */
+	if (strncmp(symname, "__mod_", strlen("__mod_")))
 		return;
-	name += strlen("__mod_");
+	name = symname + strlen("__mod_");
 	namelen = strlen(name);
 	if (namelen < strlen("_device_table"))
 		return;
-- 
2.7.4
