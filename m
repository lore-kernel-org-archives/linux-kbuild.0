Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37464 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758077AbYAXWD5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:57 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 30/77] kbuild: eradicate bashisms in scripts/patch-kernel
Date: Thu, 24 Jan 2008 23:03:11 +0100
Message-Id: <1201212238-4369-30-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andreas Mohr <andi@lisas.de>, Sam Ravnborg <sam@ravnborg.org>

From: Andreas Mohr <andi@lisas.de>

Make the patch-kernel shell script sufficiently compatible with POSIX
shells, i.e., remove bashisms from scripts/patch-kernel.
This means that it now also works on dash 0.5.3-5
and still works on bash 3.1dfsg-8.

Full changelog:
- replaced non-standard "==" by standard "="
- replaced non-standard "source" statement by POSIX "dot" command
- use leading ./ on mktemp filename to force the tempfile to a local
  directory, so that the search path is not used
- replace bash syntax to remove leading dot by similar POSIX syntax
- added missing (optional/not required) $ signs to shell variable names

Signed-off-by: Andreas Mohr <andi@lisas.de>
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/patch-kernel |   22 ++++++++++------------
 1 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/scripts/patch-kernel b/scripts/patch-kernel
index 67e4b18..ece46ef 100755
--- a/scripts/patch-kernel
+++ b/scripts/patch-kernel
@@ -65,7 +65,7 @@ sourcedir=${1-/usr/src/linux}
 patchdir=${2-.}
 stopvers=${3-default}
 
-if [ "$1" == -h -o "$1" == --help -o ! -r "$sourcedir/Makefile" ]; then
+if [ "$1" = -h -o "$1" = --help -o ! -r "$sourcedir/Makefile" ]; then
 cat << USAGE
 usage: $PNAME [-h] [ sourcedir [ patchdir [ stopversion ] [ -acxx ] ] ]
   source directory defaults to /usr/src/linux,
@@ -182,10 +182,12 @@ reversePatch () {
 }
 
 # set current VERSION, PATCHLEVEL, SUBLEVEL, EXTRAVERSION
-TMPFILE=`mktemp .tmpver.XXXXXX` || { echo "cannot make temp file" ; exit 1; }
+# force $TMPFILEs below to be in local directory: a slash character prevents
+# the dot command from using the search path.
+TMPFILE=`mktemp ./.tmpver.XXXXXX` || { echo "cannot make temp file" ; exit 1; }
 grep -E "^(VERSION|PATCHLEVEL|SUBLEVEL|EXTRAVERSION)" $sourcedir/Makefile > $TMPFILE
 tr -d [:blank:] < $TMPFILE > $TMPFILE.1
-source $TMPFILE.1
+. $TMPFILE.1
 rm -f $TMPFILE*
 if [ -z "$VERSION" -o -z "$PATCHLEVEL" -o -z "$SUBLEVEL" ]
 then
@@ -202,11 +204,7 @@ echo "Current kernel version is $VERSION.$PATCHLEVEL.$SUBLEVEL${EXTRAVERSION} ($
 EXTRAVER=
 if [ x$EXTRAVERSION != "x" ]
 then
-	if [ ${EXTRAVERSION:0:1} == "." ]; then
-		EXTRAVER=${EXTRAVERSION:1}
-	else
-		EXTRAVER=$EXTRAVERSION
-	fi
+	EXTRAVER=${EXTRAVERSION#.}
 	EXTRAVER=${EXTRAVER%%[[:punct:]]*}
 	#echo "$PNAME: changing EXTRAVERSION from $EXTRAVERSION to $EXTRAVER"
 fi
@@ -251,16 +249,16 @@ while :				# incrementing SUBLEVEL (s in v.p.s)
 do
     CURRENTFULLVERSION="$VERSION.$PATCHLEVEL.$SUBLEVEL"
     EXTRAVER=
-    if [ $stopvers == $CURRENTFULLVERSION ]; then
+    if [ $stopvers = $CURRENTFULLVERSION ]; then
         echo "Stopping at $CURRENTFULLVERSION base as requested."
         break
     fi
 
-    SUBLEVEL=$((SUBLEVEL + 1))
+    SUBLEVEL=$(($SUBLEVEL + 1))
     FULLVERSION="$VERSION.$PATCHLEVEL.$SUBLEVEL"
     #echo "#___ trying $FULLVERSION ___"
 
-    if [ $((SUBLEVEL)) -gt $((STOPSUBLEVEL)) ]; then
+    if [ $(($SUBLEVEL)) -gt $(($STOPSUBLEVEL)) ]; then
 	echo "Stopping since sublevel ($SUBLEVEL) is beyond stop-sublevel ($STOPSUBLEVEL)"
 	exit 1
     fi
@@ -297,7 +295,7 @@ fi
 if [ x$gotac != x ]; then
   # Out great user wants the -ac patches
 	# They could have done -ac (get latest) or -acxx where xx=version they want
-	if [ $gotac == "-ac" ]; then
+	if [ $gotac = "-ac" ]; then
 	  # They want the latest version
 		HIGHESTPATCH=0
 		for PATCHNAMES in $patchdir/patch-${CURRENTFULLVERSION}-ac*\.*
-- 
1.5.4.rc3.14.g44397

