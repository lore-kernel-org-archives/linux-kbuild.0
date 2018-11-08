Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45722 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbeKIFVr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 00:21:47 -0500
Received: by mail-lj1-f196.google.com with SMTP id s5-v6so5244ljd.12
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Nov 2018 11:44:49 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2] scripts/kconfig/merge_config: don't redefine 'y' to 'm'
Date: Thu,  8 Nov 2018 20:44:34 +0100
Message-Id: <20181108194434.16568-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, dvhart@infradead.org
Cc: arnd@arndb.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>

In today's merge_config.sh the order of the config fragment files dictates
the output of a config option. With this approach we will get different
.config files depending on the order of the config fragment files.

So doing something like:
$ ./merge/kconfig/merge_config.sh selftest.config drm.config

Where selftest.config defines DRM=y and drm.config defines DRM=m, the
result will be "DRM=m".

Rework to add a switch to get builtin '=y' precedence over modules '=m',
this will result in "DRM=y". If we do something like this:

$ ./merge/kconfig/merge_config.sh -y selftest.config drm.config

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 scripts/kconfig/merge_config.sh | 34 +++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index da66e7742282..fcd18f642fc7 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -22,6 +22,7 @@
 
 clean_up() {
 	rm -f $TMP_FILE
+	rm -f $MERGE_FILE
 	exit
 }
 trap clean_up HUP INT TERM
@@ -32,6 +33,7 @@ usage() {
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
+	echo "  -y    make builtin have precedence over modules"
 	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 	echo
 	echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
@@ -40,6 +42,8 @@ usage() {
 RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
+BUILTIN=false
+BUILTIN_FLAG=false
 OUTPUT=.
 CONFIG_PREFIX=${CONFIG_-CONFIG_}
 
@@ -64,6 +68,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-y")
+		BUILTIN=true
+		shift
+		continue
+		;;
 	"-O")
 		if [ -d $2 ];then
 			OUTPUT=$(echo $2 | sed 's/\/*$//')
@@ -105,13 +114,15 @@ MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+MERGE_FILE=$(mktemp ./.merge_tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
 
 # Merge files, printing warnings on overridden values
-for MERGE_FILE in $MERGE_LIST ; do
-	echo "Merging $MERGE_FILE"
+for ORIG_MERGE_FILE in $MERGE_LIST ; do
+	cat $ORIG_MERGE_FILE > $MERGE_FILE
+	echo "Merging $ORIG_MERGE_FILE"
 	if [ ! -r "$MERGE_FILE" ]; then
 		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
@@ -122,15 +133,26 @@ for MERGE_FILE in $MERGE_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
 		PREV_VAL=$(grep -w $CFG $TMP_FILE)
 		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
-		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
-			echo Value of $CFG is redefined by fragment $MERGE_FILE:
+		if [ "$BUILTIN" = "true" ] && [ "${NEW_VAL#CONFIG_*=}" = "m" ] && [ "${PREV_VAL#CONFIG_*=}" = "y" ]; then
+			echo Previous  value: $PREV_VAL
+			echo New value:       $NEW_VAL
+			echo -y passed, will not demote y to m
+			echo
+			BUILTIN_FLAG=true
+		elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+			echo Value of $CFG is redefined by fragment $ORIG_MERGE_FILE:
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
 		elif [ "$WARNREDUN" = "true" ]; then
-			echo Value of $CFG is redundant by fragment $MERGE_FILE:
+			echo Value of $CFG is redundant by fragment $ORIG_MERGE_FILE:
+		fi
+		if [ "$BUILTIN_FLAG" = "false" ]; then
+			sed -i "/$CFG[ =]/d" $TMP_FILE
+		else
+			sed -i "/$CFG[ =]/d" $MERGE_FILE
+			BUILTIN_FLAG=false
 		fi
-		sed -i "/$CFG[ =]/d" $TMP_FILE
 	done
 	cat $MERGE_FILE >> $TMP_FILE
 done
-- 
2.19.1
