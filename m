Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:55321 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753701AbdJHRMR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2017 13:12:17 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH 2/6] kconfig: Don't leak 'source' filenames during parsing
Date: Sun,  8 Oct 2017 19:11:19 +0200
Message-Id: <1507482683-22651-3-git-send-email-ulfalizer@gmail.com>
In-Reply-To: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
References: <1507482683-22651-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: sam@ravnborg.org, zippel@linux-m68k.org, nicolas.pitre@linaro.org, michal.lkml@markovi.net, dirk@gouders.net, yamada.masahiro@socionext.com, lacombar@gmail.com, walch.martin@web.de, JBeulich@suse.com, linux-kernel@vger.kernel.org, Ulf Magnusson <ulfalizer@gmail.com>

The 'source_stmt' nonterminal takes a 'prompt', which consists of either
a T_WORD or a T_WORD_QUOTE, both of which are always allocated on the
heap in zconf.l and need to have their associated strings freed. Free
them.

The existing code already makes sure to always copy the string, but add
a warning to sym_expand_string_value() to make it clear that the string
must be copied, just in case.

Summary from Valgrind on 'menuconfig' (ARCH=x86) before the fix:

	LEAK SUMMARY:
	   definitely lost: 387,504 bytes in 15,545 blocks
	   ...

Summary after the fix:

	LEAK SUMMARY:
	   definitely lost: 344,616 bytes in 14,355 blocks
	   ...

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/symbol.c | 5 +++++
 scripts/kconfig/zconf.y  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 20136ff..4fb0e43 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -907,6 +907,11 @@ const char *sym_expand_string_value(const char *in)
 	char *res;
 	size_t reslen;
 
+	/*
+	 * Note: 'in' might come from a token that's about to be
+	 * freed, so make sure to always allocate a new string
+	 */
+
 	reslen = strlen(in) + 1;
 	res = xmalloc(reslen);
 	res[0] = '\0';
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index f201241..a770117 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -393,6 +393,7 @@ source_stmt: T_SOURCE prompt T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
 	zconf_nextfile($2);
+	free($2);
 };
 
 /* comment entry */
-- 
2.7.4

