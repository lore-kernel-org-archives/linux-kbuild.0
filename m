Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:18010 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387933AbeHPHdy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Aug 2018 03:33:54 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: fix "Can't open ..." in parallel build
Date: Thu, 16 Aug 2018 13:36:48 +0900
Message-Id: <1534394208-13116-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Borislav Petkov <bp@alien8.de>, Masahiro Yamada <yamada.masahiro@socionext.com>

If you run "make menuconfig" or "make nconfig" with -j<N> option in a
fresh source tree, you will see several "Can't open ..." messages:

  $ make -j8 menuconfig
    HOSTCC  scripts/basic/fixdep
    YACC    scripts/kconfig/zconf.tab.c
    LEX     scripts/kconfig/zconf.lex.c
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .:   HOSTCC  scripts/kconfig/lxdialog/checklist.o
  Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
    HOSTCC  scripts/kconfig/lxdialog/inputbox.o
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
    UPD     scripts/kconfig/.mconf-cfg
  /bin/sh: 1: .: Can't open scripts/kconfig/.mconf-cfg
    HOSTCC  scripts/kconfig/lxdialog/menubox.o
    HOSTCC  scripts/kconfig/lxdialog/textbox.o
    HOSTCC  scripts/kconfig/lxdialog/util.o
    HOSTCC  scripts/kconfig/lxdialog/yesno.o
    HOSTCC  scripts/kconfig/mconf.o
    HOSTCC  scripts/kconfig/zconf.tab.o
    HOSTLD  scripts/kconfig/mconf

Correct dependencies to fix this problem.

Fixes: 1c5af5cf9308 ("kconfig: refactor ncurses package checks for building mconf and nconf")
Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index c0ca9ea..1246580 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -177,7 +177,7 @@ HOSTLDLIBS_nconf	= $(shell . $(obj)/.nconf-cfg && echo $$libs)
 HOSTCFLAGS_nconf.o	= $(shell . $(obj)/.nconf-cfg && echo $$cflags)
 HOSTCFLAGS_nconf.gui.o	= $(shell . $(obj)/.nconf-cfg && echo $$cflags)
 
-$(obj)/nconf.o: $(obj)/.nconf-cfg
+$(obj)/nconf.o $(obj)/nconf.gui.o: $(obj)/.nconf-cfg
 
 # mconf: Used for the menuconfig target based on lxdialog
 hostprogs-y	+= mconf
@@ -188,7 +188,8 @@ HOSTLDLIBS_mconf = $(shell . $(obj)/.mconf-cfg && echo $$libs)
 $(foreach f, mconf.o $(lxdialog), \
   $(eval HOSTCFLAGS_$f = $$(shell . $(obj)/.mconf-cfg && echo $$$$cflags)))
 
-$(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/.mconf-cfg
+$(obj)/mconf.o: $(obj)/.mconf-cfg
+$(addprefix $(obj)/lxdialog/, $(lxdialog)): $(obj)/.mconf-cfg
 
 # qconf: Used for the xconfig target based on Qt
 hostprogs-y	+= qconf
-- 
2.7.4
