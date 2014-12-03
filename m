Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:44993 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751341AbaLCGwm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2014 01:52:42 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kbuild: fix scripts/headers.sh to see the correct Kbuild path
Date: Wed,  3 Dec 2014 15:52:15 +0900
Message-Id: <1417589535-15867-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kernel@vger.kernel.org

The exported headers were moved to "uapi" directories.
We should check the existence of arch/*/include/uapi/asm/Kbuild.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 scripts/headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/headers.sh b/scripts/headers.sh
index 95ece06..b164336 100755
--- a/scripts/headers.sh
+++ b/scripts/headers.sh
@@ -6,7 +6,7 @@ set -e
 
 do_command()
 {
-	if [ -f ${srctree}/arch/$2/include/asm/Kbuild ]; then
+	if [ -f ${srctree}/arch/$2/include/uapi/asm/Kbuild ]; then
 		make ARCH=$2 KBUILD_HEADERS=$1 headers_$1
 	else
 		printf "Ignoring arch: %s\n" ${arch}
-- 
1.9.1

