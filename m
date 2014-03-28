Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:62527 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750955AbaC1Hgb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Mar 2014 03:36:31 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile13) with ESMTP id s2S7aTKR004557
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2014 16:36:29 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili17) with ESMTP id s2S7aT308556
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2014 16:36:29 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: remove redundant '.*.cmd' pattern from make distclean
Date: Fri, 28 Mar 2014 16:36:12 +0900
Message-Id: <1395992172-12950-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

'.*.cmd' files are cleaned-up by "make clean".
The same pattern in "make distclean" is unnecessary.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index da9f75a..1dbb82c 100644
--- a/Makefile
+++ b/Makefile
@@ -1162,8 +1162,7 @@ distclean: mrproper
 	@find $(srctree) $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
-		-o -name '.*.rej' \
-		-o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
+		-o -name '.*.rej' -o -name '*%'  -o -name 'core' \) \
 		-type f -print | xargs rm -f
 
 
-- 
1.8.3.2

