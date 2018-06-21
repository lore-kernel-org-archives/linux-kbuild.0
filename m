Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:55536 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932755AbeFUNbU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jun 2018 09:31:20 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH] kconfig: fix line numbers for if-entries in menu tree
Date: Thu, 21 Jun 2018 15:30:54 +0200
Message-Id: <20180621133054.21090-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dirk Gouders <dirk@gouders.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

The line numers for if-entries in the menu tree are off by one or more
lines which is confusing when debugging for correctness of unrelated changes.

According to the git log, commit a02f0570ae201c49 (kconfig: improve
error handling in the parser) was the last one that changed that part
of the parser and replaced

	"if_entry: T_IF expr T_EOL"
by
	"if_entry: T_IF expr nl"

but the commit message does not state why this has been done.

When reverting that part of the commit, only the line numers are
corrected (checked with cdebug = DEBUG_PARSE in zconf.y), otherwise
the menu tree remains unchanged (checked with zconfdump() enabled in
conf.c).

An example for the corrected line numbers:

drivers/soc/Kconfig:15:source drivers/soc/tegra/Kconfig
drivers/soc/tegra/Kconfig:4:if
drivers/soc/tegra/Kconfig:6:if

changes to:

drivers/soc/Kconfig:15:source drivers/soc/tegra/Kconfig
drivers/soc/tegra/Kconfig:1:if
drivers/soc/tegra/Kconfig:4:if

Signed-off-by: Dirk Gouders <dirk@gouders.net>

---
 scripts/kconfig/zconf.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 6f9b0aa32a82..ed84d4a8e288 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 32
+%expect 31
 
 %union
 {
@@ -337,7 +337,7 @@ choice_block:
 
 /* if entry */
 
-if_entry: T_IF expr nl
+if_entry: T_IF expr T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
 	menu_add_entry(NULL);
-- 
2.13.6

