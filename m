Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33372 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755000AbbJ1Amz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:55 -0400
Received: by pabla5 with SMTP id la5so44900801pab.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:54 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 08/10] merge_config.sh: use trap for cleanup
Date: Wed, 28 Oct 2015 09:42:09 +0900
Message-Id: <1445992931-28107-9-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Use the trap to cleanup even on regular exit.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 1945b2c..b26c0ef 100755
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
@@ -178,4 +180,4 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 	fi >&2
 done
 
-clean_up
+# Note: clean_up will run here due to EXIT being trapped
-- 
2.1.4

