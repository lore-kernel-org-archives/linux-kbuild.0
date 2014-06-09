Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:53342 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754271AbaFICRx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Jun 2014 22:17:53 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 7/7] scripts: objdiff: support directories for the augument of record command
Date: Mon,  9 Jun 2014 11:16:40 +0900
Message-Id: <1402280200-21834-8-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402280200-21834-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Masahiro Yamada <yamada.m@jp.panasonic.com>

For example,

  $ scripts/objdiff record init drivers/usb

disassembles all the objects under init and drivers/usb directories.

This feature would be useful when we change various files under the
specific directory.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---

Changes in v2: None

 scripts/objdiff | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/scripts/objdiff b/scripts/objdiff
index 0644898..62e51da 100755
--- a/scripts/objdiff
+++ b/scripts/objdiff
@@ -36,7 +36,7 @@ TMPD=$SRCTREE/.tmp_objdiff
 
 usage() {
 	echo >&2 "Usage: $0 <command> <args>"
-	echo >&2 "  record    <list of object files>"
+	echo >&2 "  record    <list of object files or directories>"
 	echo >&2 "  diff      <commitA> <commitB>"
 	echo >&2 "  clean     all | <commit>"
 	exit 1
@@ -54,6 +54,18 @@ get_output_dir() {
 	echo $TMPD/$CMT${dir#$SRCTREE}
 }
 
+do_objdump() {
+	dir=$(get_output_dir $1)
+	base=${1##*/}
+	dis=$dir/${base%.o}.dis
+
+	[ ! -d "$dir" ] && mkdir -p $dir
+
+	# remove addresses for a cleaner diff
+	# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
+	$OBJDUMP -D $1 | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
+}
+
 dorecord() {
 	[ $# -eq 0 ] && usage
 
@@ -63,16 +75,15 @@ dorecord() {
 
 	OBJDUMP="${CROSS_COMPILE}objdump"
 
-	for f in $FILES; do
-		dir=$(get_output_dir $f)
-		base=${f##*/}
-		dis=$dir/${base%.o}.dis
-
-		[ ! -d "$dir" ] && mkdir -p $dir
-
-		# remove addresses for a cleaner diff
-		# http://dummdida.tumblr.com/post/60924060451/binary-diff-between-libc-from-scientificlinux-and
-		$OBJDUMP -D $f | sed "s/^[[:space:]]\+[0-9a-f]\+//" > $dis
+	for d in $FILES; do
+		if [ -d "$d" ]; then
+			for f in $(find $d -name '*.o')
+			do
+				do_objdump $f
+			done
+		else
+			do_objdump $d
+		fi
 	done
 }
 
-- 
1.9.1

