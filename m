Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:33150 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752677AbbJ1Amj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 Oct 2015 20:42:39 -0400
Received: by pabla5 with SMTP id la5so44894594pab.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Oct 2015 17:42:39 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 03/10] merge_config.sh: minor argument parsing refactoring
Date: Wed, 28 Oct 2015 09:42:04 +0900
Message-Id: <1445992931-28107-4-git-send-email-olof@lixom.net>
In-Reply-To: <1445992931-28107-1-git-send-email-olof@lixom.net>
References: <1445992931-28107-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@linux.intel.com, Olof Johansson <olof@lixom.net>

Every case that continues iterating needs a shift, so move it to common location.
Also, the continues are redundant.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 0e98619..fd0d537 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -48,13 +48,9 @@ while true; do
 	case $1 in
 	"-n")
 		ALLTARGET=allnoconfig
-		shift
-		continue
 		;;
 	"-m")
 		RUNMAKE=false
-		shift
-		continue
 		;;
 	"-h")
 		usage
@@ -62,8 +58,6 @@ while true; do
 		;;
 	"-r")
 		WARNREDUN=true
-		shift
-		continue
 		;;
 	"-O")
 		if [ -d $2 ];then
@@ -72,13 +66,14 @@ while true; do
 			echo "output directory $2 does not exist" 1>&2
 			exit 1
 		fi
-		shift 2
-		continue
+		shift
 		;;
 	*)
 		break
 		;;
 	esac
+
+	shift
 done
 
 if [ "$#" -lt 1 ] ; then
-- 
2.1.4

