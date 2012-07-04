Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:51206 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754466Ab2GDUXy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jul 2012 16:23:54 -0400
Received: by yenl2 with SMTP id l2so6782887yen.19
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jul 2012 13:23:53 -0700 (PDT)
From: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Subject: [PATCH] xconfig: use pkgconfig to find moc
Date: Wed,  4 Jul 2012 15:23:29 -0500
Message-Id: <1341433409-5764-1-git-send-email-yselkowitz@users.sourceforge.net>
In-Reply-To: <20120704163351.GB12094@sepie.suse.cz>
References: <20120704163351.GB12094@sepie.suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org

From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Various schemes exist to allow parallel installations of multiple major
versions of Qt (4.x with the previous 3.x and/or the upcoming 5.x).
QtCore.pc includes a moc_location variable which should be a more reliable
way to find moc.

Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
---
 scripts/kconfig/Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7966265..5e2176c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -260,8 +260,8 @@ $(obj)/.tmp_qtcheck:
 	else \
 	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
 	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
-	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
-	  moc="$$binpath/bin/moc"; \
+	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
+	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
 	fi; \
 	echo "KC_QT_CFLAGS=$$cflags" > $@; \
 	echo "KC_QT_LIBS=$$libs" >> $@; \
-- 
1.7.9

