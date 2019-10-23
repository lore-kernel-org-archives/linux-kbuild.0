Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:43096 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbfJWB4U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Oct 2019 21:56:20 -0400
Received: by mail-pg1-f194.google.com with SMTP id l24so6193338pgh.10
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 18:56:20 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH RESEND] scripts: setlocalversion: replace backquote to dollar parenthesis 
Date: Wed, 23 Oct 2019 07:24:27 +0530
Message-Id: <20191023015426.31169-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: nico-linuxsetlocalversion@schottelius.org, rdunlap@infradead.org, linux-kbuild@vger.kernel.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>

This patch replace backquote to dollar parenthesis syntax for better
readability.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
     Acked-by: Randy Dunlap <rdunlap@infradead.org>
     Acked-by: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
---
 scripts/setlocalversion | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index a2998b118ef9..d3f93de0d046 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -45,11 +45,11 @@ scm_version()

 	# Check for git and a git repo.
 	if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
-	   head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
+		head=$(git rev-parse --verify --short HEAD 2>/dev/null); then

 		# If we are at a tagged commit (like "v2.6.30-rc6"), we ignore
 		# it, because this version is defined in the top level Makefile.
-		if [ -z "`git describe --exact-match 2>/dev/null`" ]; then
+		if [ -z "$(git describe --exact-match 2>/dev/null)" ]; then

 			# If only the short version is requested, don't bother
 			# running further git commands
@@ -59,7 +59,7 @@ scm_version()
 			fi
 			# If we are past a tagged commit (like
 			# "v2.6.30-rc5-302-g72357d5"), we pretty print it.
-			if atag="`git describe 2>/dev/null`"; then
+			if atag="$(git describe 2>/dev/null)"; then
 				echo "$atag" | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'

 			# If we don't have a tag at all we print -g{commitish}.
@@ -70,7 +70,7 @@ scm_version()

 		# Is this git on svn?
 		if git config --get svn-remote.svn.url >/dev/null; then
-			printf -- '-svn%s' "`git svn find-rev $head`"
+			printf -- '-svn%s' "$(git svn find-rev $head)"
 		fi

 		# Check for uncommitted changes.
@@ -91,15 +91,15 @@ scm_version()
 	fi

 	# Check for mercurial and a mercurial repo.
-	if test -d .hg && hgid=`hg id 2>/dev/null`; then
+	if test -d .hg && hgid=$(hg id 2>/dev/null); then
 		# Do we have an tagged version?  If so, latesttagdistance == 1
-		if [ "`hg log -r . --template '{latesttagdistance}'`" = "1" ]; then
-			id=`hg log -r . --template '{latesttag}'`
+		if [ "$(hg log -r . --template '{latesttagdistance}')" = "1" ]; then
+			id=$(hg log -r . --template '{latesttag}')
 			printf '%s%s' -hg "$id"
 		else
-			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+			tag=$(printf '%s' "$hgid" | cut -d' ' -f2)
 			if [ -z "$tag" -o "$tag" = tip ]; then
-				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+				id=$(printf '%s' "$hgid" | sed 's/[+ ].*//')
 				printf '%s%s' -hg "$id"
 			fi
 		fi
@@ -115,8 +115,8 @@ scm_version()
 	fi

 	# Check for svn and a svn repo.
-	if rev=`LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'`; then
-		rev=`echo $rev | awk '{print $NF}'`
+	if rev=$(LANG= LC_ALL= LC_MESSAGES=C svn info 2>/dev/null | grep '^Last Changed Rev'); then
+		rev=$(echo $rev | awk '{print $NF}')
 		printf -- '-svn%s' "$rev"

 		# All done with svn
--
2.20.1
