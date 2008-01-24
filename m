Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37450 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759064AbYAXWDz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:03:55 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 31/77] kbuild: change CONFIG_LOCALVERSION_AUTO to use a git-describe-ish format
Date: Thu, 24 Jan 2008 23:03:12 +0100
Message-Id: <1201212238-4369-31-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Theodore Ts'o <tytso@mit.edu>, Sam Ravnborg <sam@ravnborg.org>

From: Theodore Ts'o <tytso@mit.edu>

Change the automatic local version to have the form -nnnnn-gSHA1SUMID,
where 'nnnnn' is the number of commits since the last tag (i.e.,
2.6.21-rc7).  This makes it much more likely that the package names created
for the kernel will look "newer" to a package manager.

Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/setlocalversion |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index a80d6ea..1b31da8 100644
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -12,7 +12,7 @@ cd "${1:-.}" || usage
 if head=`git rev-parse --verify HEAD 2>/dev/null`; then
 	# Do we have an untagged version?
 	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
-		printf '%s%s' -g `echo "$head" | cut -c1-8`
+	        git describe | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
 	fi
 
 	# Are there uncommitted changes?
-- 
1.5.4.rc3.14.g44397

