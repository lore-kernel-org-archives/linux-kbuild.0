Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48531 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752394Ab0IKPyF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Sep 2010 11:54:05 -0400
Received: by mail-gy0-f174.google.com with SMTP id 8so1615205gyd.19
        for <linux-kbuild@vger.kernel.org>; Sat, 11 Sep 2010 08:54:04 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 08/15] kconfig: expand by default the rootmenu's prompt
Date: Sat, 11 Sep 2010 11:51:15 -0400
Message-Id: <1284220282-3500-9-git-send-email-lacombar@gmail.com>
In-Reply-To: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
References: <1284220282-3500-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/zconf.y |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index e9b14efd..c95e67e 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -502,6 +502,10 @@ void conf_parse(const char *name)
 		prop = prop_alloc(P_DEFAULT, modules_sym);
 		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
 	}
+
+	rootmenu.prompt->text = strdup(_(rootmenu.prompt->text));
+	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-- 
1.7.2.30.gc37d7.dirty

