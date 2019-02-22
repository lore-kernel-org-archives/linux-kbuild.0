Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:44700 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbfBVH4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 02:56:30 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: move -gsplit-dwarf, -gdwarf-4 option tests to Kconfig
Date: Fri, 22 Feb 2019 16:56:09 +0900
Message-Id: <1550822169-2561-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

CONFIG_DEBUG_INFO_SPLIT and CONFIG_DEBUG_INFO_DWARF4 enable extra
dwarf options if supported. You never know if they are really enabled
since Makefile may silently turn them off.

The actual behavior will match to the kernel configuration by
testing those compiler flags in the Kconfig stage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile          | 4 ++--
 lib/Kconfig.debug | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index bf4e77b..0f86257 100644
--- a/Makefile
+++ b/Makefile
@@ -735,14 +735,14 @@ DEBUG_CFLAGS	:= $(call cc-option, -fno-var-tracking-assignments)
 
 ifdef CONFIG_DEBUG_INFO
 ifdef CONFIG_DEBUG_INFO_SPLIT
-DEBUG_CFLAGS	+= $(call cc-option, -gsplit-dwarf, -g)
+DEBUG_CFLAGS	+= -gsplit-dwarf
 else
 DEBUG_CFLAGS	+= -g
 endif
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 ifdef CONFIG_DEBUG_INFO_DWARF4
-DEBUG_CFLAGS	+= $(call cc-option, -gdwarf-4,)
+DEBUG_CFLAGS	+= -gdwarf-4
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d4df5b2..dfc9949 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -179,6 +179,7 @@ config DEBUG_INFO_REDUCED
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
 	depends on DEBUG_INFO
+	depends on $(cc-option,-gsplit-dwarf)
 	help
 	  Generate debug info into separate .dwo files. This significantly
 	  reduces the build directory size for builds with DEBUG_INFO,
@@ -194,6 +195,7 @@ config DEBUG_INFO_SPLIT
 config DEBUG_INFO_DWARF4
 	bool "Generate dwarf4 debuginfo"
 	depends on DEBUG_INFO
+	depends on $(cc-option,-gdwarf-4)
 	help
 	  Generate dwarf4 debug info. This requires recent versions
 	  of gcc and gdb. It makes the debug information larger.
-- 
2.7.4
