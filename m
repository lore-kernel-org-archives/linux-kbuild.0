Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from winston.telenet-ops.be ([195.130.137.75]:44960 "EHLO
	winston.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932242AbbEZNgW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 May 2015 09:36:22 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	by winston.telenet-ops.be (Postfix) with ESMTP id E341F590376
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2015 13:40:29 +0200 (CEST)
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] kconfig: Wrap long "make help" text lines
Date: Tue, 26 May 2015 13:39:54 +0200
Message-Id: <1432640395-17310-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Some "make help" text lines extend beyond 80 characters. Wrap them at 79
characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 scripts/kconfig/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index d9b1fef0c67e3cb4..d19de3665bfbe984 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -122,7 +122,8 @@ tinyconfig:
 # Help text used by make help
 help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
-	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
+	@echo  '  nconfig         - Update current config utilising a ncurses menu based'
+	@echo  '                    program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
@@ -138,7 +139,8 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their default value'
+	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their'
+	@echo  '                    default value'
 	@echo  '  kvmconfig	  - Enable additional options for guest kernel support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 
-- 
1.9.1

