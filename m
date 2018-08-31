Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:25947 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbeHaNmy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Aug 2018 09:42:54 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: do not require pkg-config on make {menu,n}config
Date: Fri, 31 Aug 2018 18:34:55 +0900
Message-Id: <1535708095-15847-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Meelis Roos <mroos@linux.ee>, Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org

Meelis Roos reported a {menu,n}config regression:

 "I have libncurses devel package installed in the default system
  location (as do 99%+ on actual developers probably) and in this
  case, pkg-config is useless.  pkg-config is needed only when
  libraries and headers are installed in non-default locations but
  it is bad to require installation of pkg-config on all the machines
  where make menuconfig would be possibly run."

For {menu,n}config, do not use pkg-config if it is not installed.
For {g,x}config, keep checking pkg-config since we really rely on it
for finding the installation paths of the required packages.

Fixes: 4ab3b80159d4 ("kconfig: check for pkg-config on make {menu,n,g,x}config")
Reported-by: Meelis Roos <mroos@linux.ee>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/process/changes.rst  |  2 +-
 scripts/kconfig/Makefile           |  1 -
 scripts/kconfig/check-pkgconfig.sh |  8 --------
 scripts/kconfig/gconf-cfg.sh       |  7 +++++++
 scripts/kconfig/mconf-cfg.sh       | 25 ++++++++++++++-----------
 scripts/kconfig/nconf-cfg.sh       | 25 ++++++++++++++-----------
 scripts/kconfig/qconf-cfg.sh       |  7 +++++++
 7 files changed, 43 insertions(+), 32 deletions(-)
 delete mode 100644 scripts/kconfig/check-pkgconfig.sh

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 61f918b..d1bf143 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -86,7 +86,7 @@ pkg-config
 
 The build system, as of 4.18, requires pkg-config to check for installed
 kconfig tools and to determine flags settings for use in
-'make {menu,n,g,x}config'.  Previously pkg-config was being used but not
+'make {g,x}config'.  Previously pkg-config was being used but not
 verified or documented.
 
 Flex
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 4a7bd21..67ed9f6 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -221,7 +221,6 @@ $(obj)/zconf.tab.o: $(obj)/zconf.lex.c
 
 # check if necessary packages are available, and configure build flags
 define filechk_conf_cfg
-	$(CONFIG_SHELL) $(srctree)/scripts/kconfig/check-pkgconfig.sh; \
 	$(CONFIG_SHELL) $<
 endef
 
diff --git a/scripts/kconfig/check-pkgconfig.sh b/scripts/kconfig/check-pkgconfig.sh
deleted file mode 100644
index 7a1c40b..0000000
--- a/scripts/kconfig/check-pkgconfig.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-# Check for pkg-config presence
-
-if [ -z $(command -v pkg-config) ]; then
-	echo "'make *config' requires 'pkg-config'. Please install it." 1>&2
-	exit 1
-fi
diff --git a/scripts/kconfig/gconf-cfg.sh b/scripts/kconfig/gconf-cfg.sh
index 533b3d8..480ecd8 100755
--- a/scripts/kconfig/gconf-cfg.sh
+++ b/scripts/kconfig/gconf-cfg.sh
@@ -3,6 +3,13 @@
 
 PKG="gtk+-2.0 gmodule-2.0 libglade-2.0"
 
+if [ -z "$(command -v pkg-config)" ]; then
+	echo >&2 "*"
+	echo >&2 "* 'make gconfig' requires 'pkg-config'. Please install it."
+	echo >&2 "*"
+	exit 1
+fi
+
 if ! pkg-config --exists $PKG; then
 	echo >&2 "*"
 	echo >&2 "* Unable to find the GTK+ installation. Please make sure that"
diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
index e6f9fac..c812872d 100755
--- a/scripts/kconfig/mconf-cfg.sh
+++ b/scripts/kconfig/mconf-cfg.sh
@@ -4,20 +4,23 @@
 PKG="ncursesw"
 PKG2="ncurses"
 
