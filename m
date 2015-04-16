Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gproxy6-pub.mail.unifiedlayer.com ([67.222.39.168]:37159 "HELO
	gproxy6-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751589AbbDPTOe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 15:14:34 -0400
From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: [PATCH] kbuild/tags.sh: use cscope -q option for building symbol db
Date: Thu, 16 Apr 2015 12:14:17 -0700
Message-Id: <1429211657-2486-1-git-send-email-jbarnes@virtuousgeek.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz

This takes up a bit more disk space, but really improves symbol lookup
performance.

Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 scripts/tags.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index cdb491d..bb35d83 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -142,7 +142,7 @@ all_defconfigs()
 docscope()
 {
 	(echo \-k; echo \-q; all_target_sources) > cscope.files
-	cscope -b -f cscope.out
+	cscope -q -b -f cscope.out
 }
 
 dogtags()
-- 
1.9.1

