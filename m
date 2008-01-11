Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail02d.mail.t-online.hu ([84.2.42.7]:52357 "EHLO
	mail02d.mail.t-online.hu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759284AbYAKXNe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Jan 2008 18:13:34 -0500
Subject: [PATCH 4/10] kconfig: gettext support for gconfig
From: EGRY Gabor <gaboregry1@t-online.hu>
Content-Type: text/plain
Date: Fri, 11 Jan 2008 23:46:11 +0100
Message-Id: <1200091571.10603.40.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@zh-kernel.org


Gettext support for menu and toolbar.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 kbuild-szilard/scripts/kconfig/Makefile    |    7 +++++--
 kbuild-szilard/scripts/kconfig/POTFILES.in |    1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff -puN scripts/kconfig/Makefile~kconfig-i18n-08-gconfig-gui scripts/kconfig/Makefile
--- kbuild/scripts/kconfig/Makefile~kconfig-i18n-08-gconfig-gui	2008-01-11 22:24:54.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/Makefile	2008-01-11 22:25:55.000000000 +0100
@@ -27,7 +27,7 @@ silentoldconfig: $(obj)/conf
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 # The symlink is used to repair a deficiency in arch/um
-update-po-config: $(obj)/kxgettext
+update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)echo "  GEN config"
 	$(Q)xgettext --default-domain=linux              \
 	    --add-comments --keyword=_ --keyword=N_      \
@@ -139,7 +139,7 @@ gconf-objs	:= gconf.o kconfig_load.o zco
 endif
 
 clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c
+		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf
 clean-files     += config.pot linux.pot
 
@@ -254,6 +254,9 @@ $(obj)/%.moc: $(src)/%.h
 $(obj)/lkc_defs.h: $(src)/lkc_proto.h
 	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
 
+# Extract gconf menu items for I18N support
+$(obj)/gconf.glade.h: $(obj)/gconf.glade
+	intltool-extract --type=gettext/glade $(obj)/gconf.glade
 
 ###
 # The following requires flex/bison/gperf
diff -puN scripts/kconfig/POTFILES.in~kconfig-i18n-08-gconfig-gui scripts/kconfig/POTFILES.in
--- kbuild/scripts/kconfig/POTFILES.in~kconfig-i18n-08-gconfig-gui	2008-01-11 22:24:54.000000000 +0100
+++ kbuild-szilard/scripts/kconfig/POTFILES.in	2008-01-11 22:24:54.000000000 +0100
@@ -8,4 +8,5 @@ scripts/kconfig/mconf.c
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
 scripts/kconfig/gconf.c
+scripts/kconfig/gconf.glade.h
 scripts/kconfig/qconf.cc
_

