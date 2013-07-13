Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:46238 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932571Ab3GMOhL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Jul 2013 10:37:11 -0400
Received: by mail-wi0-f179.google.com with SMTP id hj3so1563939wib.12
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jul 2013 07:37:09 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH v3] scripts/config: use sed's POSIX interface
Date: Sat, 13 Jul 2013 16:36:56 +0200
Message-Id: <1373726216-13415-1-git-send-email-chauplac@gmail.com>
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
Changes v2 -> v3:
  - Moved temporary files handling to txt_* helper functions.
  - Removed useless trailing slash in sed's append command parameter.
  - Edited commit message.

Changes v1 -> v2:
  - ANSI C style quoting to produce newlines ($'\n') is replaced with
    printf's, not to introduce further dependency on bash.
  - helper functions are introduced to wrap calls to `sed'.

 scripts/config | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index a65ecbb..58383e2 100755
--- a/scripts/config
+++ b/scripts/config
@@ -60,15 +60,52 @@ checkarg() {
 	fi
 }
 
+txt_append() {
+	local anchor="$1"
+	local insert="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	# sed append cmd: 'a\' + newline + text + newline
+	cmd="$(printf "a\\%b$insert" "\n")"
+
+	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
+txt_subst() {
+	local before="$1"
+	local after="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	sed -e "s/$before/$after/" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
+txt_delete() {
+	local text="$1"
+	local infile="$2"
+	local tmpfile="$infile.swp"
+
+	sed -e "/$text/d" "$infile" >"$tmpfile"
+	# replace original file with the edited one
+	mv "$tmpfile" "$infile"
+}
+
 set_var() {
 	local name=$1 new=$2 before=$3
 
 	name_re="^($name=|# $name is not set)"
 	before_re="^($before=|# $before is not set)"
 	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
-		sed -ri "/$before_re/a $new" "$FN"
+		txt_append "^$before=" "$new" "$FN"
+		txt_append "^# $before is not set" "$new" "$FN"
 	elif grep -Eq "$name_re" "$FN"; then
-		sed -ri "s:$name_re.*:$new:" "$FN"
+		txt_subst "^$name=.*" "$new" "$FN"
+		txt_subst "^# $name is not set" "$new" "$FN"
 	else
 		echo "$new" >>"$FN"
 	fi
@@ -77,7 +114,8 @@ set_var() {
 undef_var() {
 	local name=$1
 
-	sed -ri "/^($name=|# $name is not set)/d" "$FN"
+	txt_delete "^$name=" "$FN"
+	txt_delete "^# $name is not set" "$FN"
 }
 
 if [ "$1" = "--file" ]; then
-- 
1.8.3.rc1.44.gb387c77.dirty