-if pkg-config --exists $PKG; then
-	echo cflags=\"$(pkg-config --cflags $PKG)\"
-	echo libs=\"$(pkg-config --libs $PKG)\"
-	exit 0
-fi
+if [ -n "$(command -v pkg-config)" ]; then
+	if pkg-config --exists $PKG; then
+		echo cflags=\"$(pkg-config --cflags $PKG)\"
+		echo libs=\"$(pkg-config --libs $PKG)\"
+		exit 0
+	fi
 
-if pkg-config --exists $PKG2; then
-	echo cflags=\"$(pkg-config --cflags $PKG2)\"
-	echo libs=\"$(pkg-config --libs $PKG2)\"
-	exit 0
+	if pkg-config --exists $PKG2; then
+		echo cflags=\"$(pkg-config --cflags $PKG2)\"
+		echo libs=\"$(pkg-config --libs $PKG2)\"
+		exit 0
+	fi
 fi
 
-# Unfortunately, some distributions (e.g. openSUSE) cannot find ncurses
-# by pkg-config.
+# Check the default paths in case pkg-config is not installed.
+# (Even if it is installed, some distributions such as openSUSE cannot
+# find ncurses by pkg-config.)
 if [ -f /usr/include/ncursesw/ncurses.h ]; then
 	echo cflags=\"-D_GNU_SOURCE -I/usr/include/ncursesw\"
 	echo libs=\"-lncursesw\"
diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
index 42f5ac7..001559e 100644
--- a/scripts/kconfig/nconf-cfg.sh
+++ b/scripts/kconfig/nconf-cfg.sh
@@ -4,20 +4,23 @@
 PKG="ncursesw menuw panelw"
 PKG2="ncurses menu panel"
 
-if pkg-config --exists $PKG; then
-	echo cflags=\"$(pkg-config --cflags $PKG)\"
-	echo libs=\"$(pkg-config --libs $PKG)\"
-	exit 0
-fi
+if [ -n "$(command -v pkg-config)" ]; then
+	if pkg-config --exists $PKG; then
+		echo cflags=\"$(pkg-config --cflags $PKG)\"
+		echo libs=\"$(pkg-config --libs $PKG)\"
+		exit 0
+	fi
 
-if pkg-config --exists $PKG2; then
-	echo cflags=\"$(pkg-config --cflags $PKG2)\"
-	echo libs=\"$(pkg-config --libs $PKG2)\"
-	exit 0
+	if pkg-config --exists $PKG2; then
+		echo cflags=\"$(pkg-config --cflags $PKG2)\"
+		echo libs=\"$(pkg-config --libs $PKG2)\"
+		exit 0
+	fi
 fi
 
-# Unfortunately, some distributions (e.g. openSUSE) cannot find ncurses
-# by pkg-config.
+# Check the default paths in case pkg-config is not installed.
+# (Even if it is installed, some distributions such as openSUSE cannot
+# find ncurses by pkg-config.)
 if [ -f /usr/include/ncursesw/ncurses.h ]; then
 	echo cflags=\"-D_GNU_SOURCE -I/usr/include/ncursesw\"
 	echo libs=\"-lncursesw -lmenuw -lpanelw\"
diff --git a/scripts/kconfig/qconf-cfg.sh b/scripts/kconfig/qconf-cfg.sh
index 0862e15..02ccc0a 100755
--- a/scripts/kconfig/qconf-cfg.sh
+++ b/scripts/kconfig/qconf-cfg.sh
@@ -4,6 +4,13 @@
 PKG="Qt5Core Qt5Gui Qt5Widgets"
 PKG2="QtCore QtGui"
 
+if [ -z "$(command -v pkg-config)" ]; then
+	echo >&2 "*"
+	echo >&2 "* 'make xconfig' requires 'pkg-config'. Please install it."
+	echo >&2 "*"
+	exit 1
+fi
+
 if pkg-config --exists $PKG; then
 	echo cflags=\"-std=c++11 -fPIC $(pkg-config --cflags Qt5Core Qt5Gui Qt5Widgets)\"
 	echo libs=\"$(pkg-config --libs $PKG)\"
-- 
2.7.4
