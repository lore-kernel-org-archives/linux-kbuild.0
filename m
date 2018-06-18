Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:37407 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935127AbeFRRpc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jun 2018 13:45:32 -0400
From: Sven Joachim <svenjoac@gmx.de>
Subject: [PATCH] stack-protector: Fix test with 32-bit userland and CONFIG_64BIT=y
Date: Mon, 18 Jun 2018 19:45:25 +0200
Message-ID: <874li0vvii.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

When building a 64-bit 4.18-rc1 kernel with a 32-bit userland, I
noticed that stack protection was silently disabled.  Adding -m64 in
gcc-x86_64-has-stack-protector.sh fixed that, similar to what has been
noticed in commit 2a61f4747eea ("stack-protector: test compiler
capability in Kconfig and drop AUTO mode") for
gcc-x86_32-has-stack-protector.sh.

Signed-off-by: Sven Joachim <svenjoac@gmx.de>
---
 scripts/gcc-x86_64-has-stack-protector.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gcc-x86_64-has-stack-protector.sh b/scripts/gcc-x86_64-has-stack-protector.sh
index 3755af0cd9f7..75e4e22b986a 100755
--- a/scripts/gcc-x86_64-has-stack-protector.sh
+++ b/scripts/gcc-x86_64-has-stack-protector.sh
@@ -1,4 +1,4 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
+echo "int foo(void) { char X[200]; return 3; }" | $* -S -x c -c -m64 -O0 -mcmodel=kernel -fno-PIE -fstack-protector - -o - 2> /dev/null | grep -q "%gs"
-- 
2.17.1

