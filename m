Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:46374 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751919AbaE3LMI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2014 07:12:08 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 3/7] scripts: objdiff: remove unnecessary code
Date: Fri, 30 May 2014 20:11:51 +0900
Message-Id: <1401448315-800-4-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

The directories for objdump is created by the code
a few lines below:

  [ ! -d "$OBJDIFFD/$dn" ] && mkdir -p "$OBJDIFFD/$dn"

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
---
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

