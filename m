Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:41642 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751707AbaLCG4E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2014 01:56:04 -0500
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH] kconfig: fix a misspelling in scripts/kconfig/merge_config.sh
Date: Wed,  3 Dec 2014 15:55:49 +0900
Message-Id: <1417589750-16011-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kernel@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 81b0c61..efa4733 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -87,7 +87,7 @@ TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
 
-# Merge files, printing warnings on overrided values
+# Merge files, printing warnings on overridden values
 for MERGE_FILE in $MERGE_LIST ; do
 	echo "Merging $MERGE_FILE"
 	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
-- 
1.9.1

