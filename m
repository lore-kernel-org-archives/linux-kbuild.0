Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:38611 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755447AbZINVtG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:06 -0400
Message-Id: <200909142149.n8ELn3dV018408@imap1.linux-foundation.org>
Subject: [patch 02/18] kernel hacking: move STRIP_ASM_SYMS from General
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, randy.dunlap@oracle.com

From: Randy Dunlap <randy.dunlap@oracle.com>

Sam suggested moving STRIP_ASM_SYMS into the Kernel hacking menu
from the General Setup menu.  It makes more sense there.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 init/Kconfig      |    8 --------
 lib/Kconfig.debug |    8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff -puN init/Kconfig~kernel-hacking-move-strip_asm_syms-from-general init/Kconfig
--- a/init/Kconfig~kernel-hacking-move-strip_asm_syms-from-general
+++ a/init/Kconfig
@@ -992,14 +992,6 @@ config SLUB_DEBUG
 	  SLUB sysfs support. /sys/slab will not exist and there will be
 	  no support for cache validation etc.
 
-config STRIP_ASM_SYMS
-	bool "Strip assembler-generated symbols during link"
-	default n
-	help
-	  Strip internal assembler-generated symbols during a link (symbols
-	  that look like '.Lxxx') so they don't pollute the output of
-	  get_wchan() and suchlike.
-
 config COMPAT_BRK
 	bool "Disable heap randomization"
 	default y
diff -puN lib/Kconfig.debug~kernel-hacking-move-strip_asm_syms-from-general lib/Kconfig.debug
--- a/lib/Kconfig.debug~kernel-hacking-move-strip_asm_syms-from-general
+++ a/lib/Kconfig.debug
@@ -50,6 +50,14 @@ config MAGIC_SYSRQ
 	  keys are documented in <file:Documentation/sysrq.txt>. Don't say Y
 	  unless you really know what this hack does.
 
+config STRIP_ASM_SYMS
+	bool "Strip assembler-generated symbols during link"
+	default n
+	help
+	  Strip internal assembler-generated symbols during a link (symbols
+	  that look like '.Lxxx') so they don't pollute the output of
+	  get_wchan() and suchlike.
+
 config UNUSED_SYMBOLS
 	bool "Enable unused/obsolete exported symbols"
 	default y if X86
_
