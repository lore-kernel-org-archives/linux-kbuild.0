Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nd215.dnsexit.com ([64.182.102.215]:33867 "EHLO
	box7.911domain.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753869Ab1D0VgV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 Apr 2011 17:36:21 -0400
Message-ID: <4DB88C2A.1040409@verizon.net>
Date: Wed, 27 Apr 2011 17:35:38 -0400
From: Peter Foley <pefoley2@verizon.net>
Reply-To: <pefoley2@verizon.net>
MIME-Version: 1.0
Subject: [PATCH V2 resend 5/7] kbuild: make update-po-config work in KBUILD_OUTPUT
Content-Type: multipart/mixed;
	boundary="------------060402080506040800030409"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>

--------------060402080506040800030409
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This patch makes update-po-config work when make is invoked in
KBUILD_OUTPUT.

Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/kconfig/Makefile |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index eacdefb..4507336 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -77,14 +77,15 @@ localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
 # The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)echo "  GEN config"
-	$(Q)xgettext --default-domain=linux              \
-	    --add-comments --keyword=_ --keyword=N_      \
-	    --from-code=UTF-8                            \
-	    --files-from=scripts/kconfig/POTFILES.in     \
+	$(Q)xgettext --default-domain=linux                         \
+	    --add-comments --keyword=_ --keyword=N_                 \
+	    --from-code=UTF-8                                       \
+	    --files-from=$(srctree)/scripts/kconfig/POTFILES.in     \
+	    --directory=$(srctree) --directory=$(objtree)           \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
 	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	$(Q)(for i in `ls arch/*/Kconfig`;               \
+	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig`;    \
 	    do                                           \
 		echo "  GEN $$i";                        \
 		$(obj)/kxgettext $$i                     \
@@ -92,7 +93,7 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	    done )
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
-	$(Q)rm -f arch/um/Kconfig.arch
+	$(Q)rm -f $(srctree)/arch/um/Kconfig.arch
 	$(Q)rm -f $(obj)/config.pot

 PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
@@ -331,7 +332,8 @@ $(obj)/lkc_defs.h: $(src)/lkc_proto.h

 # Extract gconf menu items for I18N support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
-	intltool-extract --type=gettext/glade $(obj)/gconf.glade
+	intltool-extract --type=gettext/glade --srcdir=$(srctree) \
+	$(obj)/gconf.glade

 ###
 # The following requires flex/bison/gperf
-- 
1.7.5.rc1



--------------060402080506040800030409
Content-Type: text/plain;
	name="kbuild-make-update-po-config-work-in-KBUILD_OUTPUT.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kbuild-make-update-po-config-work-in-KBUILD_OUTPUT.patch"

From 09f0595cd582f094014a359bd66577e1809d43c3 Mon Sep 17 00:00:00 2001
From: Peter Foley <pefoley2@verizon.net>
Date: Tue, 26 Apr 2011 18:13:05 -0400
Subject: [PATCH 5/7] kbuild: make update-po-config work in KBUILD_OUTPUT


Signed-off-by: Peter Foley <pefoley2@verizon.net>
---
 scripts/kconfig/Makefile |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index eacdefb..4507336 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -77,14 +77,15 @@ localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
 # The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)echo "  GEN config"
-	$(Q)xgettext --default-domain=linux              \
-	    --add-comments --keyword=_ --keyword=N_      \
-	    --from-code=UTF-8                            \
-	    --files-from=scripts/kconfig/POTFILES.in     \
+	$(Q)xgettext --default-domain=linux                         \
+	    --add-comments --keyword=_ --keyword=N_                 \
+	    --from-code=UTF-8                                       \
+	    --files-from=$(srctree)/scripts/kconfig/POTFILES.in     \
+	    --directory=$(srctree) --directory=$(objtree)           \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
 	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	$(Q)(for i in `ls arch/*/Kconfig`;               \
+	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig`;    \
 	    do                                           \
 		echo "  GEN $$i";                        \
 		$(obj)/kxgettext $$i                     \
@@ -92,7 +93,7 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	    done )
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
-	$(Q)rm -f arch/um/Kconfig.arch
+	$(Q)rm -f $(srctree)/arch/um/Kconfig.arch
 	$(Q)rm -f $(obj)/config.pot
 
 PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
@@ -331,7 +332,8 @@ $(obj)/lkc_defs.h: $(src)/lkc_proto.h
 
 # Extract gconf menu items for I18N support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
-	intltool-extract --type=gettext/glade $(obj)/gconf.glade
+	intltool-extract --type=gettext/glade --srcdir=$(srctree) \
+	$(obj)/gconf.glade
 
 ###
 # The following requires flex/bison/gperf
-- 
1.7.5.rc1



--------------060402080506040800030409--
