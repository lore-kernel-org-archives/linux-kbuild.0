Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54573 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751300AbbDHLnF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 07:43:05 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 88067AD25
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Apr 2015 11:43:03 +0000 (UTC)
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 1/2] kconfig: Simplify Makefile
Date: Wed,  8 Apr 2015 13:42:55 +0200
Message-Id: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Use a single rule for targets handled directly by the conf program.

Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 scripts/kconfig/Makefile | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index cb2cf54..1f5e453 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -2,7 +2,7 @@
 # Kernel configuration targets
 # These targets are used from top-level makefile
 
-PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config \
+PHONY += xconfig gconfig menuconfig config silentoldconfig update-po-config \
 	localmodconfig localyesconfig
 
 ifdef KBUILD_KCONFIG
@@ -29,9 +29,6 @@ config: $(obj)/conf
 nconfig: $(obj)/nconf
 	$< $(Kconfig)
 
-oldconfig: $(obj)/conf
-	$< --$@ $(Kconfig)
-
 silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
 	$< --$@ $(Kconfig)
@@ -74,21 +71,20 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	    --output $(obj)/linux.pot
 	$(Q)rm -f $(obj)/config.pot
 
-PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
+# These targets map 1:1 to the commandline options of 'conf'
+simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
+	alldefconfig randconfig listnewconfig olddefconfig
+PHONY += $(simple-targets)
 
-allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
+$(simple-targets): $(obj)/conf
 	$< --$@ $(Kconfig)
 
-PHONY += listnewconfig olddefconfig oldnoconfig savedefconfig defconfig
-
-listnewconfig olddefconfig: $(obj)/conf
-	$< --$@ $(Kconfig)
+PHONY += oldnoconfig savedefconfig defconfig
 
 # oldnoconfig is an alias of olddefconfig, because people already are dependent
 # on its behavior(sets new symbols to their default value but not 'n') with the
 # counter-intuitive name.
-oldnoconfig: $(obj)/conf
-	$< --olddefconfig $(Kconfig)
+oldnoconfig: olddefconfig
 
 savedefconfig: $(obj)/conf
 	$< --$@=defconfig $(Kconfig)
-- 
2.1.4

