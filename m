Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:42831 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758920AbYAXWDw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:52 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 33/77] kbuild: fix false positive -dirty tag caused by make-kpkg
Date: Thu, 24 Jan 2008 23:03:14 +0100
Message-Id: <1201212238-4369-33-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, Sam Ravnborg <sam@ravnborg.org>

From: Theodore Ts'o <tytso@mit.edu>

make-kpkg modifies scripts/package/Makefile and deletes
scripts/package/builddeb as part of its build process.  Ignore these
changes so the tree isn't marked as -dirty, when it is just an
artifact of make-kpkg.  (make-kpkg clean restores the files to their
original state, and these helper scripts won't affect the final
compiled kernel in any way.)

Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index acce8eb..52f032e 100644
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -17,7 +17,8 @@ if head=`git rev-parse --verify HEAD 2>/dev/null`; then
 
 	# Are there uncommitted changes?
 	git update-index --refresh --unmerged > /dev/null
-	if git diff-index HEAD | read dummy; then
+	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
+	    | read dummy; then
 		printf '%s' -dirty
 	fi
 
-- 
1.5.4.rc3.14.g44397

