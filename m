Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53939 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754268AbaFICRv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:51 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 4/7] scripts: objdiff: improve path flexibility for record command
Date: Mon,  9 Jun 2014 11:16:37 +0900
Message-Id: <1402280200-21834-5-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>

Prior to this commit, scripts/objdiff expected to be run at the top
directory and only the relative path of objects.

This commit provides more flexibility in terms of object path:

[1] scripts/objdiff can be run in any directory

For example,

  $ scripts/objdiff record init/main.o

and

  $ cd init; ../scripts/objdiff record main.o

produce the same result.

[2] Support absolute path for objects

  $ scripts/objdiff record /home/foo/bar/linux/init/main.o

work as well.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---

Changes in v2:
  - Fix a typo in commit description:  s/reltive/relative/

 scripts/objdiff | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index 6e72f96..499eb4b 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -25,7 +25,7 @@
 #
 # Note: 'make mrproper' will also remove .tmp_objdiff
 
-SRCTREE=$(git rev-parse --show-toplevel 2>/dev/null)
+SRCTREE=$(cd $(git rev-parse --show-toplevel 2>/dev/null); pwd)
 
 if [ -z "$SRCTREE" ]; then
 	echo >&2 "ERROR: Not a git repository."
@@ -42,6 +42,18 @@ usage() {
 	exit 1
 }
 
+get_output_dir() {
+	dir=${1%/*}
+
+	if [ "$dir" = "$1" ]; then
+		dir=.
+	fi
+
+	dir=$(cd $dir; pwd)
+
+	echo $TMPD/$CMT${dir#$SRCTREE}
+}
+
 dorecord() {
 	[ $# -eq 0 ] && usage
 
@@ -50,18 +62,16 @@ dorecord() {
 	CMT="`git rev-parse --short HEAD`"
 
 	OBJDUMP="${CROSS_COMPILE}objdump"
-	OBJDIFFD="$TMPD/$CMT"
 
 	for f in $FILES; do
-		dn="${f%/*}"
+		dir=$(get_output_dir $f)
 		bn="${f##*/}"
 
-		[ ! -d "$OBJDIFFD/$dn" ] && mkdir -p "$OBJDIFFD/$dn"
+		[ ! -d "$dir" ] && mkdir -p $dir
 
 		# remove addresses for a more clear diff
 		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
-		$OBJDUMP -D "$f" | sed "s/^[[:space:]]\+[0-9a-f]\+//" \
-			>"$OBJDIFFD/$dn/$bn"
+		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dir/$bn
 	done
 }
 
-- 
1.9.1

