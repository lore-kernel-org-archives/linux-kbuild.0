Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:42179 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756518AbZINVtf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2009 17:49:35 -0400
Message-Id: <200909142149.n8ELnIHE018950@imap1.linux-foundation.org>
Subject: [patch 17/18] kbuild: fail build if recordmcount.pl fails
From: akpm@linux-foundation.org
Date: Mon, 14 Sep 2009 14:49:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, andi@firstfloor.org, ak@linux.intel.com

From: Andi Kleen <andi@firstfloor.org>

When this script fails the build should fail too. Otherwise there
are mysterious build failures later.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/Makefile.build |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/Makefile.build~kbuild-fail-build-if-recordmcountpl-fails scripts/Makefile.build
--- a/scripts/Makefile.build~kbuild-fail-build-if-recordmcountpl-fails
+++ a/scripts/Makefile.build
@@ -206,7 +206,7 @@ cmd_modversions =							\
 endif
 
 ifdef CONFIG_FTRACE_MCOUNT_RECORD
-cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
+cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC)" "$(LD)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
_
