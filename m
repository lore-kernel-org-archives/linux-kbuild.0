Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53264 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754288AbaFICRw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:52 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 6/7] scripts: objdiff: fix a comment
Date: Mon,  9 Jun 2014 11:16:39 +0900
Message-Id: <1402280200-21834-7-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---

Changes in v2:
  - Minor change:  s/clearer/cleaner/

 scripts/objdiff | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index c997e44..0644898 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -70,7 +70,7 @@ dorecord() {
 
 		[ ! -d "$dir" ] && mkdir -p $dir
 
-		# remove addresses for a more clear diff
+		# remove addresses for a cleaner diff
 		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
 		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
 	done
-- 
1.9.1

