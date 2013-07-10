Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:58102 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051Ab3GJT6V (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jul 2013 15:58:21 -0400
Received: by mail-wg0-f49.google.com with SMTP id a12so6196567wgh.4
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2013 12:58:20 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH] scripts/config: use sed's POSIX interface
Date: Wed, 10 Jul 2013 21:58:08 +0200
Message-Id: <1373486288-715-1-git-send-email-chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, ak@linux.intel.com, yann.morin.1998@free.fr

Script `config' relies on extensions of `GNU sed', and is thus not
working on all Unixes:
- in-place edition of files (-i), which can be replaced with
a temporary file;
- extended-regexps (-r), which can be split into basic regexps;
- single-line calls to `a' command, while some implementations
require a leading newline before the parameter.

Rewrite calls to `sed' program to comply with POSIX interface.

Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
---
 scripts/config | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index a65ecbb..3fd95eb 100755
--- a/scripts/config
+++ b/scripts/config
@@ -66,9 +66,14 @@ set_var() {
 	name_re="^($name=|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		sed -ri "/$before_re/a $new" "$FN"
+		lf=$'\n'
+		sed -e "/^$before=/a\\$lf$new$lf" \
+		    -e "/^# $before is not set/a\\$lf$new$lf" "$FN" >"$FN.swp"
+		mv "$FN.swp" "$FN"
 	elif grep -Eq "$name_re" "$FN"; then
-		sed -ri "s:$name_re.*:$new:" "$FN"
+		sed -e "s:^$name=.*:$new:" \
+		    -e "s:^# $name is not set:$new:" "$FN" >"$FN.swp"
+		mv "$FN.swp" "$FN"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -77,7 +82,8 @@ set_var() {
 undef_var() {
 	local name=$1
 
-	sed -ri "/^($name=|# $name is not set)/d" "$FN"
+	sed -e "/^$name=/d" -e "/^# $name is not set/d" "$FN" >"$FN.swp"
+	mv "$FN.swp" "$FN"
 }
 
 if [ "$1" = "--file" ]; then
-- 
1.8.3.rc1.44.gb387c77.dirty

