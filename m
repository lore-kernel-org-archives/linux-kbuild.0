Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:37878 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751035Ab2FKW4X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Jun 2012 18:56:23 -0400
Received: by vbbff1 with SMTP id ff1so2590304vbb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jun 2012 15:56:23 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] xconfig: use pkgconfig to find moc
Date: Mon, 11 Jun 2012 17:56:08 -0500
Message-Id: <1339455368-7620-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Various schemes exist to allow parallel installations of multiple major
versions of Qt (4.x with the previous 3.x and/or the upcoming 5.x).
QtCore.pc includes a moc_location variable which should be a more reliable
way to find moc.

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
Also applies to all 3.x stable branches

 scripts/kconfig/Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7966265..059b5ca 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -260,8 +260,7 @@ $(obj)/.tmp_qtcheck:
 	else \
 	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
 	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
-	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
-	  moc="$$binpath/bin/moc"; \
+	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
 	fi; \
 	echo "KC_QT_CFLAGS=$$cflags" > $@; \
 	echo "KC_QT_LIBS=$$libs" >> $@; \
-- 
1.7.9

