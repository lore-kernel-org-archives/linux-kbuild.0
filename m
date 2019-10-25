Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46032 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389796AbfJYIGJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Oct 2019 04:06:09 -0400
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Date: Fri, 25 Oct 2019 13:35:44 +0530
Message-Id: <20191025080544.7209-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: torvalds@linux-foundation.org, rdunlap@infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch will replace backquote to dollar parenthesis syntax
for better readability.Corrected one.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/patch-kernel | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index 033d5916797d..6f9443336f9a 100755
--- a/scripts/patch-kernel
+++ b/scripts/patch-kernel
@@ -153,7 +153,7 @@ applyPatch () {
     echo "failed.  Clean up yourself."
     return 1;
   fi
-  if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
+  if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
   then
     echo "Aborting.  Reject files found."
     return 1;
@@ -175,7 +175,7 @@ reversePatch () {
 		echo "failed.  Clean it up."
 		exit 1
 	fi
-	if [ "`find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ]
+	if [ "$(find $sourcedir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print)" ]
 	then
 		echo "Aborting.  Reject files found."
 		return 1
@@ -189,7 +189,7 @@ reversePatch () {
 # set current VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
 # force $TMPFILEs below to be in local directory: a slash character prevents
 # the dot command from using the search path.
-TMPFILE=`mktemp ./.tmpver.XXXXXX` || { echo "cannot make temp file" ; exit 1; }
+TMPFILE=$(mktemp ./.tmpver.XXXXXX) || { echo "cannot make temp file" ; exit 1; }
 grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMPFILE
 tr -d [:blank:] < $TMPFILE > $TMPFILE.1
 . $TMPFILE.1
@@ -200,7 +200,7 @@ then
     exit 1
 fi

-NAME=`grep ^NAME $sourcedir/Makefile`
+NAME=$(grep ^NAME $sourcedir/Makefil)
 NAME=${NAME##*=}

 echo "Current kernel version is $VERSION.$PATCHLEVEL.$SUBLEVEL${EXTRAVERSION} ($NAME)"
@@ -216,8 +216,8 @@ fi

 #echo "stopvers=$stopvers"
 if [ $stopvers != "default" ]; then
-	STOPSUBLEVEL=`echo $stopvers | cut -d. -f3`
-	STOPEXTRA=`echo $stopvers | cut -d. -f4`
+	STOPSUBLEVEL=$(echo $stopvers | cut -d. -f3)
+	STOPEXTRA=$(echo $stopvers | cut -d. -f4)
 	STOPFULLVERSION=${stopvers%%.$STOPEXTRA}
 	#echo "#___STOPSUBLEVEL=/$STOPSUBLEVEL/, STOPEXTRA=/$STOPEXTRA/"
 else
@@ -306,7 +306,7 @@ if [ x$gotac != x ]; then
 		HIGHESTPATCH=0
 		for PATCHNAMES in $patchdir/patch-${CURRENTFULLVERSION}-ac*\.*
 		do
-			ACVALUE=`echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/'`
+			ACVALUE=$(echo $PATCHNAMES | sed -e 's/^.*patch-[0-9.]*-ac\([0-9]*\).*/\1/')
 			# Check it is actually a recognised patch type
 			findFile $patchdir/patch-${CURRENTFULLVERSION}-ac${ACVALUE} || break

--
2.20.1
