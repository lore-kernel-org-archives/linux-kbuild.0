Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:51750 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932431Ab2GDXbQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jul 2012 19:31:16 -0400
Received: by ghrr11 with SMTP id r11so6890626ghr.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jul 2012 16:31:15 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] xconfig: add quiet rule for moc
Date: Wed,  4 Jul 2012 18:31:11 -0500
Message-Id: <1341444671-7528-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Also add a dependency on .tmp_qtcheck for KC_QT_MOC.

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
Also applies to 3.x stable branches

 scripts/kconfig/Makefile |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5e2176c..cf1171f 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -298,8 +298,11 @@ $(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
 
 $(obj)/qconf.o: $(obj)/qconf.moc
 
-$(obj)/%.moc: $(src)/%.h
-	$(KC_QT_MOC) -i $< -o $@
+quiet_cmd_moc = MOC     $@
+      cmd_moc = $(KC_QT_MOC) -i $< -o $@
+
+$(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
+	$(call cmd,moc)
 
 # Extract gconf menu items for I18N support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
-- 
1.7.9

