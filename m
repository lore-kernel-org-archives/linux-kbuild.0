Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:42097 "EHLO frisell.zx2c4.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932581AbbGGScx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jul 2015 14:32:53 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] Makefile: Force gzip and xz on module install
Date: Tue,  7 Jul 2015 20:26:07 +0200
Message-Id: <1436293567-20226-1-git-send-email-Jason@zx2c4.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>

Running `make modules_install` ordinarily will overwrite existing
modules. This is the desired behavior, and is how pretty much every
other `make install` target works.

However, if CONFIG_MODULE_COMPRESS is enabled, modules are passed
through gzip and xz which then do the file writing. Both gzip and xz
will error out if the file already exists, unless -f is passed.

This patch adds -f so that the behavior is uniform.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6c6f146..5d2ec1c 100644
--- a/Makefile
+++ b/Makefile
@@ -849,10 +849,10 @@ export mod_strip_cmd
 mod_compress_cmd = true
 ifdef CONFIG_MODULE_COMPRESS
   ifdef CONFIG_MODULE_COMPRESS_GZIP
-    mod_compress_cmd = gzip -n
+    mod_compress_cmd = gzip -n -f
   endif # CONFIG_MODULE_COMPRESS_GZIP
   ifdef CONFIG_MODULE_COMPRESS_XZ
-    mod_compress_cmd = xz
+    mod_compress_cmd = xz -f
   endif # CONFIG_MODULE_COMPRESS_XZ
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
-- 
2.4.2

