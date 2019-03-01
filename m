Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:16716 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfCAHKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 02:10:53 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] kbuild: update comment block of scripts/clang-version.sh
Date: Fri,  1 Mar 2019 16:10:20 +0900
Message-Id: <1551424222-3727-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit 469cb7376c06 ("kconfig: add CC_IS_CLANG and CLANG_VERSION")
changed the code, but missed to update the comment block.

The -p option was gone, and the output is 5-digit (or 6-digit when
Clang 10 is released).

Update the comment now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/clang-version.sh | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/clang-version.sh b/scripts/clang-version.sh
index e65fbc3..6fabf06 100755
--- a/scripts/clang-version.sh
+++ b/scripts/clang-version.sh
@@ -1,14 +1,10 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 #
-# clang-version [-p] clang-command
-#
-# Prints the compiler version of `clang-command' in a canonical 4-digit form
-# such as `0500' for clang-5.0 etc.
-#
-# With the -p option, prints the patchlevel as well, for example `050001' for
-# clang-5.0.1 etc.
+# clang-version clang-command
 #
+# Print the compiler version of `clang-command' in a 5 or 6-digit form
+# such as `50001' for clang-5.0.1 etc.
 
 compiler="$*"
 
-- 
2.7.4
