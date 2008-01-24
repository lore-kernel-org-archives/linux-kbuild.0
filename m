Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42808 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759094AbYAXWDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:55 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 48/77] kconfig: gettext support for gconfig
Date: Thu, 24 Jan 2008 23:03:29 +0100
Message-Id: <1201212238-4369-48-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: EGRY Gabor <gaboregry1@t-online.hu>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>

From: EGRY Gabor <gaboregry1@t-online.hu>

Gettext support for menu and toolbar.

Signed-off-by: Egry Gabor <gaboregry1@t-online.hu>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
---
 scripts/kconfig/Makefile    |    7 +++++--
 scripts/kconfig/POTFILES.in |    1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index d28bf85..32e8c5a 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -27,7 +27,7 @@ silentoldconfig: $(obj)/conf
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 # The symlink is used to repair a deficiency in arch/um
-update-po-config: $(obj)/kxgettext
+update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)echo "  GEN config"
 	$(Q)xgettext --default-domain=linux              \
 	    --add-comments --keyword=_ --keyword=N_      \
@@ -139,7 +139,7 @@ gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
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
diff --git a/scripts/kconfig/POTFILES.in b/scripts/kconfig/POTFILES.in
index cc94e46..19d0e63 100644
--- a/scripts/kconfig/POTFILES.in
+++ b/scripts/kconfig/POTFILES.in
@@ -2,4 +2,5 @@ scripts/kconfig/mconf.c
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
 scripts/kconfig/gconf.c
+scripts/kconfig/gconf.glade.h
 scripts/kconfig/qconf.cc
-- 
1.5.4.rc3.14.g44397

