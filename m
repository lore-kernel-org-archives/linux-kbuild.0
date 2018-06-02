Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45193 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750842AbeFBJIO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jun 2018 05:08:14 -0400
From: Petr Vorel <pvorel@suse.cz>
Subject: [PATCH 2/2] kbuild: Move last word of nconfig help to the previous line
Date: Sat,  2 Jun 2018 11:08:03 +0200
Message-Id: <20180602090803.6362-2-pvorel@suse.cz>
In-Reply-To: <20180602090803.6362-1-pvorel@suse.cz>
References: <20180602090803.6362-1-pvorel@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v2->v3:
* Dropped incorrect indent fix. I was wrong, indent is correct. This was
  the main motivation for change, putting nconfig on one line isn't
  important, feel free to drop it.
---
 scripts/kconfig/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 36b092150c45..c7d192d97641 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -151,8 +151,7 @@ clean-dirs += tests/.cache
 # Help text used by make help
 help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
-	@echo  '  nconfig         - Update current config utilising a ncurses menu based'
-	@echo  '                    program'
+	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
-- 
2.17.1

