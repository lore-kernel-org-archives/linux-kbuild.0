Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:58134 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751412AbeFDDAH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Jun 2018 23:00:07 -0400
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] kbuild: check for pkg-config on make {menu,n,g.x}config
Message-ID: <f13a8e3c-ebc6-53f7-1bac-965c0f30b110@infradead.org>
Date: Sun, 3 Jun 2018 19:59:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Bj=c3=b8rn_Forsman?= <bjorn.forsman@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Sam Ravnborg <sam@ravnborg.org>

From: Randy Dunlap <rdunlap@infradead.org>

Each of 'make {menu,n,g,x}config' uses (needs) pkg-config to make sure
that other required files are present and to determine build flags
settings, but none of these check that pkg-config itself is present.
Add a check for all 4 of these targets and update
Documentation/process/changes.rst to mention 'pkg-config'.

Fixes kernel bugzilla #77511:
https://bugzilla.kernel.org/show_bug.cgi?id=77511

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Bjørn Forsman <bjorn.forsman@gmail.com>
---
Strictly speaking, pkg-config is not required if someone is only
using 'make {menu,n}config' since there are fallbacks for those
two targets.

 Documentation/process/changes.rst  |    8 ++++++++
 scripts/kconfig/Makefile           |    6 ++++++
 scripts/kconfig/check-pkgconfig.sh |   12 ++++++++++++
 3 files changed, 26 insertions(+)

--- linux-next-20180601.orig/scripts/kconfig/Makefile
+++ linux-next-20180601/scripts/kconfig/Makefile
@@ -214,11 +214,17 @@ $(obj)/gconf.o: $(obj)/.gconf-cfg
 $(obj)/zconf.tab.o: $(obj)/zconf.lex.c
 
 # check if necessary packages are available, and configure build flags
+# pkg-config check
+define check_pkg_config
+	$(CONFIG_SHELL) $(srctree)/scripts/kconfig/check-pkgconfig.sh FORCE
+endef
+
 define filechk_conf_cfg
 	$(CONFIG_SHELL) $<
 endef
 
 $(obj)/.%conf-cfg: $(src)/%conf-cfg.sh FORCE
+	$(call check_pkg_config)
 	$(call filechk,conf_cfg)
 
 clean-files += .*conf-cfg
--- /dev/null
+++ linux-next-20180601/scripts/kconfig/check-pkgconfig.sh
@@ -0,0 +1,12 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Check for pkg-config presence
+
+pkgcfg=`command -v pkg-config`
+
+if [ "$pkgcfg" = "" ]; then
+	echo "'make *config' requires 'pkg-config'. Please install it." 1>&2
+	exit 1		# error
+fi
+
+exit 0
--- linux-next-20180601.orig/Documentation/process/changes.rst
+++ linux-next-20180601/Documentation/process/changes.rst
@@ -81,6 +81,14 @@ The build system has, as of 4.13, switch
 rather than incremental linking (`ld -r`) for built-in.a intermediate steps.
 This requires binutils 2.20 or newer.
 
+pkg-config
+----------
+
+The build system, as of 4.18, requires pkg-config to check for installed
+kconfig tools and to determine flags settings for use in
+'make {menu,n,g,x}config'.  Previously pkg-config was being used but not
+verified or documented.
+
 Flex
 ----
 

