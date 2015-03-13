Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57781 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751946AbbCMGW1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:27 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] merge_config.sh: improve indentation
Date: Fri, 13 Mar 2015 15:21:41 +0900
Message-Id: <1426227703-31815-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

It is true that we do not want to move the code too far to the
right, but something like below is not preferred:

    if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
    echo Value of $CFG is redefined by fragment $MERGE_FILE:
    echo Previous  value: $PREV_VAL
    echo New value:       $NEW_VAL
    echo
    elif [ "$WARNREDUN" = "true" ]; then
    echo Value of $CFG is redundant by fragment $MERGE_FILE:
    fi

To fix this, call "continue" if the "grep" command fails to find the
given CONFIG.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/merge_config.sh | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 88d89b2..56584b1 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -103,20 +103,18 @@ for MERGE_FILE in $MERGE_LIST ; do
 	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
-		grep -q -w $CFG $TMP_FILE
-		if [ $? -eq 0 ] ; then
-			PREV_VAL=$(grep -w $CFG $TMP_FILE)
-			NEW_VAL=$(grep -w $CFG $MERGE_FILE)
-			if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+		grep -q -w $CFG $TMP_FILE || continue
+		PREV_VAL=$(grep -w $CFG $TMP_FILE)
+		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			echo Value of $CFG is redefined by fragment $MERGE_FILE:
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
-			elif [ "$WARNREDUN" = "true" ]; then
+		elif [ "$WARNREDUN" = "true" ]; then
 			echo Value of $CFG is redundant by fragment $MERGE_FILE:
-			fi
-			sed -i "/$CFG[ =]/d" $TMP_FILE
 		fi
+		sed -i "/$CFG[ =]/d" $TMP_FILE
 	done
 	cat $MERGE_FILE >> $TMP_FILE
 done
-- 
1.9.1

