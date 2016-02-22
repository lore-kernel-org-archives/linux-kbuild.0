Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:32573 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752015AbcBVHb7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 02:31:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] ARM: decompressor: drop unneeded assignments to "targets"
Date: Mon, 22 Feb 2016 16:31:12 +0900
Message-Id: <1456126277-14633-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
References: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Magnus Damm <damm+renesas@opensource.se>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Roy Franz <roy.franz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>

The "targets" exists to specify which files need the corresponding
".*_cmd" files to be included during the build.  In other words, it
is used for files that need to detect the change of the command line
by if_changed, if_changed_dep, and if_changed_rule.  While, these
files are just copied by "$(call cmd,shipped)".  Adding them to the
"targets" is meaningless because $(call cmd,...) never creates
".*_cmd" files.  Such files as ".lib1funcs.S.cmd", ".ashldi3.S.cmd"
do not exist in the first place.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/compressed/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 7a6a58e..7090ad3 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -91,8 +91,8 @@ endif
 
 targets       := vmlinux vmlinux.lds \
 		 piggy.$(suffix_y) piggy.$(suffix_y).o \
-		 lib1funcs.o lib1funcs.S ashldi3.o ashldi3.S bswapsdi2.o \
-		 bswapsdi2.S font.o font.c head.o misc.o $(OBJS)
+		 lib1funcs.o ashldi3.o bswapsdi2.o \
+		 font.o head.o misc.o $(OBJS)
 
 # Make sure files are removed during clean
 extra-y       += piggy.gzip piggy.lzo piggy.lzma piggy.xzkern piggy.lz4 \
-- 
1.9.1

