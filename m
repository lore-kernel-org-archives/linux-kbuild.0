Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:56449 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751637AbdIVFcv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Sep 2017 01:32:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/2] kbuild: mkcompile_h: do not create .version
Date: Fri, 22 Sep 2017 14:31:14 +0900
Message-Id: <1506058274-30516-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506058274-30516-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

This script need not to create .version; it will be created by
scripts/link-vmlinux.sh later.  Clean-up the code slightly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mkcompile_h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index fd8fdb9..f1ee4eb 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -27,12 +27,7 @@ LC_ALL=C
 export LC_ALL
 
 if [ -z "$KBUILD_BUILD_VERSION" ]; then
-	if [ -r .version ]; then
-		VERSION=`cat .version`
-	else
-		VERSION=0
-		echo 0 > .version
-	fi
+	VERSION=$(cat .version 2>/dev/null || echo 1)
 else
 	VERSION=$KBUILD_BUILD_VERSION
 fi
-- 
2.7.4

