Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:19685 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfEYLtk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 May 2019 07:49:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kconfig: tests: fix recursive inclusion unit test
Date: Sat, 25 May 2019 20:49:19 +0900
Message-Id: <20190525114919.26188-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Adding SPDX license identifier is pretty safe; however, here is one
exception.

Since commit ec8f24b7faaf ("treewide: Add SPDX license identifier -
Makefile/Kconfig"), "make testconfig" would not pass.

When Kconfig detects a circular file inclusion, it displays error
messages with a file name and a line number prefixed to each line.

The unit test checks if Kconfig emits the error messages correctly
(this also checks the line number correctness).

Now that the test input has the SPDX license identifier at the very top,
the line numbers in the expected stderr should be incremented by 1.

Fixes: ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/tests/err_recursive_inc/expected_stderr | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/tests/err_recursive_inc/expected_stderr b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
index 6b582eee2176..b070a31fdfeb 100644
--- a/scripts/kconfig/tests/err_recursive_inc/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
@@ -1,6 +1,6 @@
 Recursive inclusion detected.
 Inclusion path:
   current file : Kconfig.inc1
-  included from: Kconfig.inc3:1
-  included from: Kconfig.inc2:3
-  included from: Kconfig.inc1:4
+  included from: Kconfig.inc3:2
+  included from: Kconfig.inc2:4
+  included from: Kconfig.inc1:5
-- 
2.17.1
