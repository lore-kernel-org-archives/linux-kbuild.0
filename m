Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:34704 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754735AbbJ1Amh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:37 -0400
Received: by padhk11 with SMTP id hk11so238186878pad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:36 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 02/10] merge_config.sh: print warnings on stderr
Date: Wed, 28 Oct 2015 09:42:03 +0900
Message-Id: <1445992931-28107-3-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Makes it easier to grab just errors/warnings in a build log.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index d8cd913..0e98619 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -131,7 +131,7 @@ for MERGE_FILE in $MERGE_LIST ; do
 			echo Value of $CFG is redundant by fragment $MERGE_FILE:
 		fi
 		sed -i "/$CFG[ =]/d" $TMP_FILE
-	done
+	done >&2
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
@@ -168,7 +168,7 @@ for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 		echo "Requested value:  $REQUESTED_VAL"
 		echo "Actual value:     $ACTUAL_VAL"
 		echo ""
-	fi
+	fi >&2
 done
 
 clean_up
-- 
2.1.4

