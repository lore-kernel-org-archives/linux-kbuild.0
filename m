Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jack.hrz.tu-chemnitz.de ([134.109.132.46]:36231 "EHLO
	jack.hrz.tu-chemnitz.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755492Ab0IJRB1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Sep 2010 13:01:27 -0400
From: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Subject: [PATCH] Fix QT4 moc, cflags libs detection on dual QT3/Qt4 systems
Date: Fri, 10 Sep 2010 19:01:14 +0200
Message-Id: <1284138074-7287-1-git-send-email-alexander.stein@informatik.tu-chemnitz.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Randy Dunlap <rdunlap@xenotime.net>, Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>, Michal Marek <mmarek@suse.cz>

On system with QT3 and QT4 qmake in PATH may be from QT3. So we use
pkg-config for proper QT4 detection.
By reqesting cflags and libs for either QtCore, QtGui and QtSupport include
dirs and libs get listed several times, but so we won't mis anything

CC: Michal Marek <mmarek@suse.cz>
Signed-off-by: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
---
 scripts/kconfig/Makefile |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index cef3f75..996059e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -273,12 +273,10 @@ $(obj)/.tmp_qtcheck:
 	      moc="/usr/bin/moc"; \
 	    fi; \
 	else \
-	  headerpath="\$$(shell qmake -query QT_INSTALL_HEADERS)"; \
-	  libpath="\$$(shell qmake -query QT_INSTALL_LIBS)"; \
-	  binpath="\$$(shell qmake -query QT_INSTALL_BINS)"; \
-	  cflags="-I$$headerpath -I$$headerpath/QtCore -I$$headerpath/QtGui -I$$headerpath/Qt3Support -DQT3_SUPPORT"; \
-	  libs="-L$$libpath -Wl,-rpath,$$libpath -lQtCore -lQtGui -lQt3Support"; \
-	  moc="$$binpath/moc"; \
+	  cflags="\$$(shell pkg-config QtCore --cflags) \$$(shell pkg-config QtGui --cflags) \$$(shell pkg-config Qt3Support --cflags)"; \
+	  libs="\$$(shell pkg-config QtCore --libs) \$$(shell pkg-config QtGui --libs) \$$(shell pkg-config Qt3Support --libs)"; \
+	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
+	  moc="$$binpath/bin/moc"; \
 	fi; \
 	echo "KC_QT_CFLAGS=$$cflags" > $@; \
 	echo "KC_QT_LIBS=$$libs" >> $@; \
-- 
1.7.2.2

