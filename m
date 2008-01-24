Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37450 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758842AbYAXWEF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:05 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 45/77] kconfig: update-po-config info
Date: Thu, 24 Jan 2008 23:03:26 +0100
Message-Id: <1201212238-4369-45-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

This patch adds tracking messages.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/Makefile |   18 +++++++++++-------
 1 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 8091435..d28bf85 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -24,22 +24,25 @@ oldconfig: $(obj)/conf
 silentoldconfig: $(obj)/conf
 	$< -s $(Kconfig)
 
-# Create new linux.po file
+# Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 # The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext
-	xgettext --default-domain=linux                  \
+	$(Q)echo "  GEN config"
+	$(Q)xgettext --default-domain=linux              \
 	    --add-comments --keyword=_ --keyword=N_      \
 	    --from-code=UTF-8                            \
 	    --files-from=scripts/kconfig/POTFILES.in     \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
 	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	(for i in `ls arch/`;                            \
-	do                                               \
-	    $(obj)/kxgettext arch/$$i/Kconfig;           \
-	done ) >> $(obj)/config.pot
-	msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
+	$(Q)(for i in `ls arch/`;                        \
+	    do                                           \
+		echo "  GEN $$i";                        \
+		$(obj)/kxgettext arch/$$i/Kconfig        \
+		     >> $(obj)/config.pot;               \
+	    done )
+	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
 	$(Q)rm -f arch/um/Kconfig.arch
 	$(Q)rm -f $(obj)/config.pot
@@ -138,6 +141,7 @@ endif
 clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
 		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c
 clean-files     += mconf qconf gconf
+clean-files     += config.pot linux.pot
 
 # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
 PHONY += $(obj)/dochecklxdialog
-- 
1.5.4.rc3.14.g44397

