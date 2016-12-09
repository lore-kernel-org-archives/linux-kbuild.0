Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35227 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752704AbcLICnv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Dec 2016 21:43:51 -0500
Date: Fri, 9 Dec 2016 11:43:57 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: [regression ?] kbuild: fix building bzImage with
 CONFIG_TRIM_UNUSED_KSYMS enabled
Message-ID: <20161209024357.GB4661@jagdpanzerIV.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@linaro.org>
Cc: Jarod Wilson <jarod@redhat.com>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

after 53924022d8a ("kbuild: fix building bzImage withCONFIG_TRIM_UNUSED_KSYMS
enabled") all of my build scripts build the kernel without the modules.

shouldn't that 'KBUILD_MODULES := 1' happen before we `export KBUILD_MODULES'?


this silly patch fixes the build for me:
======================================================================

From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] Kbuild: set KBUILD_MODULES before we export it

Tweak the KBUILD_MODULES flag for TRIM_UNUSED_KSYMS configs
before we `export' it.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 Makefile | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 369099d..035206e 100644
--- a/Makefile
+++ b/Makefile
@@ -336,6 +336,13 @@ ifeq ($(MAKECMDGOALS),)
   KBUILD_MODULES := 1
 endif
 
+# For the kernel to actually contain only the needed exported symbols,
+# we have to build modules as well to determine what those symbols are.
+# (this can be evaluated only once include/config/auto.conf has been included)
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+  KBUILD_MODULES := 1
+endif
+
 export KBUILD_MODULES KBUILD_BUILTIN
 export KBUILD_CHECKSRC KBUILD_SRC KBUILD_EXTMOD
 
@@ -607,13 +614,6 @@ else
 include/config/auto.conf: ;
 endif # $(dot-config)
 
-# For the kernel to actually contain only the needed exported symbols,
-# we have to build modules as well to determine what those symbols are.
-# (this can be evaluated only once include/config/auto.conf has been included)
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-  KBUILD_MODULES := 1
-endif
-
 # The all: target is the default when no target is given on the
 # command line.
 # This allow a user to issue only 'make' to build a kernel including modules
-- 
2.10.2

