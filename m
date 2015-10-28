Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:34976 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752330AbbJ1Amd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:33 -0400
Received: by pasz6 with SMTP id z6so237743052pas.2
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:33 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 01/10] merge_config.sh: factor out value parsing
Date: Wed, 28 Oct 2015 09:42:02 +0900
Message-Id: <1445992931-28107-2-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Since we want to adjust the line later on to deal with CONFIG_FOO=n,
let's make a function for it so we have only one place to change it in.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 67d1314..d8cd913 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -35,6 +35,10 @@ usage() {
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 }
 
+getval() {
+	grep -w -e "$1" "$2"
+}
+
 RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
@@ -116,8 +120,8 @@ for MERGE_FILE in $MERGE_LIST ; do
 
 	for CFG in $CFG_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
-		PREV_VAL=$(grep -w $CFG $TMP_FILE)
-		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+		PREV_VAL=$(getval "$CFG" "$TMP_FILE")
+		NEW_VAL=$(getval "$CFG" "$MERGE_FILE")
 		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			echo Value of $CFG is redefined by fragment $MERGE_FILE:
 			echo Previous  value: $PREV_VAL
@@ -157,8 +161,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
-	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
+	REQUESTED_VAL=$(getval "$CFG" "$TMP_FILE")
+	ACTUAL_VAL=$(getval "$CFG" "$KCONFIG_CONFIG")
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
-- 
2.1.4

