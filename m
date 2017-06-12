Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:36640 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751989AbdFLIWc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2017 04:22:32 -0400
From: Jonathan Liu <net147@gmail.com>
Subject: [PATCH] scripts/mkcompile_h: Remove trailing spaces from compiler version
Date: Mon, 12 Jun 2017 18:23:17 +1000
Message-Id: <20170612082317.20407-1-net147@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Liu <net147@gmail.com>

Improves the output of "cat /proc/version" by getting rid of the
trailing space at the end of the compiler version when the kernel
is compiled using GCC.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 6fdc97ef6023..fd8fdb91581d 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -76,7 +76,7 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
   echo \#define LINUX_COMPILE_BY \"`echo $LINUX_COMPILE_BY | $UTS_TRUNCATE`\"
   echo \#define LINUX_COMPILE_HOST \"`echo $LINUX_COMPILE_HOST | $UTS_TRUNCATE`\"
 
-  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version '`\"
+  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
 ) > .tmpcompile
 
 # Only replace the real compile.h if the new one is different,
-- 
2.12.2

