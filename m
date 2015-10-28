Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:33199 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754901AbbJ1Amn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:43 -0400
Received: by pabla5 with SMTP id la5so44896006pab.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:42 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 04/10] merge_config.sh: exit non-0 in case of failures
Date: Wed, 28 Oct 2015 09:42:05 +0900
Message-Id: <1445992931-28107-5-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Exit with non-0 value in cases where there was a failure to set an option.
Also, add a '-e' during which the conflict warnings are considered failures
(-e -r will result in these being failures, -r will result in them just being
reported).

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index fd0d537..c244042 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -20,14 +20,17 @@
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 #  See the GNU General Public License for more details.
 
+EXITVAL=0
+
 clean_up() {
 	rm -f $TMP_FILE
-	exit
+	exit $EXITVAL
 }
 trap clean_up HUP INT TERM
 
 usage() {
 	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+	echo "  -e    consider conflicting overrides to be errors"
 	echo "  -h    display this help text"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
@@ -39,6 +42,7 @@ getval() {
 	grep -w -e "$1" "$2"
 }
 
+CONF_IS_ERR=false
 RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
@@ -46,6 +50,9 @@ OUTPUT=.
 
 while true; do
 	case $1 in
+	"-e")
+		CONF_IS_ERR=true
+		;;
 	"-n")
 		ALLTARGET=allnoconfig
 		;;
@@ -117,13 +124,19 @@ for MERGE_FILE in $MERGE_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
 		PREV_VAL=$(getval "$CFG" "$TMP_FILE")
 		NEW_VAL=$(getval "$CFG" "$MERGE_FILE")
+		WARN=false
 		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			echo Value of $CFG is redefined by fragment $MERGE_FILE:
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
+			WARN=true
 		elif [ "$WARNREDUN" = "true" ]; then
 			echo Value of $CFG is redundant by fragment $MERGE_FILE:
+			WARN=true
+		fi
+		if [ "$CONF_IS_ERR" = "true" -a "$WARN" = "true" ] ; then
+			EXITVAL=1
 		fi
 		sed -i "/$CFG[ =]/d" $TMP_FILE
 	done >&2
@@ -136,7 +149,7 @@ if [ "$RUNMAKE" = "false" ]; then
 	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
 	echo "#"
 	clean_up
-	exit
+	exit $EXITVAL
 fi
 
 # If we have an output dir, setup the O= argument, otherwise leave
@@ -152,10 +165,8 @@ fi
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
 make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
-
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
-
 	REQUESTED_VAL=$(getval "$CFG" "$TMP_FILE")
 	ACTUAL_VAL=$(getval "$CFG" "$KCONFIG_CONFIG")
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
@@ -163,6 +174,7 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 		echo "Requested value:  $REQUESTED_VAL"
 		echo "Actual value:     $ACTUAL_VAL"
 		echo ""
+		EXITVAL=1
 	fi >&2
 done
 
-- 
2.1.4

