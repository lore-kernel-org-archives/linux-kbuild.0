Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:21223 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754029AbeAKNj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jan 2018 08:39:56 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kconfig: make conf_unsaved a local variable of conf_read()
Date: Thu, 11 Jan 2018 22:39:41 +0900
Message-Id: <1515677981-21952-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515677981-21952-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515677981-21952-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

conf_unsaved is initialized by conf_read_simple(), but it is possible
to move it to conf_read() so that it can be a local variable.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index bc83965..dfccaab 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -28,7 +28,7 @@ static void conf_message(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 
 static const char *conf_filename;
-static int conf_lineno, conf_warnings, conf_unsaved;
+static int conf_lineno, conf_warnings;
 
 const char conf_defname[] = "arch/$ARCH/defconfig";
 
@@ -290,7 +290,6 @@ int conf_read_simple(const char *name, int def)
 	conf_filename = name;
 	conf_lineno = 0;
 	conf_warnings = 0;
-	conf_unsaved = 0;
 
 	def_flags = SYMBOL_DEF << def;
 	for_all_symbols(i, sym) {
@@ -409,6 +408,7 @@ int conf_read_simple(const char *name, int def)
 int conf_read(const char *name)
 {
 	struct symbol *sym;
+	int conf_unsaved = 0;
 	int i;
 
 	sym_set_change_count(0);
-- 
2.7.4

