Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:47185 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757776Ab3GLW0o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Jul 2013 18:26:44 -0400
Received: by mail-we0-f175.google.com with SMTP id t59so8305919wes.6
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2013 15:26:43 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH v2] scripts/config: use sed's POSIX interface
Date: Sat, 13 Jul 2013 00:26:17 +0200
Message-Id: <1373667977-8034-1-git-send-email-chauplac@gmail.com>
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

Rewrite calls to `sed' to comply with POSIX interface, and move them
to helper functions.

Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
---
Changes in v2:
- ANSI C style quoting to produce newlines ($'\n') is replaced with
  printf's, not to introduce further dependency on bash.
- helper functions are introduced to wrap calls to `sed'.

 scripts/config | 41 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index a65ecbb..a01bc11 100755
--- a/scripts/config
+++ b/scripts/config
@@ -60,15 +60,48 @@ checkarg() {
 	fi
 }
 
+txt_append() {
+	local anchor="$1"
+	local insert="$2"
+	local infile="$3"
+	local outfile="$4"
+
+	# sed append cmd: 'a\' + newline + text + newline
+	cmd="$(printf "a\\%b$insert%b" "\n" "\n")"
+
+	sed -e "/$anchor/$cmd" "$infile" >"$outfile"
+}
+
+txt_subst() {
+	local before="$1"
+	local after="$2"
+	local infile="$3"
+	local outfile="$4"
+
+	sed -e "s/$before/$after/" "$infile" >"$outfile"
+}
+
+txt_delete() {
+	local text="$1"
+	local infile="$2"
+	local outfile="$3"
+
+	sed -e "/$text/d" "$infile" >"$outfile"
+}
+
 set_var() {
 	local name=$1 new=$2 before=$3
 
 	name_re="^($name=|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		sed -ri "/$before_re/a $new" "$FN"
+		txt_append "^$before=" "$new" "$FN" "$FN.swp"
+		txt_append "^# $before is not set" "$new" "$FN.swp" "$FN"
+		rm "$FN.swp"
 	elif grep -Eq "$name_re" "$FN"; then
-		sed -ri "s:$name_re.*:$new:" "$FN"
+		txt_subst "^$name=.*" "$new" "$FN" "$FN.swp"
+		txt_subst "^# $name is not set" "$new" "$FN.swp" "$FN"
+		rm "$FN.swp"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -77,7 +110,9 @@ set_var() {
 undef_var() {
 	local name=$1
 
-	sed -ri "/^($name=|# $name is not set)/d" "$FN"
+	txt_delete "^$name=" "$FN" "$FN.swp"
+	txt_delete "^# $name is not set" "$FN.swp" "$FN"
+	rm "$FN.swp"
 }
 
 if [ "$1" = "--file" ]; then
-- 
1.8.3.rc1.44.gb387c77.dirty

