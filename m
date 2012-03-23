Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:50954 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755550Ab2CWTwt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Mar 2012 15:52:49 -0400
Received: from /spool/local
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <jstultz@us.ibm.com>;
	Fri, 23 Mar 2012 13:52:46 -0600
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 53C4BC90057
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Mar 2012 15:52:17 -0400 (EDT)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q2NJqHJS148416
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Mar 2012 15:52:17 -0400
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q2NJqG16019946
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Mar 2012 13:52:17 -0600
From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] merge_config.sh: Add option to display redundant configs
Date: Fri, 23 Mar 2012 12:52:08 -0700
Message-Id: <1332532328-32529-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

Provide a -r option to display when fragments contain redundant
options. This is really useful when breaking apart a config into
fragments, as well as cleaning up older fragments.

v2:
Now w/ spelling fixes! Thanks Darren!

CC: Michal Marek <mmarek@suse.cz>
CC: Bruce.Ashfield@windriver.com
CC: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 scripts/kconfig/merge_config.sh |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ceadf0e..ad8c76e 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -31,10 +31,12 @@ usage() {
 	echo "  -h    display this help text"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
+	echo "  -r    list redundant entries when merging fragments"
 }
 
 MAKE=true
 ALLTARGET=alldefconfig
+WARNREDUN=false
 
 while true; do
 	case $1 in
@@ -52,6 +54,11 @@ while true; do
 		usage
 		exit
 		;;
+	"-r")
+		WARNREDUN=true
+		shift
+		continue
+		;;
 	*)
 		break
 		;;
@@ -79,6 +86,8 @@ for MERGE_FILE in $MERGE_LIST ; do
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
+			elif [ "$WARNREDUN" = "true" ]; then
+			echo Value of $CFG is redundant by fragment $MERGE_FILE:
 			fi
 			sed -i "/$CFG[ =]/d" $TMP_FILE
 		fi
-- 
1.7.3.2.146.gca209

