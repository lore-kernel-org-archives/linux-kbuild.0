Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:33312 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753686AbbETWCe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:34 -0400
Received: by padbw4 with SMTP id bw4so81627195pad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:33 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 01/10] merge_config.sh: factor out value parsing
Date: Wed, 20 May 2015 15:00:51 -0700
Message-Id: <1432159260-39390-2-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Since we want to adjust the line later on to deal with CONFIG_FOO=n,
let's make a function for it so we have only one place to change it in.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ec8e203..430d002 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -35,6 +35,10 @@ usage() {
 	echo "  -O    dir to put generated output files"
 }
 
+getval() {
+	grep -w -e "$1" "$2"
+}
+
 RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
@@ -104,8 +108,8 @@ for MERGE_FILE in $MERGE_LIST ; do
 
 	for CFG in $CFG_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
-		PREV_VAL=$(grep -w $CFG $TMP_FILE)
-		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+		PREV_VAL=$(getval "$CFG" "$TMP_FILE")
+		NEW_VAL=$(getval "$CFG" "$MERGE_FILE")
 		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			echo Value of $CFG is redefined by fragment $MERGE_FILE:
 			echo Previous  value: $PREV_VAL
@@ -145,8 +149,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
-	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)
+	REQUESTED_VAL=$(getval "$CFG" "$TMP_FILE")
+	ACTUAL_VAL=$(getval "$CFG" "$OUTPUT/.config")
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
-- 
1.7.10.4

