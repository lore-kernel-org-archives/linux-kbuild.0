Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:34933 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753924AbbETWCg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 May 2015 18:02:36 -0400
Received: by pdea3 with SMTP id a3so83652322pde.2
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2015 15:02:36 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 03/10] merge_config.sh: minor argument parsing refactoring
Date: Wed, 20 May 2015 15:00:53 -0700
Message-Id: <1432159260-39390-4-git-send-email-olof@lixom.net>
In-Reply-To: <1432159260-39390-1-git-send-email-olof@lixom.net>
References: <1432159260-39390-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, john.stultz@linaro.org, jwboyer@redhat.com, Olof Johansson <olof@lixom.net>

Every case that continues iterating needs a shift, so move it to common location.
Also, the continues are redundant.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 5a01aa6..fb0c463 100755
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
 
 if [ "$#" -lt 2 ] ; then
-- 
1.7.10.4

