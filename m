Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:46369 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752220AbaE3LMI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 30 May 2014 07:12:08 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 6/7] scripts: objdiff: fix a comment
Date: Fri, 30 May 2014 20:11:54 +0900
Message-Id: <1401448315-800-7-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
---
 scripts/objdiff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index c997e44..4d3a197 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -70,7 +70,7 @@ dorecord() {
 
 		[ ! -d "$dir" ] && mkdir -p $dir
 
-		# remove addresses for a more clear diff
+		# remove addresses for a clearer diff
 		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
 		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
 	done
-- 
1.9.1

