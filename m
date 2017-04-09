Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:53136 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752067AbdDINHZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Apr 2017 09:07:25 -0400
From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] kconfig: Check for libncurses before menuconfig
Date: Sun,  9 Apr 2017 15:07:08 +0200
Message-Id: <20170409130708.4753-1-bp@alien8.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

There is a check and a nice user-friendly message when the curses
library is not present on the system and the user wants to do "make
menuconfig". It doesn't get issued, though. Instead, we fail the build
when mconf.c doesn't find the curses.h header:

    HOSTCC  scripts/kconfig/mconf.o
  In file included from scripts/kconfig/mconf.c:23:0:
  scripts/kconfig/lxdialog/dialog.h:38:20: fatal error: curses.h: No such file or directory
   #include CURSES_LOC
                      ^
  compilation terminated.

Make that check a prerequisite to mconf so that the user sees the error
message instead:

  $ make menuconfig
   *** Unable to find the ncurses libraries or the
   *** required header files.
   *** 'make menuconfig' requires the ncurses libraries.
   ***
   *** Install ncurses (ncurses-devel) and try again.
   ***
  scripts/kconfig/Makefile:203: recipe for target 'scripts/kconfig/dochecklxdialog' failed
  make[1]: *** [scripts/kconfig/dochecklxdialog] Error 1
  Makefile:548: recipe for target 'menuconfig' failed
  make: *** [menuconfig] Error 2

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org
---
 scripts/kconfig/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 90a091b6ae4d..e58220ce65b9 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -24,6 +24,8 @@ xconfig: $(obj)/qconf
 gconfig: $(obj)/gconf
 	$< $(silent) $(Kconfig)
 
+$(obj)/mconf: $(obj)/dochecklxdialog
+
 menuconfig: $(obj)/mconf
 	$< $(silent) $(Kconfig)
 
-- 
2.11.0

