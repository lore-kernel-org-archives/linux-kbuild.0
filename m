Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:48786 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750865AbdJCX0l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 19:26:41 -0400
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: [PATCH] kconfig: Warn if choice default is not in choice
Date: Wed,  4 Oct 2017 01:25:46 +0200
Message-Id: <1507073146-19847-1-git-send-email-ulfalizer@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de, Ulf Magnusson <ulfalizer@gmail.com>

This will catch mistakes like in the following real-world example, where
a "CONFIG_" prefix snuck in, making an undefined symbol the default:

	choice
		prompt "Compiler optimization level"
		default CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE

	config CC_OPTIMIZE_FOR_PERFORMANCE
		...

	config CC_OPTIMIZE_FOR_SIZE
		...

	endchoice

This now prints the following warning:

	init/Kconfig:1036:warning: choice default symbol 'CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE' is not contained in the choice

Cases where the default symbol belongs to the wrong choice are also
detected.

(The mistake is harmless here: Since the default symbol is not visible,
the choice falls back on using the first visible symbol as the default,
which is CC_OPTIMIZE_FOR_PERFORMANCE, as intended.)

Discovered while playing around with Kconfiglib
(https://github.com/ulfalizer/Kconfiglib).

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/kconfig/menu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e935793..ce88de8 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -252,6 +252,16 @@ static void sym_check_prop(struct symbol *sym)
 					    "'%s': number is invalid",
 					    sym->name);
 			}
+			if (sym_is_choice(sym)) {
+				struct property *choice_prop =
+					sym_get_choice_prop(sym2);
+
+				if (!choice_prop ||
+				    prop_get_symbol(choice_prop) != sym)
+					prop_warn(prop,
+						  "choice default symbol '%s' is not contained in the choice",
+						  sym2->name);
+			}
 			break;
 		case P_SELECT:
 		case P_IMPLY:
-- 
2.7.4

