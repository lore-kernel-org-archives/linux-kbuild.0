Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:45938 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753068AbeGDWt6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Jul 2018 18:49:58 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kconfig: update user kconfig tools doc.
Message-ID: <0eb8bc34-a0e0-eea8-be62-8420bd82c717@infradead.org>
Date: Wed, 4 Jul 2018 15:49:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Update Documentation/kbuild/kconfig.txt, which mostly contains
user help for using the kernel config tools.

- Add mention of 'nconfig' embedded help text.
- Make the section on new config symbols readable.
- Correct how to find menuconfig search help.
- Add section on 'nconfig' usage.
- Mention that gconfig has multiple viewing modes/options.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/kbuild/kconfig.txt |   51 ++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 8 deletions(-)

--- lnx-418-rc3.orig/Documentation/kbuild/kconfig.txt
+++ lnx-418-rc3/Documentation/kbuild/kconfig.txt
@@ -2,9 +2,9 @@ This file contains some assistance for u
 
 Use "make help" to list all of the possible configuration targets.
 
-The xconfig ('qconf') and menuconfig ('mconf') programs also
-have embedded help text.  Be sure to check it for navigation,
-search, and other general help text.
+The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
+programs also have embedded help text.  Be sure to check that for
+navigation, search, and other general help text.
 
 ======================================================================
 General
@@ -17,13 +17,16 @@ this happens, using a previously working
 for you, so you may find that you need to see what NEW kernel
 symbols have been introduced.
 
-To see a list of new config symbols when using "make oldconfig", use
+To see a list of new config symbols, use
 
 	cp user/some/old.config .config
 	make listnewconfig
 
 and the config program will list any new symbols, one per line.
 
+Alternatively, you can use the brute force method:
+
+	make oldconfig
 	scripts/diffconfig .config.old .config | less
 
 ______________________________________________________________________
@@ -160,7 +163,7 @@ Searching in menuconfig:
 		This lists all config symbols that contain "hotplug",
 		e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
 
-	For search help, enter / followed TAB-TAB-TAB (to highlight
+	For search help, enter / followed by TAB-TAB (to highlight
 	<Help>) and Enter.  This will tell you that you can also use
 	regular expressions (regexes) in the search string, so if you
 	are not interested in MEMORY_HOTPLUG, you could try
@@ -203,6 +206,39 @@ Example:
 
 
 ======================================================================
+nconfig
+--------------------------------------------------
+
+nconfig is an alternate text-based configurator.  It lists function
+keys across the bottom of the terminal (window) that execute commands.
+You can also just use the corresponding numeric key to execute the
+commands unless you are in a data entry window.  E.g., instead of F6
+for Save, you can just press 6.
+
+Use F1 for Global help or F3 for the Short help menu.
+
+Searching in nconfig:
+
+	You can search either in the menu entry "prompt" strings
+	or in the configuration symbols.
+
+	Use / to begin a search through the menu entries.  This does
+	not support regular expressions.  Use <Down> or <Up> for
+	Next hit and Previous hit, respectively.  Use <Esc> to
+	terminate the search mode.
+
+	F8 (SymSearch) searches the configuration symbols for the
+	given string or regular expression (regex).
+
+NCONFIG_MODE
+--------------------------------------------------
+This mode shows all sub-menus in one large tree.
+
+Example:
+	make NCONFIG_MODE=single_menu nconfig
+
+
+======================================================================
 xconfig
 --------------------------------------------------
 
@@ -230,8 +266,7 @@ gconfig
 
 Searching in gconfig:
 
-	None (gconfig isn't maintained as well as xconfig or menuconfig);
-	however, gconfig does have a few more viewing choices than
-	xconfig does.
+	There is no search command in gconfig.  However, gconfig does
+	have several different viewing choices, modes, and options.
 
 ###

