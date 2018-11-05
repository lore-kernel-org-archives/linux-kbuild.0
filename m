Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:50915 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbeKERiv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 12:38:51 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] kconfig: merge_config: avoid false positive matches from comment lines
Date: Mon,  5 Nov 2018 17:19:36 +0900
Message-Id: <1541405976-13747-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Nasser <afshin.nasser@gmail.com>, Arnout Vandecappelle <arnout@mind.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The current SED_CONFIG_EXP could match to comment lines in config
fragment files, especially when CONFIG_PREFIX_ is empty. For example,
Buildroot uses empty prefixing; starting symbols with BR2_ is just
convention.

Make the sed expression more robust against false positives from
comment lines. The new sed expression matches to only valid patterns.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
---

Changes in v2:
  - Another (more precise) implementation approach
    based on the option from Arnout Vandecappelle.
    This is still easier to read, but adds a bit duplication.

 scripts/kconfig/merge_config.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index da66e77..0ef9064 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -102,7 +102,8 @@ if [ ! -r "$INITFILE" ]; then
 fi
 
 MERGE_LIST=$*
-SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
+SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
+SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
 
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
@@ -116,7 +117,7 @@ for MERGE_FILE in $MERGE_LIST ; do
 		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
 		exit 1
 	fi
-	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
+	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
 		grep -q -w $CFG $TMP_FILE || continue
@@ -159,7 +160,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
-for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
+for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
 
 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
 	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
-- 
2.7.4
