Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:22638 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753547AbeAJG51 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 01:57:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/6] kconfig: call sym_calc_value() for all symbols before writing to .config
Date: Wed, 10 Jan 2018 15:56:10 +0900
Message-Id: <1515567374-12722-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Marc Herbert <marc.herbert@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

conf_write() skips sym_calc_value() for "choice", but we do not need
to do so.

conf_set_all_new_symbols() may have already called sym_calc_value()
for "choice", but set_all_choice_value() has cleared SYMBOL_VALID away.
So, conf_write() re-calculates "choice" here when calculating the
visibility of its children (choice value).

We can pass NULL to sym_calc_value() since it is no-op.

This should give no impact on behavior, but make the logic more easier
to understand.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 027f5b4..bc83965 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -790,6 +790,8 @@ int conf_write(const char *name)
 	menu = rootmenu.list;
 	while (menu) {
 		sym = menu->sym;
+		sym_calc_value(sym);
+
 		if (!sym) {
 			if (!menu_is_visible(menu))
 				goto next;
@@ -799,7 +801,6 @@ int conf_write(const char *name)
 				     "# %s\n"
 				     "#\n", str);
 		} else if (!(sym->flags & SYMBOL_CHOICE)) {
-			sym_calc_value(sym);
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
-- 
2.7.4

