Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53922 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754257AbaFICRt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:49 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 2/7] scripts: objdiff: direct error messages to stderr
Date: Mon,  9 Jun 2014 11:16:35 +0900
Message-Id: <1402280200-21834-3-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---

Changes in v2: None

 scripts/objdiff | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index b8f7fc6..cc67365 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -28,17 +28,17 @@
 SRCTREE=$(git rev-parse --show-toplevel 2>/dev/null)
 
 if [ -z "$SRCTREE" ]; then
-	echo "ERROR: Not a git repository."
+	echo >&2 "ERROR: Not a git repository."
 	exit 1
 fi
 
 TMPD=$SRCTREE/.tmp_objdiff
 
 usage() {
-	echo "Usage: $0 <command> <args>"
-	echo "  record    <list of object files>"
-	echo "  diff      <commitA> <commitB>"
-	echo "  clean     all | <commit>"
+	echo >&2 "Usage: $0 <command> <args>"
+	echo >&2 "  record    <list of object files>"
+	echo >&2 "  diff      <commitA> <commitB>"
+	echo >&2 "  clean     all | <commit>"
 	exit 1
 }
 
@@ -88,12 +88,12 @@ dodiff() {
 	DSTD="$TMPD/$DST"
 
 	if [ ! -d "$SRCD" ]; then
-		echo "ERROR: $SRCD doesn't exist"
+		echo >&2 "ERROR: $SRCD doesn't exist"
 		exit 1
 	fi
 
 	if [ ! -d "$DSTD" ]; then
-		echo "ERROR: $DSTD doesn't exist"
+		echo >&2 "ERROR: $DSTD doesn't exist"
 		exit 1
 	fi
 
@@ -112,7 +112,7 @@ doclean() {
 		if [ -d "$TMPD/$CMT" ]; then
 			rm -rf $TMPD/$CMT
 		else
-			echo "$CMT not found"
+			echo >&2 "$CMT not found"
 		fi
 	fi
 }
@@ -133,7 +133,7 @@ case "$1" in
 		doclean $*
 		;;
 	*)
-		echo "Unrecognized command '$1'"
+		echo >&2 "Unrecognized command '$1'"
 		exit 1
 		;;
 esac
-- 
1.9.1

