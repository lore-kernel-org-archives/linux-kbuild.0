Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from paul.0au.de ([94.23.237.123]:36319 "EHLO 0au.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751271Ab1DJCJq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Apr 2011 22:09:46 -0400
Received: from mail by 0au.de with spam-scanned (Exim 4.74)
	(envelope-from <a@0au.de>)
	id 1Q8k5x-000725-PX
	for linux-kbuild@vger.kernel.org; Sun, 10 Apr 2011 04:09:45 +0200
Date: Sun, 10 Apr 2011 04:09:23 +0200
From: Valentin Ochs <a@0au.de>
Subject: [PATCH v2] kconfig/kbuild: define _POSIX_C_SOURCE
Message-ID: <20110410020923.GI4663@erwin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: Michal Marek <mmarek@suse.cz>, Roman Zippel <zippel@linux-m68k.org>, trivial@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The three patched files use PATH_MAX without defining the required
_POSIX_C_SOURCE feature test macro.  This prevents compilation with the
musl libc.  The patch applies to 2.6.38.2.  

Changes since v1:
 - fix scripts/kconfig/lex.zconf.c_shipped
 - fix scripts/kconfig/mconf.c

Sorry about the incomplete patch I sent a few hours ago, it won't happen
again. :)

Best regards,
Valentin

Signed-off-by: Valentin Ochs <a@0au.de>
---
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -102,7 +102,7 @@
  * through arch/um/include/uml-config.h; this fixdep "bug" makes sure that
  * those files will have correct dependencies.
  */
 
+#define _POSIX_C_SOURCE 200809L
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
--- a/scripts/kconfig/lex.zconf.c_shipped
+++ b/scripts/kconfig/lex.zconf.c_shipped
@@ -35,6 +35,7 @@
 /* First, we deal with  platform-specific or compiler-specific issues. */
 
 /* begin standard C headers. */
+#define _POSIX_C_SOURCE 200809L
 #include <stdio.h>
 #include <string.h>
 #include <errno.h>
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -7,7 +7,7 @@
  *
  * i18n, 2005, Arnaldo Carvalho de Melo <acme@conectiva.com.br>
  */
 
+#define _POSIX_C_SOURCE 200809L
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
