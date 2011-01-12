Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:58949 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751755Ab1ALFp7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 12 Jan 2011 00:45:59 -0500
From: Mike Frysinger <vapier@gentoo.org>
Subject: [PATCH] setlocalversion: update mercurial tag parsing
Date: Wed, 12 Jan 2011 00:53:52 -0500
Message-Id: <1294811632-23688-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Mike Crowe <mcrowe@zipitwireless.com>

From: Mike Crowe <mcrowe@zipitwireless.com>

The tag output of hg doesn't quite match what setlocalversion currently
expects, so update it to handle the latest format.

Signed-off-by: Mike Crowe <mcrowe@zipitwireless.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 scripts/setlocalversion |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index ef8729f..4d40384 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -86,12 +86,16 @@ scm_version()
 
 	# Check for mercurial and a mercurial repo.
 	if test -d .hg && hgid=`hg id 2>/dev/null`; then
-		tag=`printf '%s' "$hgid" | cut -s -d' ' -f2`
-
-		# Do we have an untagged version?
-		if [ -z "$tag" -o "$tag" = tip ]; then
-			id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+		# Do we have an tagged version?  If so, latesttagdistance == 1
+		if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
+			id=`hg log -r . --template '{latesttag}'`
 			printf '%s%s' -hg "$id"
+		else
+			tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+			if [ -z "$tag" -o "$tag" = tip ]; then
+				id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+				printf '%s%s' -hg "$id"
+			fi
 		fi
 
 		# Are there uncommitted changes?
-- 
1.7.4.rc1

