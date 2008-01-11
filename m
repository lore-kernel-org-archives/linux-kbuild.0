Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail00a.mail.t-online.hu ([84.2.40.5]:60306 "EHLO
	mail00a.mail.t-online.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758179AbYAKXJY (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 18:09:24 -0500
Subject: [PATCH 1/10] kconfig: update-po-config info
From: EGRY Gabor <gaboregry1@t-online.hu>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 23:40:00 +0100
Message-Id: <1200091200.10603.30.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@zh-kernel.org


This patch adds tracking messages.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 kbuild-szilard/scripts/kconfig/Makefile |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff -puN scripts/kconfig/Makefile~kconfig-i18n-02-update-po-fix scripts/kconfig/Makefile
--- kbuild/scripts/kconfig/Makefile~kconfig-i18n-02-update-po-fix	2008-01-11 22:16:06.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/Makefile	2008-01-11 22:27:38.000000000 +0100
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
_

