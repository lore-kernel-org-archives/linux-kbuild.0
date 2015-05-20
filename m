Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:36108 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753755AbbETWCf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:35 -0400
Received: by pabts4 with SMTP id ts4so81516965pab.3
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:35 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 02/10] merge_config.sh: print warnings on stderr
Date: Wed, 20 May 2015 15:00:52 -0700
Message-Id: <1432159260-39390-3-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Makes it easier to grab just errors/warnings in a build log.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 430d002..5a01aa6 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -119,7 +119,7 @@ for MERGE_FILE in $MERGE_LIST ; do
 			echo Value of $CFG is redundant by fragment $MERGE_FILE:
 		fi
 		sed -i "/$CFG[ =]/d" $TMP_FILE
-	done
+	done >&2
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
@@ -156,7 +156,7 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 		echo "Requested value:  $REQUESTED_VAL"
 		echo "Actual value:     $ACTUAL_VAL"
 		echo ""
-	fi
+	fi >&2
 done
 
 clean_up
-- 
1.7.10.4

