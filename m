Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:36046 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730414AbfC3ME2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Mar 2019 08:04:28 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] kbuild: mkmakefile: do not check the generated Makefile marker
Date: Sat, 30 Mar 2019 21:04:15 +0900
Message-Id: <1553947458-8311-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
References: <1553947458-8311-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This hunk was added to avoid accidental overwrite of the top Makefile
in case O= points to the top of the source tree.

As commit 4f1127e20437 ("kbuild: fix infinite make recursion"),
it caused some troubles in the past because Kbuild assumes O=
as out-of-tree build, while it actually works in the source tree.

Now this works more properly; if O= points to the source directory,
it is handled as in-tree build. So, this sanity check is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mkmakefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index 412f13f..31de468 100755
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -7,12 +7,6 @@
 # Usage
 # $1 - Kernel src directory
 
-# Only overwrite automatically generated Makefiles
-# (so we do not overwrite kernel Makefile)
-if test -e Makefile && ! grep -q Automatically Makefile
-then
-	exit 0
-fi
 if [ "${quiet}" != "silent_" ]; then
 	echo "  GEN     Makefile"
 fi
-- 
2.7.4
