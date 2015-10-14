Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37990 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752214AbbJNN5f (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 09:57:35 -0400
From: Gabriel de Perthuis <g2p.code@gmail.com>
Subject: [PATCH 1/2] kconfig/merge_config.sh: Support KCONFIG_CONFIG
Message-ID: <561E5F4A.3060605@gmail.com>
Date: Wed, 14 Oct 2015 15:57:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

All make targets support $KCONFIG_CONFIG because they
run scripts/kconf.  Make sure merge_config.sh accesses the
correct file in all cases.

Previously this script broke in two different code paths,
one for targets like kvmconfig (which use merge_config.sh -m
then call a target that respects KCONFIG_CONFIG) and one for
direct use of the script without -m, which called make rules
that edit KCONFIG_CONFIG but verified a different file.

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>
---
  scripts/kconfig/merge_config.sh | 16 ++++++++++++----
  1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh 
b/scripts/kconfig/merge_config.sh
index 0d883b3..6765353 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -30,11 +30,11 @@ usage() {
  	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
  	echo "  -h    display this help text"
  	echo "  -m    only merge the fragments, do not execute the make command"
  	echo "  -n    use allnoconfig instead of alldefconfig"
  	echo "  -r    list redundant entries when merging fragments"
-	echo "  -O    dir to put generated output files"
+	echo "  -O    dir to put generated output files.  Consider setting 
\$KCONFIG_CONFIG instead."
  }
   RUNMAKE=true
  ALLTARGET=alldefconfig
  WARNREDUN=false
@@ -80,10 +80,18 @@ done
  if [ "$#" -lt 2 ] ; then
  	usage
  	exit
  fi
  +if [ -z "$KCONFIG_CONFIG" ]; then
+	if [ "$OUTPUT" != . ]; then
+		KCONFIG_CONFIG=$(readlink -m -- "$OUTPUT/.config")
+	else
+		KCONFIG_CONFIG=.config
+	fi
+fi
+
  INITFILE=$1
  shift;
   if [ ! -r "$INITFILE" ]; then
  	echo "The base file '$INITFILE' does not exist.  Exit." >&2
@@ -122,13 +130,13 @@ for MERGE_FILE in $MERGE_LIST ; do
  	done
  	cat $MERGE_FILE >> $TMP_FILE
  done
   if [ "$RUNMAKE" = "false" ]; then
-	cp $TMP_FILE $OUTPUT/.config
+	cp -T -- "$TMP_FILE" "$KCONFIG_CONFIG"
  	echo "#"
-	echo "# merged configuration written to $OUTPUT/.config (needs make)"
+	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
  	echo "#"
  	clean_up
  	exit
  fi
  @@ -148,11 +156,11 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG 
$ALLTARGET
   # Check all specified config values took (might have 
missed-dependency issues)
  for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
   	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)
+	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
  	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
  		echo "Value requested for $CFG not in final .config"
  		echo "Requested value:  $REQUESTED_VAL"
  		echo "Actual value:     $ACTUAL_VAL"
  		echo ""
-- 
2.6.0.5.gb9412f4


