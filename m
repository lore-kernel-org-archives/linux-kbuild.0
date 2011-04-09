Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from paul.0au.de ([94.23.237.123]:40616 "EHLO 0au.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755660Ab1DIUzv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Apr 2011 16:55:51 -0400
Received: from mail by 0au.de with spam-scanned (Exim 4.74)
	(envelope-from <a@0au.de>)
	id 1Q8fCB-0005XJ-0n
	for linux-kbuild@vger.kernel.org; Sat, 09 Apr 2011 22:55:51 +0200
Date: Sat, 9 Apr 2011 22:55:32 +0200
From: Valentin Ochs <a@0au.de>
Subject: [PATCH] fixdep: define _POSIX_C_SOURCE
Message-ID: <20110409205532.GE4663@erwin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: trivial@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

fixdep.c uses PATH_MAX without defining the required _POSIX_C_SOURCE
feature test macro.  This prevents compilation with the musl libc.
The patch applies to 2.6.38.2.

Best regards,
Valentin

Signed-off-by: Valentin Ochs <a@0au.de>
---
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -102,6 +102,7 @@
  * through arch/um/include/uml-config.h; this fixdep "bug" makes sure that
  * those files will have correct dependencies.
  */
+#define _POSIX_C_SOURCE 200809L
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/mman.h>
