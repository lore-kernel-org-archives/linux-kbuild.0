Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:33174 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070AbbETWCn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:43 -0400
Received: by pdbqa5 with SMTP id qa5so83658083pdb.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:43 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 08/10] merge_config.sh: use trap for cleanup
Date: Wed, 20 May 2015 15:00:58 -0700
Message-Id: <1432159260-39390-9-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Use the trap to cleanup even on regular exit.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 932fd52..fd27294 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -23,10 +23,12 @@
 EXITVAL=0
 
 clean_up() {
-	rm -f $TMP_FILE
+	if [ -n "$CLEAN_FILES" ] ; then
+		rm -f $CLEAN_FILES
+	fi
 	exit $EXITVAL
 }
-trap clean_up HUP INT TERM
+trap clean_up HUP INT TERM EXIT
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
@@ -166,4 +168,4 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 	fi >&2
 done
 
-clean_up
+# Note: clean_up will run here due to EXIT being trapped
-- 
1.7.10.4

