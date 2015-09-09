Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:37423 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751390AbbIIRdn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Sep 2015 13:33:43 -0400
From: Gabriel de Perthuis <g2p.code@gmail.com>
Subject: [PATCH 1/2] kconfig/merge_config.sh: Support KCONFIG_CONFIG
Message-ID: <55F06D73.70303@gmail.com>
Date: Wed, 9 Sep 2015 19:33:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

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
  scripts/kconfig/merge_config.sh | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh 
b/scripts/kconfig/merge_config.sh
index 0d883b3..5f1e110 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -122,13 +122,13 @@ for MERGE_FILE in $MERGE_LIST ; do
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
  @@ -148,11 +148,11 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG 
$ALLTARGET
   # Check all specified config values took (might have 
missed-dependency issues)
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
2.6.0.rc0.29.g24f8d8a


