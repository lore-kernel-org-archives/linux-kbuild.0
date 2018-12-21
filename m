Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:38270 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387772AbeLUId2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Dec 2018 03:33:28 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] kconfig: split images.c out of qconf.cc/gconf.c to fix gconf warnings
Date: Fri, 21 Dec 2018 17:33:07 +0900
Message-Id: <1545381188-514-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545381188-514-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Currently, images.c is included by qconf.cc and gconf.c.
qconf.cc uses all of xpm_* arrays, but gconf.c only some of them.
Hence, lots of "... defined but not used" warnings are displayed
when compiling gconf.c

Splitting out images.c fixes the warnings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile |  4 ++--
 scripts/kconfig/gconf.c  |  2 +-
 scripts/kconfig/images.c | 32 +++++++++++++++++---------------
 scripts/kconfig/images.h | 33 +++++++++++++++++++++++++++++++++
 scripts/kconfig/qconf.cc |  2 +-
 5 files changed, 54 insertions(+), 19 deletions(-)
 create mode 100644 scripts/kconfig/images.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 65cdf8c..ec204fa 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -178,7 +178,7 @@ $(addprefix $(obj)/lxdialog/, $(lxdialog)): $(obj)/.mconf-cfg
 # qconf: Used for the xconfig target based on Qt
 hostprogs-y	+= qconf
 qconf-cxxobjs	:= qconf.o
-qconf-objs	:= $(common-objs)
+qconf-objs	:= images.o $(common-objs)
 
 HOSTLDLIBS_qconf	= $(shell . $(obj)/.qconf-cfg && echo $$libs)
 HOSTCXXFLAGS_qconf.o	= $(shell . $(obj)/.qconf-cfg && echo $$cflags)
@@ -193,7 +193,7 @@ $(obj)/%.moc: $(src)/%.h $(obj)/.qconf-cfg
 
 # gconf: Used for the gconfig target based on GTK+
 hostprogs-y	+= gconf
-gconf-objs	:= gconf.o $(common-objs)
+gconf-objs	:= gconf.o images.o $(common-objs)
 
 HOSTLDLIBS_gconf    = $(shell . $(obj)/.gconf-cfg && echo $$libs)
 HOSTCFLAGS_gconf.o  = $(shell . $(obj)/.gconf-cfg && echo $$cflags)
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 2d4e5a1..b3d438c 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -9,7 +9,7 @@
 
 #include <stdlib.h>
 #include "lkc.h"
-#include "images.c"
+#include "images.h"
 
 #include <glade/glade.h>
 #include <gtk/gtk.h>
diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
index ef43b81..b4fa0e4 100644
--- a/scripts/kconfig/images.c
+++ b/scripts/kconfig/images.c
@@ -3,7 +3,9 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
-static const char *xpm_load[] = {
+#include "images.h"
+
+const char *xpm_load[] = {
 "22 22 5 1",
 ". c None",
 "# c #000000",
@@ -33,7 +35,7 @@ static const char *xpm_load[] = {
 "###############.......",
 "......................"};
 
-static const char *xpm_save[] = {
+const char *xpm_save[] = {
 "22 22 5 1",
 ". c None",
 "# c #000000",
@@ -63,7 +65,7 @@ static const char *xpm_save[] = {
 "..##################..",
 "......................"};
 
-static const char *xpm_back[] = {
+const char *xpm_back[] = {
 "22 22 3 1",
 ". c None",
 "# c #000083",
@@ -91,7 +93,7 @@ static const char *xpm_back[] = {
 "......................",
 "......................"};
 
-static const char *xpm_tree_view[] = {
+const char *xpm_tree_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -118,7 +120,7 @@ static const char *xpm_tree_view[] = {
 "......................",
 "......................"};
 
-static const char *xpm_single_view[] = {
+const char *xpm_single_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -145,7 +147,7 @@ static const char *xpm_single_view[] = {
 "......................",
 "......................"};
 
-static const char *xpm_split_view[] = {
+const char *xpm_split_view[] = {
 "22 22 2 1",
 ". c None",
 "# c #000000",
@@ -172,7 +174,7 @@ static const char *xpm_split_view[] = {
 "......................",
 "......................"};
 
-static const char *xpm_symbol_no[] = {
+const char *xpm_symbol_no[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -189,7 +191,7 @@ static const char *xpm_symbol_no[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_symbol_mod[] = {
+const char *xpm_symbol_mod[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -206,7 +208,7 @@ static const char *xpm_symbol_mod[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_symbol_yes[] = {
+const char *xpm_symbol_yes[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -223,7 +225,7 @@ static const char *xpm_symbol_yes[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_choice_no[] = {
+const char *xpm_choice_no[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -240,7 +242,7 @@ static const char *xpm_choice_no[] = {
 "    ....    ",
 "            "};
 
-static const char *xpm_choice_yes[] = {
+const char *xpm_choice_yes[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -257,7 +259,7 @@ static const char *xpm_choice_yes[] = {
 "    ....    ",
 "            "};
 
-static const char *xpm_menu[] = {
+const char *xpm_menu[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -274,7 +276,7 @@ static const char *xpm_menu[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_menu_inv[] = {
+const char *xpm_menu_inv[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -291,7 +293,7 @@ static const char *xpm_menu_inv[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_menuback[] = {
+const char *xpm_menuback[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
@@ -308,7 +310,7 @@ static const char *xpm_menuback[] = {
 " .......... ",
 "            "};
 
-static const char *xpm_void[] = {
+const char *xpm_void[] = {
 "12 12 2 1",
 "  c white",
 ". c black",
diff --git a/scripts/kconfig/images.h b/scripts/kconfig/images.h
new file mode 100644
index 0000000..d8ff614
--- /dev/null
+++ b/scripts/kconfig/images.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
+ */
+
+#ifndef IMAGES_H
+#define IMAGES_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+extern const char *xpm_load[];
+extern const char *xpm_save[];
+extern const char *xpm_back[];
+extern const char *xpm_tree_view[];
+extern const char *xpm_single_view[];
+extern const char *xpm_split_view[];
+extern const char *xpm_symbol_no[];
+extern const char *xpm_symbol_mod[];
+extern const char *xpm_symbol_yes[];
+extern const char *xpm_choice_no[];
+extern const char *xpm_choice_yes[];
+extern const char *xpm_menu[];
+extern const char *xpm_menu_inv[];
+extern const char *xpm_menuback[];
+extern const char *xpm_void[];
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* IMAGES_H */
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c897998..8be8a70 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -32,7 +32,7 @@
 #include "qconf.h"
 
 #include "qconf.moc"
-#include "images.c"
+#include "images.h"
 
 
 static QApplication *configApp;
-- 
2.7.4
