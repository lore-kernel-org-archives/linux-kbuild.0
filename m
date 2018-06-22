Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:58026 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934096AbeFVTc1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 15:32:27 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 2/3] kconfig: handle P_SYMBOL in print_symbol()
Date: Fri, 22 Jun 2018 21:27:38 +0200
Message-Id: <20180622192739.5327-3-dirk@gouders.net>
In-Reply-To: <20180622192739.5327-1-dirk@gouders.net>
References: <20180622192739.5327-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Dirk Gouders <dirk@gouders.net>, Sam Ravnborg <sam@ravnborg.org>

Each symbol has a property of type P_SYMBOL since commit
59e89e3ddf8523be (kconfig: save location of config symbols).
Handle those properties in print_symbol().

Further, place a pointer to print_symbol() in the comment above the
list of known property type.

Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/kconfig/expr.h  | 3 +++
 scripts/kconfig/zconf.y | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 94a383b21df6..f63b41b0dd49 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -171,6 +171,9 @@ struct symbol {
  * config BAZ
  *         int "BAZ Value"
  *         range 1..255
+ *
+ * Please, also check zconf.y:print_symbol() when modifying the
+ * list of property types!
  */
 enum prop_type {
 	P_UNKNOWN,
diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 6f9b0aa32a82..525b82c5fb58 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -717,6 +717,10 @@ static void print_symbol(FILE *out, struct menu *menu)
 			print_quoted_string(out, prop->text);
 			fputc('\n', out);
 			break;
+		case P_SYMBOL:
+			fputs( "  symbol ", out);
+			fprintf(out, "%s\n", prop->sym->name);
+			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
 			break;
-- 
2.13.6

