Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:22640 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752280AbeAJG51 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 01:57:27 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] kconfig: do not call conf_set_all_new_symbols() for (all)defconfig
Date: Wed, 10 Jan 2018 15:56:11 +0900
Message-Id: <1515567374-12722-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Marc Herbert <marc.herbert@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

(all)defconfig does not need to call conf_set_all_new_symbols() because
conf_write() calculates all symbols based on their default unless they
have been user-defined.

conf_set_all_new_symbols(def_default) is no-op except for "choice".
It calls sym_cal_value() for "choice", but the SYMBOL_VALID is cleared
by set_all_choice_values() later on.  So, conf_write() will re-calculate
it, which is just a wasteful computation.  The only difference I see
is SYMBOL_DEF_USER flag for "choice", but it gives no difference to the
resulted .config file.

I confirmed this change still produced the same .config for all ARCH.

I also moved savedefconfig to collect the no-op cases at the end of
the switch statement.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 52cbe5d..8364811 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -655,18 +655,10 @@ int main(int ac, char **av)
 	case allmodconfig:
 		conf_set_all_new_symbols(def_mod);
 		break;
-	case alldefconfig:
-		conf_set_all_new_symbols(def_default);
-		break;
 	case randconfig:
 		/* Really nothing to do in this loop */
 		while (conf_set_all_new_symbols(def_random)) ;
 		break;
-	case defconfig:
-		conf_set_all_new_symbols(def_default);
-		break;
-	case savedefconfig:
-		break;
 	case oldaskconfig:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
@@ -681,7 +673,10 @@ int main(int ac, char **av)
 			check_conf(&rootmenu);
 		} while (conf_cnt && input_mode != listnewconfig);
 		break;
+	case alldefconfig:
+	case defconfig:
 	case olddefconfig:
+	case savedefconfig:
 	default:
 		break;
 	}
-- 
2.7.4

