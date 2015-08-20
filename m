Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:35353 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751759AbbHTNyg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 09:54:36 -0400
From: Gabriel de Perthuis <g2p.code@gmail.com>
Subject: [PATCH] kconfig/merge_config.sh: Support KCONFIG_CONFIG
Date: Thu, 20 Aug 2015 15:54:04 +0200
Message-Id: <fa926d9048b2f21727b863c60137fb9bb03cb8cf.1440078146.git.g2p.code@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel de Perthuis <g2p.code@gmail.com>

All make targets support $KCONFIG_CONFIG because they
run scripts/kconf.  Make sure this script accesses the
right file in all cases.

Previously this script broke in two different code paths,
one for targets like kvmconfig (which use -m then call
a target that respects KCONFIG_CONFIG) and one for
direct use of the script without -m, which called make
rules that edit KCONFIG_CONFIG but verified a different file.

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
---
 scripts/kconfig/merge_config.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ec8e203..7b53f02 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -118,13 +118,13 @@ for MERGE_FILE in $MERGE_LIST ; do
 	done
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
 if [ "$RUNMAKE" = "false" ]; then
-	cp $TMP_FILE $OUTPUT/.config
+	cp $TMP_FILE ${KCONFIG_CONFIG:=$OUTPUT/.config}
 	echo "#"
-	echo "# merged configuration written to $OUTPUT/.config (needs make)"
+	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
 	echo "#"
 	clean_up
 	exit
 fi
 
@@ -144,11 +144,11 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)
+	ACTUAL_VAL=$(grep -w -e "$CFG" ${KCONFIG_CONFIG:=$OUTPUT/.config})
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
 		echo "Actual value:     $ACTUAL_VAL"
 		echo ""
-- 
2.5.0.347.g10df1da

