Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:49489 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751266AbdFAO5w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jun 2017 10:57:52 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] kbuild: speed up checksyscalls.sh
Date: Thu,  1 Jun 2017 16:57:07 +0200
Message-Id: <20170601145707.590629-1-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, sam@ravnborg.org, Arnd Bergmann <arnd@arndb.de>

checksyscalls.sh is run at every "make" run while building the kernel,
even if no files have changed. I looked at where we spend time in
a trivial empty rebuild and found checksyscalls.sh to be a source
of noticeable overhead, as it spawns a lot of child processes just
to call 'cat' copying from stdin to stdout, once for each of the
over 400 x86 syscalls.

Using a shell-builtin (echo) instead of the external command gives
us a 13x speedup:

    Before		   After
real	0m1.018s       real	0m0.077s
user	0m0.068s       user	0m0.048s
sys	0m0.156s       sys	0m0.024s

The time it took to rebuild a single file on my machine dropped
from 5.5 seconds to 4.5 seconds.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/checksyscalls.sh | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 0cce56da3706..b8c9d2b04ffc 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -231,15 +231,12 @@ EOF
 }
 
 syscall_list() {
-    grep '^[0-9]' "$1" | sort -n | (
+    grep '^[0-9]' "$1" | sort -n |
 	while read nr abi name entry ; do
-	    cat <<EOF
-#if !defined(__NR_${name}) && !defined(__IGNORE_${name})
-#warning syscall ${name} not implemented
-#endif
-EOF
+		echo "#if !defined(__NR_${name}) && !defined(__IGNORE_${name})"
+		echo "#warning syscall ${name} not implemented"
+		echo "#endif"
 	done
-    )
 }
 
 (ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/syscall_32.tbl) | \
-- 
2.9.0

