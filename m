Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:34956 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754119AbbETWCo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:44 -0400
Received: by pacwv17 with SMTP id wv17so81626276pac.2
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:44 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 09/10] merge_config.sh: allow single configs to be passed in on cmdline
Date: Wed, 20 May 2015 15:00:59 -0700
Message-Id: <1432159260-39390-10-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Treat CONFIG_FOO=..  on the command line the same way as a single-entry file would.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |   29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index fd27294..bcb9649 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -1,8 +1,8 @@
 #!/bin/sh
-#  merge_config.sh - Takes a list of config fragment values, and merges
-#  them one by one. Provides warnings on overridden values, and specified
-#  values that did not make it to the resulting .config file (due to missed
-#  dependencies or config symbol removal).
+#  merge_config.sh - Takes a list of config fragment filenames or configuration
+#  value, and merges them one by one. Provides warnings on overridden values,
+#  and specified values that did not make it to the resulting .config file
+#  (due to missed dependencies or config symbol removal).
 #
 #  Portions reused from kconf_check and generate_cfg:
 #  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
@@ -100,7 +100,26 @@ fi
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp $OUTPUT/.tmp.config.XXXXXXXXXX)
+
+CLEAN_FILES=$TMP_FILE
+
+# Process cmdline configs into temporary fragments
+for ENTRY in $MERGE_LIST ; do
+	case $ENTRY in
+	CONFIG*)
+		FF=$(mktemp $OUTPUT/.temp.frag-cmdline.XXXXX)
+		CLEAN_FILES="$CLEAN_FILES $FF"
+		echo $ENTRY > $FF
+		NEW_LIST="$NEW_LIST $FF"
+		;;
+	*)
+		NEW_LIST="$NEW_LIST $ENTRY"
+		;;
+	esac
+done
+
+MERGE_LIST=$NEW_LIST
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
-- 
1.7.10.4

