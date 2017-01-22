Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef006-v.nifty.com ([210.131.4.243]:36496 "EHLO
        condef006-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbdAVOLn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Jan 2017 09:11:43 -0500
Received: from conuserg-07.nifty.com ([10.26.8.70])by condef006-v.nifty.com with ESMTP id v0ME2wxZ000429
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Jan 2017 23:02:58 +0900
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: drop unneeded patterns '.*.orig' and '.*.rej' from distclean
Date: Sun, 22 Jan 2017 23:02:32 +0900
Message-Id: <1485093752-16470-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The patterns '.*.orig' and '.*.rej' are cleaned away by '*.orig' and
'*.rej' seen two lines above.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 96e2352..303ada8 100644
--- a/Makefile
+++ b/Makefile
@@ -1313,8 +1313,8 @@ PHONY += distclean
 distclean: mrproper
 	@find $(srctree) $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
-		-o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
-		-o -name '.*.rej' -o -name '*%'  -o -name 'core' \) \
+		-o -name '*.bak' -o -name '#*#' -o -name '*%' \
+		-o -name 'core' \) \
 		-type f -print | xargs rm -f
 
 
-- 
2.7.4

