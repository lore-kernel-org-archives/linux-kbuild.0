Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:50798 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754290AbaFICRw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:52 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 3/7] scripts: objdiff: remove unnecessary code
Date: Mon,  9 Jun 2014 11:16:36 +0900
Message-Id: <1402280200-21834-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>

The directories for objdump is created by the code
a few lines below:

  [ ! -d "$OBJDIFFD/$dn" ] && mkdir -p "$OBJDIFFD/$dn"

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---

Changes in v2: None

 scripts/objdiff | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index cc67365..6e72f96 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -52,8 +52,6 @@ dorecord() {
 	OBJDUMP="${CROSS_COMPILE}objdump"
 	OBJDIFFD="$TMPD/$CMT"
 
-	[ ! -d "$OBJDIFFD" ] && mkdir -p "$OBJDIFFD"
-
 	for f in $FILES; do
 		dn="${f%/*}"
 		bn="${f##*/}"
-- 
1.9.1

