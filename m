Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:49928 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932176AbaFDHwv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2014 03:52:51 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so5774416pdj.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Jun 2014 00:52:50 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] kconfig: nconfig: fix multi-byte UTF handling
Date: Wed,  4 Jun 2014 00:52:31 -0700
Message-Id: <1401868351-24014-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
References: <1401868351-24014-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Martin Walch <walch.martin@web.de>

Currently, Kconfig descriptions that use multi-byte UTF-8 characters
(such as MTD_NAND_CAFE) will have their menu entries dropped from the
'make nconfig' ncurses menu, and all subsequent entries in the same
window will be omitted. This seems to be due to the ncurses 'menu'
library, which does not traditionally handle UTF-8 >8-bit characters
properly.

The ncursesw library ('w' is for "wide") is written to handle these
UTF-8 characters, and is practically a drop-in replacement at the source
level. Use it by default, if available.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=43067
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org
Cc: Martin Walch <walch.martin@web.de>
---
 scripts/kconfig/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 844bc9da08da..0171566cc12a 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -220,7 +220,8 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOSTLOADLIBES_nconf	= $(shell \
-				pkg-config --libs menu panel ncurses 2>/dev/null \
+				pkg-config --libs menuw panelw ncursesw 2>/dev/null \
+				|| pkg-config --libs menu panel ncurses 2>/dev/null \
 				|| echo "-lmenu -lpanel -lncurses"  )
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
-- 
1.7.9.5

