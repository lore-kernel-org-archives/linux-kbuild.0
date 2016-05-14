Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:33680 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbcENAhD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 May 2016 20:37:03 -0400
Received: by mail-pa0-f53.google.com with SMTP id xk12so45846287pac.0
        for <linux-kbuild@vger.kernel.org>; Fri, 13 May 2016 17:37:02 -0700 (PDT)
From: Martin Kelly <martin@surround.io>
Subject: [PATCH] kconfig/merge_config.sh: add -C to choose make dir
Date: Fri, 13 May 2016 17:36:20 -0700
Message-Id: <1463186180-31967-1-git-send-email-martin@surround.io>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, Martin Kelly <martin@surround.io>

This is useful for running the script from somewhere besides the root of
the source tree.

Signed-off-by: Martin Kelly <martin@surround.io>
---
 scripts/kconfig/merge_config.sh | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d1314..36b545d 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -32,6 +32,7 @@ usage() {
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
+	echo "  -C    dir in which to run make"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 }
 
@@ -61,6 +62,16 @@ while true; do
 		shift
 		continue
 		;;
+	"-C")
+		if [ -d $2 ];then
+			MAKEDIR=$(echo $2 | sed 's/\/*$//')
+		else
+			echo "make directory $2 does not exist" 1>&2
+			exit 1
+		fi
+		shift 2
+		continue
+		;;
 	"-O")
 		if [ -d $2 ];then
 			OUTPUT=$(echo $2 | sed 's/\/*$//')
@@ -151,7 +162,7 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
+make -C "$MAKEDIR" KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-- 
2.1.4

