Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e31.co.us.ibm.com ([32.97.110.149]:55934 "EHLO
	e31.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756718Ab2CVWGL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Mar 2012 18:06:11 -0400
Received: from /spool/local
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <jstultz@us.ibm.com>;
	Thu, 22 Mar 2012 16:06:11 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com [9.17.195.228])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id B006E19D804E
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:06:00 -0600 (MDT)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q2MM62QS164800
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:06:04 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q2MM5raT022254
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Mar 2012 16:05:53 -0600
From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] merge_config.sh: Add option to display redundant configs
Date: Thu, 22 Mar 2012 15:05:49 -0700
Message-Id: <1332453949-5872-3-git-send-email-john.stultz@linaro.org>
In-Reply-To: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
References: <1332453949-5872-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.cz>, Bruce.Ashfield@windriver.com, Darren Hart <dvhart@linux.intel.com>

Provide a -r option to display when fragments contain reundent
options

CC: Michal Marek <mmarek@suse.cz>
CC: Bruce.Ashfield@windriver.com
CC: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 scripts/kconfig/merge_config.sh |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index ceadf0e..d92edc3 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -31,10 +31,12 @@ usage() {
 	echo "  -h    display this help text"
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
+	echo "  -r    list redundant enteries when merging fragments"
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
@@ -79,6 +86,10 @@ for MERGE_FILE in $MERGE_LIST ; do
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
+			else
+			if [ "$WARNREDUN" = "true" ]; then
+			echo Value of $CFG is redundant by fragment $MERGE_FILE:
+			fi
 			fi
 			sed -i "/$CFG[ =]/d" $TMP_FILE
 		fi
-- 
1.7.3.2.146.gca209

