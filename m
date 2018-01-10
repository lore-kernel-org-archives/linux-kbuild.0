Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:22693 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753542AbeAJG52 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jan 2018 01:57:28 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] kconfig: remove unneeded input_mode test in conf()
Date: Wed, 10 Jan 2018 15:56:12 +0900
Message-Id: <1515567374-12722-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
References: <1515567374-12722-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Ulf Magnusson <ulfalizer@gmail.com>, Marc Herbert <marc.herbert@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

conf() is never called for listnewconfig / olddefconfig.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/conf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8364811..693cd5f 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -368,9 +368,7 @@ static void conf(struct menu *menu)
 
 		switch (prop->type) {
 		case P_MENU:
-			if ((input_mode == silentoldconfig ||
-			     input_mode == listnewconfig ||
-			     input_mode == olddefconfig) &&
+			if (input_mode == silentoldconfig &&
 			    rootEntry != menu) {
 				check_conf(menu);
 				return;
-- 
2.7.4

