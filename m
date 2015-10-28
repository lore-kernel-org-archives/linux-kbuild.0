Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:36058 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755025AbbJ1Am6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:58 -0400
Received: by pacik9 with SMTP id ik9so26376101pac.3
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:57 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 09/10] merge_config.sh: allow single configs to be passed in on cmdline
Date: Wed, 28 Oct 2015 09:42:10 +0900
Message-Id: <1445992931-28107-10-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Treat CONFIG_FOO=..  on the command line the same way as a single-entry file would.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index b26c0ef..69463dd 100755
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
@@ -108,7 +108,26 @@ fi
 
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
2.1.4

