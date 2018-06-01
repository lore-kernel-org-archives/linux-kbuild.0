Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43720 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750885AbeFAFu4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 01:50:56 -0400
From: Petr Vorel <pvorel@suse.cz>
Subject: [PATCH v2 2/2] kbuild: Fix indent in help
Date: Fri,  1 Jun 2018 07:50:41 +0200
Message-Id: <20180601055041.12922-2-pvorel@suse.cz>
In-Reply-To: <20180601055041.12922-1-pvorel@suse.cz>
References: <20180601055041.12922-1-pvorel@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>

+ move last word of nconfig help to the previous line

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 scripts/kconfig/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 36b092150c45..fda6b1734ee0 100644
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
@@ -169,7 +168,7 @@ help:
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
-	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
+	@echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
 	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
-- 
2.16.3

