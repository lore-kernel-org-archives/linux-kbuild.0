Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43307 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752224AbZELVEy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2009 17:04:54 -0400
Message-Id: <200905122102.n4CL2pl2007220@imap1.linux-foundation.org>
Subject: [patch 2/3] menu: fix embedded menu presentation
From: akpm@linux-foundation.org
Date: Tue, 12 May 2009 13:43:35 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, randy.dunlap@oracle.com

From: Randy Dunlap <randy.dunlap@oracle.com>

The STRIP_ASM_SYMS kconfig symbol mucks up the embedded menu because
STRIP_ASM_SYMS is in the middle of the embedded menu items but it does not
depend on EMBEDDED.  Move it to beyond the end of the embedded menu so
that the menu is presented correctly.

Or if STRIP_ASM_SYMS should depend on EMBEDDED, that can also be fixed.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 init/Kconfig |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff -puN init/Kconfig~menu-fix-embedded-menu-presentation init/Kconfig
--- a/init/Kconfig~menu-fix-embedded-menu-presentation
+++ a/init/Kconfig
@@ -808,14 +808,6 @@ config KALLSYMS_EXTRA_PASS
 	   you wait for kallsyms to be fixed.
 
 
-config STRIP_ASM_SYMS
-	bool "Strip assembler-generated symbols during link"
-	default n
-	help
-	  Strip internal assembler-generated symbols during a link (symbols
-	  that look like '.Lxxx') so they don't pollute the output of
-	  get_wchan() and suchlike.
-
 config HOTPLUG
 	bool "Support for hot-pluggable devices" if EMBEDDED
 	default y
@@ -961,6 +953,14 @@ config SLUB_DEBUG
 	  SLUB sysfs support. /sys/slab will not exist and there will be
 	  no support for cache validation etc.
 
+config STRIP_ASM_SYMS
+	bool "Strip assembler-generated symbols during link"
+	default n
+	help
+	  Strip internal assembler-generated symbols during a link (symbols
+	  that look like '.Lxxx') so they don't pollute the output of
+	  get_wchan() and suchlike.
+
 config COMPAT_BRK
 	bool "Disable heap randomization"
 	default y
_
