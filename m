Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:59748 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbbGBJRr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 05:17:47 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] kconfig: Wrap long "make help" text lines
Date: Thu,  2 Jul 2015 11:17:47 +0200
Message-Id: <1435828667-20400-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Some "make help" text lines extend beyond 80 characters. Wrap them at 79
characters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rebased against Linus' tree,
  - Wrap new "xenconfig" line.
---
 scripts/kconfig/Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index f52abae0ec5fe84f..2d9379b9732cf349 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -126,7 +126,8 @@ tinyconfig:
 # Help text used by make help
 help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
-	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
+	@echo  '  nconfig         - Update current config utilising a ncurses menu based'
+	@echo  '                    program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
@@ -142,9 +143,11 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their default value'
+	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their'
+	@echo  '                    default value'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
-	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
+	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel'
+	@echo  '                    support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 
 # lxdialog stuff
-- 
1.9.1

