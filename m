Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:34010 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754401AbaFJHgZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 03:36:25 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile11) with ESMTP id s5A7aNfF028738
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 16:36:23 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili15) with ESMTP id s5A7aOB08880
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Jun 2014 16:36:24 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: fix a typo in a kbuild document
Date: Tue, 10 Jun 2014 16:36:14 +0900
Message-Id: <1402385774-3748-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 Documentation/kbuild/makefiles.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d567a7c..c600e2f 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1171,7 +1171,7 @@ When kbuild executes, the following steps are followed (roughly):
 	      obvious reason.
 
     dtc
-	Create flattend device tree blob object suitable for linking
+	Create flattened device tree blob object suitable for linking
 	into vmlinux. Device tree blobs linked into vmlinux are placed
 	in an init section in the image. Platform code *must* copy the
 	blob to non-init memory prior to calling unflatten_device_tree().
-- 
1.9.1

