Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57775 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751941AbbCMGW1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:27 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 5/6] merge_config.sh: rename MAKE to RUNMAKE
Date: Fri, 13 Mar 2015 15:21:42 +0900
Message-Id: <1426227703-31815-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

The variable "MAKE" is used to store the command name that has
invoked the Makefile.  (Actually, it is already set to "make"
if you run this script from a Makefile.)

In this script, however, it is used to determine if Make should be
run or not.  It is not what we usually expect.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/merge_config.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 56584b1..ec8e203 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -35,7 +35,7 @@ usage() {
 	echo "  -O    dir to put generated output files"
 }
 
-MAKE=true
+RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 OUTPUT=.
@@ -48,7 +48,7 @@ while true; do
 		continue
 		;;
 	"-m")
-		MAKE=false
+		RUNMAKE=false
 		shift
 		continue
 		;;
@@ -119,7 +119,7 @@ for MERGE_FILE in $MERGE_LIST ; do
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
-if [ "$MAKE" = "false" ]; then
+if [ "$RUNMAKE" = "false" ]; then
 	cp $TMP_FILE $OUTPUT/.config
 	echo "#"
 	echo "# merged configuration written to $OUTPUT/.config (needs make)"
-- 
1.9.1

